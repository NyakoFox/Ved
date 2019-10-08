--[[ A brief guide:

Create a new input by doing `input.create(<type>, <id>, [initial], [initial_x], [initial_y])`.

`<type>` is INPUT.ONELINE or INPUT.MULTILINE and `<id>` is a string
(but if you really wanted it could be anything that can be used as a table index)

`[initial]` is optional. Pass one string for oneline, or a table of strings for
multiline, to first set the input to whatever you give it.

`[initial_x]` is optional and defaults to the end of the initial line given.

`[initial_y]` is optional, is for multiline, and defaults to the first line.

Then for whatever you're editing, say a variable named `thingbeingedited`, all
you have to do is `thingbeingedited = inputs.<id>` (note the plural "inputs")

You also need to call `input.drawcas(<id>, <x>, <y>, [scale_x], [scale_y])`
with the top-left corner of whatever text you're drawing for the blinking cursor
(aka caret) and selection box after you print the text.
(Read "drawcas" as "draw caret and selection".)
`[scale_x]` defaults to 1.
`[scale_y]` defaults to `[scale_x]`.

If you want to index by number (where the last number is the most
recently-opened input), then use `nth_input`. Use `input_ids` and `input_ns` to
convert between indexing by ID and indexing by number.

If you need the current position, for oneline it's `inputpos.<id>`
For multiline, the x-position is `inputpos.<id>[1]`,
the y-position `inputpos.<id>[2]`

When typing, the input prioritized will be the most recently-opened input.

If you need to temporarily stop taking input, just do `input.pause()`. Though
don't forget to do `input.resume()` when you want to enable it again (and don't
want to create a new input, which enables it automatically)

To focus an input so all further typing will go there, just do
`input.bump(<id>)`.

When you're done, close it by doing `input.close(<id>)`.

]]

input = {active = false}

inputs = {}
nth_input = {}
input_ids = {}
input_ns = {}

inputpos = {}
inputsrightmost = {}
inputselpos = {}

function input.create(type_, id, initial, ix, iy)
	input.active = true

	if inputs[id] ~= nil then
		return
	end

	if type_ == INPUT.ONELINE then
		initial = tostring(anythingbutnil(initial))
	elseif type_ == INPUT.MULTILINE then
		initial = initial or {""}
		if #initial == 0 or type(initial) ~= "table" then
			-- wtf, why would you take the time to type {} or anything else
			-- if you want it empty?
			initial = {""}
		end
		local tmp = {}
		for k,v in pairs(initial) do
			tmp[k] = tostring(anythingbutnil(v))
		end
		initial = table.copy(tmp)
	end

	iy = iy or 1
	if ix == nil then
		if type_ == INPUT.ONELINE then
			ix = #initial
		elseif type_ == INPUT.MULTILINE then
			ix = #initial[iy]
		end
	end

	inputs[id] = initial
	table.insert(nth_input, inputs[id])
	if type_ == INPUT.ONELINE then
		inputpos[id] = ix
	elseif type_ == INPUT.MULTILINE then
		inputpos[id] = {ix, iy}
	end

	cursorflashtime = 0
	inputcopiedtimer = 0
	input_ids[#nth_input] = id
	input_ns[id] = #nth_input
	inputsrightmost[id] = false
end

function input.close(id, updatemappings)
	if updatemappings == nil then
		updatemappings = true
	end

	local removethisn = input_ns[id]

	table.remove(nth_input, removethisn)
	inputs[id] = nil
	table.remove(input_ids, removethisn)
	input_ns[id] = nil
	inputpos[id] = nil

	if updatemappings then
		input.updatemappings()
	end

	if #nth_input == 0 then
		input.active = false
	end

	cursorflashtime = 0
	inputcopiedtimer = 0
	inputsrightmost[id] = nil
	inputselpos[id] = nil
end

function input.updatemappings()
	for n, id in pairs(input_ids) do
		input_ns[id] = n
	end
end

function input.closeall()
	for id in pairs(inputs) do
		input.close(id, false)
	end
end

function input.pause()
	input.active = false
end

function input.resume()
	if #nth_input > 0 then
		input.active = true
		cursorflashtime = 0
		inputcopiedtimer = 0
	end
end

function input.bump(id)
	input.active = true

	local oldn = input_ns[id]

	table.remove(nth_input, oldn)
	table.insert(nth_input, inputs[id])

	table.remove(input_ids, oldn)
	table.insert(input_ids, id)

	input.updatemappings()

	cursorflashtime = 0
	inputcopiedtimer = 0
end

function input.drawcas(id, x, y, sx, sy)
	if not input.active then
		return
	end

	-- Make sure we're drawing the cas of the currently focused input
	if id ~= input_ids[#nth_input] then
		return
	end

	local multiline = type(inputs[id]) == "table"

	sx = sx or 1
	sy = sy or sx

	local thisfont = love.graphics.getFont()

	-- Selection

	if inputselpos[id] ~= nil then
		local selrects = {} -- each table in this table: {x (pixels), y (line), width (pixels)}
		local whichfirst -- 1 = caret pos, 2 = selection pos
		local startx, starty, endx, endy

		if multiline then
			local lines = inputs[id]
			local curx, cury = unpack(inputpos[id])
			local selx, sely = unpack(inputselpos[id])
			if inputsrightmost[id] then
				curx = #lines[cury]
			end

			if cury < sely then
				whichfirst = 1
			elseif sely < cury then
				whichfirst = 2
			elseif curx < selx then
				whichfirst = 1
			elseif selx < curx then
				whichfirst = 2
			end

			if whichfirst == 1 then
				startx, starty = curx, cury
				endx, endy = selx, sely
			elseif whichfirst == 2 then
				startx, starty = selx, sely
				endx, endy = curx, cury
			end

			local curlinewidth = 0
			local firstoffset = 0

			local line
			local thiswidth

			local nested_break = false
			if whichfirst ~= nil then
				for l = starty, endy do
					line = lines[l]

					if l == starty then
						firstoffset = thisfont:getWidth(utf8.sub(line, 1, startx))
						if l == endy then
							curlinewidth = thisfont:getWidth(utf8.sub(line, startx+1, endx))
						else
							curlinewidth = thisfont:getWidth(utf8.sub(line, startx+1, utf8.len(line)))
							-- Add a small space to represent the newline
							curlinewidth = curlinewidth + 4
						end
						table.insert(selrects, {firstoffset, l, curlinewidth})
					else
						if l == endy then
							curlinewidth = thisfont:getWidth(utf8.sub(line, 1, endx))
						else
							curlinewidth = thisfont:getWidth(utf8.sub(line, 1, utf8.len(line)))
							-- Again, add a small space to represent the newline
							curlinewidth = curlinewidth + 4
						end
						table.insert(selrects, {0, l, curlinewidth})
					end
				end
			end
		else
			local line = inputs[id]
			local curx = inputpos[id]
			local selx = inputselpos[id]
			if inputsrightmost[id] then
				curx = #line
			end

			if curx < selx then
				whichfirst = 1
			elseif selx < curx then
				whichfirst = 2
			end

			if whichfirst == 1 then
				startx, endx = curx, selx
			elseif whichfirst == 2 then
				startx, endx = selx, curx
			end

			local curlinewidth = 0
			local firstoffset = 0

			local thisline
			local centeroffset = 0

			local thiswidth

			if whichfirst ~= nil then
				firstoffset = thisfont:getWidth(utf8.sub(line, 1, startx))
				curlinewidth = thisfont:getWidth(utf8.sub(line, startx+1, endx))
				table.insert(selrects, {firstoffset, 0, curlinewidth})
			end
		end

		local oldcol = {love.graphics.getColor()}

		love.graphics.setColor(0, 127, 255, 127) -- Blue-ish, like a typical selection
		if inputcopiedtimer > 0 then
			love.graphics.setColor(255, 255, 127, 127) -- To let the user know they've copied the text
		end

		for _, rect in pairs(selrects) do
			love.graphics.rectangle("fill", x + rect[1]*sx, y + rect[2]*thisfont:getHeight()*sy, rect[3]*sx, thisfont:getHeight()*sy)
		end

		love.graphics.setColor(unpack(oldcol))
	end

	-- Caret

	if cursorflashtime > .5 then
		return
	end

	local caretx, carety
	if multiline then
		carety = inputpos[id][2]
		local line = inputs[id][carety]
		local postoget = inputpos[id][1]
		if inputsrightmost[id] then
			postoget = #line
		end
		-- If we're coming from a line with more chars,
		-- treat it like it's at the end of the line
		postoget = math.min(postoget, #line)

		caretx = thisfont:getWidth(utf8.sub(line, 1, postoget))
	else
		local line = inputs[id]
		local postoget = inputpos[id]
		if inputsrightmost[id] then
			postoget = utf8.len(line)
		end
		carety = 0

		caretx = thisfont:getWidth(utf8.sub(line, 1, postoget))
	end
	caretx = anythingbutnil0(caretx)
	carety = anythingbutnil0(carety)

	carety = carety * thisfont:getHeight() -- not accounting for other things like line height, I suppose

	caretx = caretx * sx
	carety = carety * sy

	love.graphics.line(x + caretx, y + carety, x + caretx, y + carety + thisfont:getHeight()*sy)
end

function input.movex(id, chars)
	local multiline = type(inputpos[id]) == "table"

	local x, y, line
	if multiline then
		x, y = unpack(inputpos[id])
		line = inputs[id][y]
	else
		x = inputpos[id]
		line = inputs[id]
	end

	if inputsrightmost[id] then
		x = utf8.len(line)
	end

	x = math.min(math.max(x, 0), utf8.len(line))
	x = x + chars
	x = math.min(math.max(x, 0), utf8.len(line))

	if multiline then
		inputpos[id][1] = x
	else
		inputpos[id] = x
	end

	cursorflashtime = 0
	inputcopiedtimer = 0

	inputsrightmost[id] = false

	if inputselpos[id] ~= nil then
		local conditional
		if multiline then
			conditional = x == inputselpos[id][1] and y == inputselpos[id][2]
		else
			conditional = x == inputselpos[id]
		end
		if conditional then
			input.clearselpos(id)
		end
	end
end

function input.movey(id, chars)
	local multiline = type(inputpos[id]) == "table"

	if not multiline then
		if inputselpos[id] ~= nil then
			input.clearselpos(id)
		end
		return
	end

	local lines = inputs[id]
	local y = inputpos[id][2]

	y = y + chars
	y = math.min(math.max(y, 1), #lines)

	inputpos[id][2] = y

	cursorflashtime = 0
	inputcopiedtimer = 0

	if inputselpos[id] ~= nil and inputpos[id][1] == inputselpos[id][1] and inputpos[id][2] == inputselpos[id][2] then
		input.clearselpos(id)
	end
end

function input.leftmost(id)
	local multiline = type(inputpos[id]) == "table"

	if multiline then
		inputpos[id][1] = 0
	else
		inputpos[id] = 0
	end

	cursorflashtime = 0
	inputcopiedtimer = 0

	inputsrightmost[id] = false

	if inputselpos[id] ~= nil then
		local conditional
		if multiline then
			conditional = inputpos[id][1] == inputselpos[id][1] and inputpos[id][2] == inputselpos[id][2]
		else
			conditional = inputpos[id] == inputselpos[id]
		end
		if conditional then
			input.clearselpos(id)
		end
	end
end

function input.rightmost(id)
	local multiline = type(inputpos[id]) == "table"

	inputsrightmost[id] = true

	cursorflashtime = 0
	inputcopiedtimer = 0

	local x, y, line
	if multiline then
		x, y = unpack(inputpos[id])
		line = inputs[id][y]
	else
		x = inputpos[id]
		line = inputs[id]
	end

	x = utf8.len(line)

	if inputselpos[id] ~= nil then
		local conditional
		if multiline then
			conditional = x == inputselpos[id][1] and y == inputselpos[id][2]
		else
			conditional = x == inputselpos[id]
		end
		if conditional then
			input.clearselpos(id)
		end
	end
end

function input.deletechars(id, chars)
	if chars == 0 then
		return
	end

	local multiline = type(inputpos[id]) == "table"

	local x, y, line
	for _ = 1, math.abs(chars) do
		if multiline then
			x, y = unpack(inputpos[id])
			line = inputs[id][y]
		else
			x = inputpos[id]
			line = inputs[id]
		end

		if inputsrightmost[id] then
			x = utf8.len(line)
		end

		x = math.min(math.max(x, 0), utf8.len(line))

		if chars > 0 then
			if x == utf8.len(line) then
				if multiline and y < #inputs[id] then
					inputs[id][y] = inputs[id][y] .. inputs[id][y+1]
					table.remove(inputs[id], y+1)
				end
			else
				if multiline then
					inputs[id][y] = utf8.sub(inputs[id][y], 1, x) .. utf8.sub(inputs[id][y], x+2, #inputs[id][y])
				else
					inputs[id] = utf8.sub(inputs[id], 1, x) .. utf8.sub(inputs[id], x+2, #inputs[id])
				end
			end
		else
			if x == 0 then
				if multiline and y > 1 then
					local len_oldline = utf8.len(inputs[id][y-1])
					inputs[id][y] = inputs[id][y-1] .. inputs[id][y]
					table.remove(inputs[id], y-1)
					y = y - 1
					x = len_oldline
				end
			else
				if multiline then
					inputs[id][y] = utf8.sub(inputs[id][y], 1, x-1) .. utf8.sub(inputs[id][y], x+1, #inputs[id][y])
				else
					inputs[id] = utf8.sub(inputs[id], 1, x-1) .. utf8.sub(inputs[id], x+1, #inputs[id])
				end
				x = x - 1
			end
		end

		if multiline then
			inputpos[id] = {x, y}
		else
			inputpos[id] = x
		end

		inputsrightmost[id] = false
	end

	cursorflashtime = 0
	inputcopiedtimer = 0
end

function input.insertchars(id, text)
	-- TODO: Add blacklisting chars for certain types of input?
	-- E.g. number inputs should be numbers-only, VVVVVV inputs should be ASCII-only

	if text == "" then
		return
	end

	local multiline = type(inputpos[id]) == "table"

	local x, y, line
	if multiline then
		x, y = unpack(inputpos[id])
		line = inputs[id][y]
	else
		x = inputpos[id]
		line = inputs[id]
	end

	if inputsrightmost[id] then
		x = utf8.len(line)
	end

	line = utf8.sub(line, 1, x) .. text .. utf8.sub(line, x+1, #line)

	if x < utf8.len(line) then
		x = x + utf8.len(text)
		x = math.min(x, utf8.len(line))
	end

	if multiline then
		inputpos[id] = {x, y}
		inputs[id][y] = line
	else
		inputs[id] = line
		inputpos[id] = x
	end

	cursorflashtime = 0
	inputcopiedtimer = 0
end

function input.newline(id)
	local multiline = type(inputpos[id]) == "table"

	if not multiline then
		return
	end

	local x, y = unpack(inputpos[id])
	local line = inputs[id][y]

	if inputsrightmost[id] then
		x = utf8.len(line)
	end

	local restofline = utf8.sub(line, x+1, #line)

	table.insert(inputs[id], y+1, restofline)
	inputs[id][y] = utf8.sub(line, 1, x)

	x = 0
	y = y + 1

	inputpos[id] = {x, y}

	cursorflashtime = 0
	inputcopiedtimer = 0
end

function input.setselpos(id)
	local multiline = type(inputpos[id]) == "table"

	local x, y, line
	if multiline then
		x, y = unpack(inputpos[id])
		line = inputs[id][y]
	else
		x = inputpos[id]
		line = inputs[id]
	end

	if inputsrightmost[id] then
		x = utf8.len(line)
	end

	x = math.min(math.max(x, 0), utf8.len(line))

	if multiline then
		inputselpos[id] = {x, y}
	else
		inputselpos[id] = x
	end
end

function input.clearselpos(id)
	inputselpos[id] = nil
end

function input.getseltext(id)
	if inputselpos[id] == nil then
		return
	end

	local multiline = type(inputpos[id]) == "table"

	local whichfirst -- 1 = caret pos, 2 = selection pos
	local startx, starty, endx, endy

	local rope = {}

	if multiline then
		local curx, cury = unpack(inputpos[id])
		local selx, sely = unpack(inputselpos[id])
		local lines = inputs[id]
		if inputsrightmost[id] then
			curx = #lines[cury]
		end

		if cury < sely then
			whichfirst = 1
		elseif sely < cury then
			whichfirst = 2
		elseif curx < selx then
			whichfirst = 1
		elseif selx < curx then
			whichfirst = 2
		end

		if whichfirst == 1 then
			startx, starty = curx, cury
			endx, endy = selx, sely
		elseif whichfirst == 2 then
			startx, starty = selx, sely
			endx, endy = curx, cury
		end

		if whichfirst == nil then
			return ""
		end

		local line
		local thischar

		local nested_break = false
		for l = starty, endy do
			line = lines[l]
			for thispos = 1, utf8.len(line) do
				if (l ~= endy or endx ~= 0) and (l > starty or thispos > startx) then
					thischar = utf8.sub(line, thispos, thispos)
					table.insert(rope, thischar)
				end

				if l == endy and thispos == endx then
					nested_break = true
					break
				end
			end

			if nested_break then
				break
			end

			table.insert(rope, "\n")
		end
	else
		local curx = inputpos[id]
		local selx = inputselpos[id]
		if inputsrightmost[id] then
			curx = #inputs[id]
		end

		if curx < selx then
			whichfirst = 1
		elseif selx < curx then
			whichfirst = 2
		end

		if whichfirst == 1 then
			startx, endx = curx, selx
		elseif whichfirst == 2 then
			startx, endx = selx, curx
		end

		if whichfirst == nil then
			return ""
		end

		local thischar
		local line = inputs[id]

		for thispos = startx+1, endx do
			thischar = utf8.sub(line, thispos, thispos)
			table.insert(rope, thischar)
		end
	end

	return table.concat(rope, "")
end

function input.delseltext(id)
	if inputselpos[id] == nil then
		return
	end

	local multiline = type(inputpos[id]) == "table"

	local whichfirst -- 1 = caret pos, 2 = selection pos
	local startx, starty, endx, endy

	local deletethismanychars = 0

	if multiline then
		local curx, cury = unpack(inputpos[id])
		local selx, sely = unpack(inputselpos[id])
		local lines = inputs[id]
		if inputsrightmost[id] then
			curx = #lines[cury]
		end

		if cury < sely then
			whichfirst = 1
		elseif sely < cury then
			whichfirst = 2
		elseif curx < selx then
			whichfirst = 1
		elseif selx < curx then
			whichfirst = 2
		end

		if whichfirst == 1 then
			startx, starty = curx, cury
			endx, endy = selx, sely
		elseif whichfirst == 2 then
			startx, starty = selx, sely
			endx, endy = curx, cury
		end

		if whichfirst == nil then
			return
		end

		local line

		local nested_break = false
		for l = starty, endy do
			line = lines[l]
			for thispos = 1, utf8.len(line) do
				if (l ~= endy or endx ~= 0) and (l > starty or thispos > startx) then
					deletethismanychars = deletethismanychars + 1
				end

				if l == endy and thispos == endx then
					nested_break = true
					break
				end
			end

			if nested_break then
				break
			end
		end

		-- Delete the newlines
		deletethismanychars = deletethismanychars + endy - starty
	else
		local curx = inputpos[id]
		local selx = inputselpos[id]
		if inputsrightmost[id] then
			curx = #inputs[id]
		end

		if curx < selx then
			whichfirst = 1
		elseif selx < curx then
			whichfirst = 2
		end

		if whichfirst == 1 then
			startx, endx = curx, selx
		elseif whichfirst == 2 then
			startx, endx = selx, curx
		end

		if whichfirst == nil then
			return
		end

		deletethismanychars = endx - startx
	end

	if whichfirst == 1 then
		input.deletechars(id, deletethismanychars)
	elseif whichfirst == 2 then
		input.deletechars(id, -deletethismanychars)
	end

	input.clearselpos(id)
end

function input.setpos(id, x, y)
	local multiline = type(inputs[id]) == "table"

	if multiline then
		inputpos[id] = {x, y}
	else
		inputpos[id] = x
	end

	inputsrightmost[id] = false
end

function input.selall(id)
	local multiline = type(inputs[id]) == "table"

	if multiline then
		input.setpos(id, 0, 1)
		input.setselpos(id)
		inputpos[id][2] = #inputs[id]
		inputsrightmost[id] = true
	else
		input.setpos(id, 0)
		input.setselpos(id)
		inputsrightmost[id] = true
	end
end

function input.deltoleftmost(id)
	local multiline = type(inputs[id]) == "table"

	local x, y, line
	if multiline then
		x, y = unpack(inputpos[id])
		line = inputs[id][y]
	else
		x = inputpos[id]
		line = inputs[id]
	end

	if inputsrightmost[id] then
		x = utf8.len(line)
	end

	if x == 0 then
		-- Fast path: we're already at the left end, so we don't need to do anything
		return
	end

	input.deletechars(id, -x)

	cursorflashtime = 0
	inputcopiedtimer = 0
end

function input.deltorightmost(id)
	local multiline = type(inputpos[id]) == "table"

	local x, y, line
	if multiline then
		x, y = unpack(inputpos[id])
		line = inputs[id][y]
	else
		x = inputpos[id]
		line = inputs[id]
	end

	if inputsrightmost[id] then
		-- Fast path: This is already cleared, so we don't need to do anything
		return
	end

	if x == utf8.len(line) then
		-- Again, fast path, already cleared, don't need to do anything
		return
	end

	input.deletechars(id, utf8.len(line) - x)

	cursorflashtime = 0
	inputcopiedtimer = 0
end
