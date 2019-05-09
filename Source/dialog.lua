-- Dialog button constants
DB = {
	OK = 1,
	CANCEL = 2,
	YES = 3,
	NO = 4,
	APPLY = 5,
	QUIT = 6,
	DISCARD = 7,
	SAVE = 8,
	CLOSE = 9,
}

-- We'd also like that being indexable by the values...
DB_keys = {}
for k,v in pairs(DB) do
	DB_keys[v] = k
end

-- Dialog button set constants
DBS = {
	OK = {DB.OK},
	QUIT = {DB.QUIT},
	YESNO = {DB.YES, DB.NO},
	OKCANCEL = {DB.OK, DB.CANCEL},
	OKCANCELAPPLY = {DB.OK, DB.CANCEL, DB.APPLY},
	SAVEDISCARDCANCEL = {DB.SAVE, DB.DISCARD, DB.CANCEL},
	YESNOCANCEL = {DB.YES, DB.NO, DB.CANCEL},
}

-- Field type constants
DF = {
	TEXT = 0,
	DROPDOWN = 1,
	LABEL = 2,
	CHECKBOX = 3,
	RADIOS = 4,
}

-- Dialog class
cDialog =
{
	x = (love.graphics.getWidth()-400)/2,
	y = (love.graphics.getHeight()-150)/2,
	width = 400,
	height = 150,
	moving = false,
	moved_from_wx = 100,
	moved_from_wy = 100,
	moved_from_mx = 0,
	moved_from_my = 0,
	windowani = -15,
	closing = false,

	title = "",
	text = "UNDEFINED",

	buttons = DBS.OK,
	buttons_present = {}, -- buttons as keys
	handler = nil,
	noclosechecker = nil,
	identifier = nil,

	fields = {},
	currentfield = 0,

	return_btn = 0,
}

function cDialog:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self

	-- Which buttons do we have? That's useful for shortcuts.
	o.buttons_present = {}
	for k,v in pairs(o.buttons) do
		o.buttons_present[v] = true
	end

	-- Offset x and y based on length of dialogs stack
	local cascade_offset = #dialogs * 14
	o.x = math.min(o.x + cascade_offset, love.graphics.getWidth()-o.width)
	o.y = math.min(o.y + cascade_offset, love.graphics.getHeight()-o.height)

	if not s.dialoganimations then
		o.windowani = 0
	end

	return o
end

function cDialog:draw(topmost)
	if self.windowani >= 16 then
		return
	end

	-- Window contents
	self:setColor(192,192,192,239)
	love.graphics.rectangle("fill", self.x, self.y+self.windowani, self.width, self.height)
	-- Text
	self:setColor(0,0,0,255)
	love.graphics.setScissor(self.x, self.y+self.windowani, self.width, self.height)
	love.graphics.printf(self.text, self.x+10, self.y+self.windowani+10, self.width-20, "left")
	love.graphics.setScissor()

	-- Text boxes
	for k,v in pairs(self.fields) do
		self:drawfield(topmost, k, unpack(v))
	end

	-- Buttons
	local btnwidth = 72
	for k,v in pairs(self.buttons) do
		local rapos = (#self.buttons)-k+1 -- right-aligned position
		local btn_x = self.x+self.width-rapos*btnwidth-(5*(rapos-1))-1
		local btn_y = self.y+self.windowani+self.height-26

		if topmost and mouseon(btn_x, btn_y, btnwidth, 25) then
			-- Hovering over this button
			self:setColor(124, 124, 124, 128)

			if self.windowani == 0 and love.mouse.isDown("l") and not mousepressed then
				self:press_button(v)
				mousepressed = true
			end
		else
			-- Not hovering over this button
			self:setColor(64, 64, 64, 128)
		end

		-- Display the button itself.
		love.graphics.rectangle("fill", btn_x, btn_y, btnwidth, 25)
		self:setColor(0,0,0,255)

		local btn_text
		if type(v) == "number" and DB_keys[v] ~= nil then
			btn_text = L["BTN_" .. DB_keys[v]]
		else
			btn_text = v
		end
		love.graphics.printf(btn_text, btn_x, btn_y+10, btnwidth, "center")
	end

	-- Window border
	self:setColor(255,255,255,239)
	love.graphics.rectangle("line", self.x, self.y+self.windowani, self.width, self.height)
	-- Bar
	self:setColor(64,64,64,128, not topmost)
	love.graphics.rectangle("fill", self.x-1, self.y+self.windowani-17, self.width+2, 16)

	-- Also display the title text (if not empty). Shadow first
	self:setColor(0,0,0,255, not topmost)
	love.graphics.print(self.title, self.x+4, self.y+self.windowani-10)
	self:setColor(255,255,255,255, not topmost)
	love.graphics.print(self.title, self.x+3, self.y+self.windowani-11)
end

function cDialog:update(dt, topmost)
	if self.moving then
		self.x = self.moved_from_wx + (love.mouse.getX()-self.moved_from_mx)
		self.y = self.moved_from_wy + (love.mouse.getY()-self.moved_from_my)
	end

	if not s.dialoganimations then
		return
	end

	-- Increase to max 0 if not closing, to max 16 if closing
	if not self.closing and self.windowani < 0 then
		self.windowani = math.min(self.windowani + dt*60, 0)
	elseif self.closing and self.windowani < 16 then
		self.windowani = math.min(self.windowani + dt*60, 16)
	end

	if self.windowani >= 16 and topmost then
		self:closed()
	end
end

function cDialog:mousepressed(x, y)
	-- Left mouse button pressed on the dialog
	if self.closing then
		return
	end
	if x > self.x and x <= self.x+self.width and y >= self.y-17 and y <= self.y then
		-- Title bar
		self.moving = true
		self.moved_from_wx = self.x
		self.moved_from_wy = self.y
		self.moved_from_mx = x
		self.moved_from_my = y
	end
end

function cDialog:mousereleased(x, y)
	-- This is run for all dialogs, since a dialog may spawn while dragging another.
	if self.moving then
		self.x = self.moved_from_wx + (x-self.moved_from_mx)
		self.y = self.moved_from_wy + (y-self.moved_from_my)
		self.moving = false
	end
end

function cDialog:keypressed(key)
	-- Key pressed that might be of interest
	if self.closing then
		return
	end
	if key == "return" then
		if self.buttons_present[DB.OK] then
			self:press_button(DB.OK)
		elseif self.buttons_present[DB.CLOSE] then
			self:press_button(DB.CLOSE)
		elseif self.buttons_present[DB.SAVE] then
			self:press_button(DB.SAVE)
		elseif self.buttons_present[DB.QUIT] then
			self:press_button(DB.QUIT)
		end
	elseif key == "escape" and self.buttons_present[DB.CANCEL] then
		self:press_button(DB.CANCEL)
	elseif key == "y" and self.buttons_present[DB.YES] then
		self:press_button(DB.YES)
	elseif key == "n" and self.buttons_present[DB.NO] then
		self:press_button(DB.NO)
	elseif key == "s" and self.buttons_present[DB.SAVE] then
		self:press_button(DB.SAVE)
	elseif key == "d" and self.buttons_present[DB.DISCARD] then
		self:press_button(DB.DISCARD)
	end
end

function cDialog:dropdown_onchange(key, picked)
	if self.closing then
		return
	end

	for k,v in pairs(self.fields) do
		if v[1] == key then
			local new_value = nil
			if v[9] ~= nil then
				new_value = v[9](picked, v[7], v[8])
			end
			if new_value == nil then
				new_value = picked
			end

			v[5] = new_value

			break
		end
	end
end

function cDialog:drawfield(topmost, n, key, x, y, w, content, mode, extendedargs1, extendedargs2) -- next: dropdown onchange function
	-- Modes:
	-- 0: textbox (default)
	-- 1: dropdown
	-- 2: text label (can also be function returning string)
	-- 3: checkbox
	-- 4: radio buttons dropdown
	if mode == nil then
		mode = 0
	end

	local content_r, menuitems, menuitemslabel
	if mode == 0 then
		content_r = extendedargs1
	else
		menuitems = extendedargs1
		menuitemslabel = extendedargs2
	end

	local real_x = self.x+10+x*8
	local real_y = self.y+self.windowani+10+y*8 + 1
	local real_w = w*8

	if mode == 2 then
		-- This is only a label, don't do anything special.
		self:setColor(0,0,0,255)
		local textcontent
		if type(content) == "function" then
			textcontent = content(key, self:return_fields())
		else
			textcontent = content
		end
		love.graphics.printf(anythingbutnil(textcontent), real_x, real_y-1, real_w, "left")
		self:setColor(255,255,255,255)
		return
	end

	local active = self.currentfield == n

	if mode <= 1 then
		-- Text field or dropdown
		if topmost and (active or mouseon(real_x, real_y-3, real_w, 8)) then
			self:setColor(255,255,255,255)
			love.graphics.rectangle("fill", real_x, real_y-3, real_w, 8)

			if (active and love.keyboard.isDown("tab"))
			or (mouseon(real_x, real_y-3, real_w, 8) and love.mouse.isDown("l") and not mousepressed) then
				if mode == 0 and self.fields[self.currentfield] ~= nil then
					self.fields[self.currentfield][5] = anythingbutnil(self.fields[self.currentfield][5]) .. anythingbutnil(self.fields[self.currentfield][7])
					self.fields[self.currentfield][7] = ""
				end
				self.currentfield = n

				if mode == 1 and not RCMactive then
					rightclickmenu.create(menuitems, "dia_" .. key, real_x, (real_y-3)+8, true) -- y+h

					mousepressed = true
				end
			end
		else
			self:setColor(255,255,255,192)
			love.graphics.rectangle("fill", real_x, real_y-3, real_w, 8)
		end

		self:setColor(0,0,0,255)

		if mode == 0 then
			if active then
				love.graphics.print(anythingbutnil(content) .. __ .. anythingbutnil(allbutfirstUTF8(content_r)), real_x, real_y-1)
			else
				love.graphics.print(anythingbutnil(content) .. anythingbutnil(content_r), real_x, real_y-1)
			end
		elseif mode == 1 then
			if not menuitemslabel then
				love.graphics.print(anythingbutnil(content), real_x, real_y-1)
			else
				love.graphics.print(anythingbutnil(menuitemslabel[content]), real_x, real_y-1)
			end
			love.graphics.draw(menupijltje, real_x+real_w-8, (real_y-3)+2) -- Die 8 is 7+1
		end
	elseif mode == 3 then
		-- Checkbox
		self:hoverdraw(topmost, content and checkon or checkoff, real_x, real_y-3, real_w, 8)

		if (mouseon(real_x, real_y-3, real_w, 8) and love.mouse.isDown("l") and not mousepressed) then
			self.currentfield = n

			self.fields[n][5] = not content
			mousepressed = true
		end
	elseif mode == 4 then
		for k,v in pairs(menuitems) do
			local selected
			if not menuitemslabel then
				selected = v == content
			else
				selected = v == menuitemslabel[content]
			end
			real_w = 16+font8:getWidth(v)
			self:hoverdraw(topmost, selected and radioon or radiooff, real_x, real_y-11+k*8, real_w, 8)
			self:setColor(0,0,0,255)
			love.graphics.print(v, real_x+16, real_y-8+k*8)
			self:setColor(255,255,255,255)

			if (mouseon(real_x, real_y-11+k*8, real_w, 8) and love.mouse.isDown("l") and not mousepressed) then
				self.currentfield = n

				dialogs[#dialogs]:dropdown_onchange(key, v)
				mousepressed = true
			end
		end
	end

	self:setColor(255,255,255,255)
end

function cDialog:hoverdraw(topmost, img, x, y, w, h, s)
	if topmost and mouseon(x, y, w, h) then
		love.graphics.draw(img, x, y, 0, s)
	else
		self:setColor(255,255,255,128)
		love.graphics.draw(img, x, y, 0, s)
		self:setColor(255,255,255,255)
	end
end

function cDialog:press_button(button)
	if self.closing then
		return
	end
	RCMactive = false
	local notclosed = false
	if self.noclosechecker ~= nil then
		notclosed = self.noclosechecker(button, self:return_fields(), self.identifier, self)
	end
	if notclosed then
		if self.handler ~= nil then
			self.handler(button, self:return_fields(), self.identifier, notclosed, self)
		end
	else
		self:close(button)
	end
end

function cDialog:close(button)
	-- ONLY call this on the topmost dialog.
	-- Button is assumed to exist here, no questions asked.
	self.return_btn = button

	self.closing = true

	if not s.dialoganimations then
		self:closed()
	end
end

function cDialog:closed()
	table.remove(dialogs)
	-- Call the close handler!
	if self.handler ~= nil then
		self.handler(self.return_btn, self:return_fields(), self.identifier, false, self)
	end
end

function cDialog:return_fields()
	local f = {}

	for k,v in pairs(self.fields) do
		if anythingbutnil0(v[6]) == DF.TEXT then
			f[v[1]] = v[5] .. anythingbutnil(v[7])
		else
			f[v[1]] = v[5]
		end
	end

	return f
end

function cDialog:setColor(red, green, blue, alpha, nottopmost)
	if nottopmost then
		alpha = alpha / 2
	end

	if math.floor(self.windowani) < 0 then
		love.graphics.setColor(red, green, blue, ((math.floor(self.windowani)+15)/15)*alpha)
	elseif math.floor(self.windowani) == 0 then
		love.graphics.setColor(red, green, blue, alpha)
	else
		love.graphics.setColor(red, green, blue, ((15-math.floor(self.windowani))/15)*alpha)
	end
end

function cDialog:set_field(key, value)
	for k,v in pairs(self.fields) do
		if v[1] == key then
			v[5] = value
			break
		end
	end
end




dialogs = {}

dialog = {}

function dialog.draw()
	-- Now come the dialogs!
	for k,v in pairs(dialogs) do
		v:draw(k == #dialogs)
	end
end

function dialog.is_open()
	return #dialogs > 0
end

function dialog.update(dt)
	for k,v in pairs(dialogs) do
		v:update(dt, k == #dialogs)
	end
end

function dialog.create(message, buttons, handler, title, fields, noclosechecker, identifier)
	if fields ~= nil then
		fields = table.copy(fields)
	end

	RCMactive = false

	table.insert(dialogs,
		cDialog:new{
			text = message,
			buttons = buttons,
			handler = handler,
			title = title,
			fields = fields,
			noclosechecker = noclosechecker,
			identifier = identifier,
		}
	)
end

require("dialog_uses")
