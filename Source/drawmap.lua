function drawmap()
	love.graphics.setColor(128,128,128)
	love.graphics.rectangle("line", mapxoffset+screenoffset-0.5, mapyoffset-0.5, 640*mapscale*metadata.mapwidth+1, 480*mapscale*metadata.mapheight+1)
	love.graphics.setColor(255,255,255)
	love.graphics.setScissor(mapxoffset+screenoffset, mapyoffset, 640*mapscale*metadata.mapwidth, 480*mapscale*metadata.mapheight)
	love.graphics.draw(covered_full, mapxoffset+screenoffset, mapyoffset)
	love.graphics.setScissor()

	local startx, starty
	if entitydata[count.startpoint] ~= nil then
		startx = math.floor(entitydata[count.startpoint].x/40)
		starty = math.floor(entitydata[count.startpoint].y/30)
		startx = math.max(startx, 0)
		starty = math.max(starty, 0)
	end

	for mry = 0, metadata.mapheight-1 do
		for mrx = 0, metadata.mapwidth-1 do
			love.graphics.setScissor(mapxoffset+screenoffset+(mrx*mapscale*640), mapyoffset+mry*mapscale*480, mapscale*640, mapscale*480)
			if rooms_map[mry][mrx].map ~= nil then
				-- First draw a black background
				love.graphics.setColor(0,0,0,255)
				love.graphics.rectangle("fill", mapxoffset+screenoffset+(mrx*mapscale*640), mapyoffset+mry*mapscale*480, mapscale*640, mapscale*480)
				love.graphics.setColor(255,255,255,255)

				love.graphics.draw(rooms_map[mry][mrx].map, mapxoffset+screenoffset+(mrx*mapscale*640), mapyoffset+mry*mapscale*480, 0, mapscale*2)
			end

			if selectedtool == 4 or selectedtool == 16 or selectedtool == 17 then
				love.graphics.setColor(0,0,0,128)
				love.graphics.rectangle("fill", mapxoffset+screenoffset+(mrx*mapscale*640), mapyoffset+mry*mapscale*480, mapscale*640, mapscale*480)
				love.graphics.setColor(255,255,255,255)
			end

			-- Draw one thing if there is one, draw two if there is two,
			-- draw three if there is three.
			-- Else, just draw the number instead.
			if selectedtool == 4 and map_trinkets[mry][mrx] > 0 then
				if map_trinkets[mry][mrx] == 1 then
					drawentitysprite(22, mapxoffset + screenoffset + mrx*mapscale*640 + (mapscale*640 - 16) / 2, mapyoffset + mry*mapscale*480 + (mapscale*480 - 16) / 2, true)
				elseif map_trinkets[mry][mrx] == 2 then
					drawentitysprite(22, mapxoffset + screenoffset + mrx*mapscale*640 + (mapscale*640 - 2*16) / 3, mapyoffset + mry*mapscale*480 + (mapscale*480 - 16) / 2, true)
					drawentitysprite(22, mapxoffset + screenoffset + mrx*mapscale*640 + 2 * (mapscale*640 - 2*16) / 3 + 16, mapyoffset + mry*mapscale*480 + (mapscale*480 - 16) / 2, true)
				elseif map_trinkets[mry][mrx] == 3 then
					drawentitysprite(22, mapxoffset + screenoffset + mrx*mapscale*640 + (mapscale*640 - 3*16) / 4, mapyoffset + mry*mapscale*480 + (mapscale*480 - 16) / 2, true)
					drawentitysprite(22, mapxoffset + screenoffset + mrx*mapscale*640 + 2 * (mapscale*640 - 3*16) / 4 + 16, mapyoffset + mry*mapscale*480 + (mapscale*480 - 16) / 2, true)
					drawentitysprite(22, mapxoffset + screenoffset + mrx*mapscale*640 + 3 * (mapscale*640 - 3*16) / 4 + 2*16, mapyoffset + mry*mapscale*480 + (mapscale*480 - 16) / 2, true)
				else
					love.graphics.printf(map_trinkets[mry][mrx], mapxoffset + screenoffset + mrx*mapscale*640, mapyoffset + mry*mapscale*480 + mapscale*480/2 - 2, mapscale*640, "center")
				end
			elseif selectedtool == 16 and map_crewmates[mry][mrx][1] > 0 then
				if map_crewmates[mry][mrx][1] == 1 then
					setrescuablecolor(map_crewmates[mry][mrx][2][1])
					drawentitysprite(144, mapxoffset + screenoffset + mrx*mapscale*640 + (mapscale*640 - 12) / 2 - 6, mapyoffset + mry*mapscale*480 + (mapscale*480-21) / 2 - 2, true)
				elseif map_crewmates[mry][mrx][1] == 2 then
					setrescuablecolor(map_crewmates[mry][mrx][2][1])
					drawentitysprite(144, mapxoffset + screenoffset + mrx*mapscale*640 + (mapscale*640 - 2*12) / 3 - 6, mapyoffset + mry*mapscale*480 + (mapscale*480-21)/2 - 2, true)
					setrescuablecolor(map_crewmates[mry][mrx][2][2])
					drawentitysprite(144, mapxoffset + screenoffset + mrx*mapscale*640 + 2 * (mapscale*640 - 2*12) / 3 + 12 - 6, mapyoffset + mry*mapscale*480 + (mapscale*480-21)/2 - 2, true)
				elseif map_crewmates[mry][mrx][1] == 3 then
					setrescuablecolor(map_crewmates[mry][mrx][2][1])
					drawentitysprite(144, mapxoffset + screenoffset + mrx*mapscale*640 + (mapscale*640 - 3*12) / 4 - 6, mapyoffset + mry*mapscale*480 + (mapscale*480-21)/2 - 2, true)
					setrescuablecolor(map_crewmates[mry][mrx][2][2])
					drawentitysprite(144, mapxoffset + screenoffset + mrx*mapscale*640 + 2 * (mapscale*640 - 3*12) / 4 + 12 - 6, mapyoffset + mry*mapscale*480 + (mapscale*480-21)/2 - 2, true)
					setrescuablecolor(map_crewmates[mry][mrx][2][3])
					drawentitysprite(144, mapxoffset + screenoffset + mrx*mapscale*640 + 3 * (mapscale*640 - 3*12) / 4 + 2*12 - 6, mapyoffset + mry*mapscale*480 + (mapscale*480-21)/2 - 2, true)
				else
					love.graphics.printf(map_crewmates[mry][mrx][1], mapxoffset + screenoffset + mrx*mapscale*640, mapyoffset + mry*mapscale*480 + mapscale*480/2 - 2, mapscale*640, "center")
				end
			elseif selectedtool == 17 and mrx == startx and mry == starty then
				love.graphics.setColor(132, 181, 255)
				drawentitysprite(3*entitydata[count.startpoint].p1, mapxoffset + screenoffset + mrx*mapscale*640 + (mapscale*640 - 12) / 2 - 6, mapyoffset + mry*mapscale*480 + (mapscale*480-21) / 2 - 2, true)
			end
		end
	end
	love.graphics.setBlendMode("alpha")
	love.graphics.setScissor()

	-- We should be able to hover over rooms
	hoverx = nil
	hovery = nil
	hovername = nil

	-- Just so if we click on a tool in smallerscreen mode,
	-- we won't click on the room behind it
	-- (and also we won't highlight the room behind it either if we're not clicking)
	local mouseontools = false
	if keyboard_eitherIsDown(ctrl) then
		for t = 1, 4 do
			if mouseon(16, (16+(48*(t-1))), 32, 32) then
				mouseontools = true
				break
			end
		end
	end

	if nodialog then
		for mry = 0, metadata.mapheight-1 do
			for mrx = 0, metadata.mapwidth-1 do
				if mouseon(mapxoffset+screenoffset+(mrx*mapscale*640), mapyoffset+mry*mapscale*480, mapscale*640, mapscale*480) and not mouseontools then
					love.graphics.setColor(255,255,255,64)
					love.graphics.rectangle("fill", mapxoffset+screenoffset+(mrx*mapscale*640), mapyoffset+mry*mapscale*480, mapscale*640, mapscale*480)
					love.graphics.setColor(255,255,255,255)

					hoverx = mrx
					hovery = mry
					hovername = levelmetadata[(mry)*20 + (mrx+1)].roomname

					-- But maybe we're clicking this room!
					if love.mouse.isDown("l") then
						-- Is this an action?
						if not mousepressed and selectingrooms == 0 then
							-- Nope
							gotoroom(hoverx, hovery)

							-- We don't want to click the first tile we press
							nodialog = false

							tostate(1, true)
						elseif not mousepressed and selected1x == -1 then
							-- Select 1
							selected1x = hoverx
							selected1y = hovery
							mousepressed = true
						elseif not mousepressed and selected2x == -1 then
							-- Select 2 and proceed
							selected2x = hoverx
							selected2y = hovery

							if selected1x == selected2x and selected1y == selected2y then
								-- This may have resulted in an infinite loop memory flood!
								dialog.create(L.SOURCEDESTROOMSSAME)
							else
								-- What were we selecting the rooms for, btw?
								if selectingrooms == 1 then
									-- Copying!
									mapcopy(selected1x, selected1y, selected2x, selected2y)
								elseif selectingrooms == 2 then
									-- Swapping!
									mapswap(selected1x, selected1y, selected2x, selected2y)
								end
							end

							selectingrooms = 0
							mousepressed = true
						end
					elseif love.mouse.isDown("r") then
						-- We just want to go there
						gotoroom(hoverx, hovery)
						mapmovedroom = true
					end
				end
			end
		end
	end

	if mapmovedroom or (generictimer_mode == 2
	and ((generictimer > 0 and generictimer <= 0.5)
	or (generictimer > 1 and generictimer <= 1.5)
	or (generictimer > 2 and generictimer < 2.5))) then
		love.graphics.setColor(255,255,0)
		love.graphics.setLineWidth(3)
		love.graphics.rectangle("line",
			mapxoffset+screenoffset+(roomx*mapscale*640),
			mapyoffset+roomy*mapscale*480,
			mapscale*640, mapscale*480
		)
		love.graphics.setLineWidth(1)
		love.graphics.setColor(255,255,255)
	end

	-- Maybe we're exporting the map and showing which selection will be exported?
	if dialog.is_open() and dialogs[#dialogs].identifier == "mapexport" then
		local x1, y1, w, h, x2, y2 = fix_map_export_input(dialogs[#dialogs]:return_fields(), true)

		love.graphics.setColor(0,0,255)
		love.graphics.setLineWidth(3)
		love.graphics.rectangle("line",
			mapxoffset+screenoffset+(x1*mapscale*640),
			mapyoffset+y1*mapscale*480,
			w*mapscale*640, h*mapscale*480
		)
		love.graphics.setLineWidth(1)
		love.graphics.setColor(255,255,255)
	end

	if (hoverx ~= nil) and (hovery ~= nil) then
		if s.coords0 then
			love.graphics.print("(" .. hoverx .. "," .. hovery .. ")", screenoffset+640, 3)
		else
			love.graphics.print("(" .. (hoverx+1) .. "," .. (hovery+1) .. ")", screenoffset+640, 3)
		end
	end
	if (hovername ~= nil) then
		love.graphics.printf(hovername, screenoffset+640, 11, love.graphics.getWidth()-screenoffset-640, "left")
	end
	if selectingrooms == 1 and selected1x == -1 then
		-- Copy 1
		love.graphics.printf(L.SELECTCOPY1, screenoffset+640, 80, love.graphics.getWidth()-(screenoffset+640), "left")
	elseif selectingrooms == 1 then
		-- Copy 2
		love.graphics.printf(L.SELECTCOPY2, screenoffset+640, 80, love.graphics.getWidth()-(screenoffset+640), "left")
	elseif selectingrooms == 2 and selected1x == -1 then
		-- Swap 1
		love.graphics.printf(L.SELECTSWAP1, screenoffset+640, 80, love.graphics.getWidth()-(screenoffset+640), "left")
	elseif selectingrooms == 2 then
		-- Swap 2
		love.graphics.printf(L.SELECTSWAP2, screenoffset+640, 80, love.graphics.getWidth()-(screenoffset+640), "left")
	end

	rbutton({L.RETURN, "b"}, 0, nil, true)
	rbutton({L.SAVEMAP, "S"}, 1, nil, true)
	rbutton(L.COPYROOMS, 5, nil, true)
	rbutton(L.SWAPROOMS, 6, nil, true)

	local strip_ypos = love.graphics.getHeight()-192

	if #undobuffer >= 1 then
		hoverdraw(undobtn, love.graphics.getWidth()-120, strip_ypos, 16, 16, 1)
	else
		love.graphics.setColor(64,64,64)
		love.graphics.draw(undobtn, love.graphics.getWidth()-120, strip_ypos)
		love.graphics.setColor(255,255,255)
	end
	if #redobuffer >= 1 then
		hoverdraw(redobtn, love.graphics.getWidth()-120+16, strip_ypos, 16, 16, 1)
	else
		love.graphics.setColor(64,64,64)
		love.graphics.draw(redobtn, love.graphics.getWidth()-120+16, strip_ypos)
		love.graphics.setColor(255,255,255)
	end

	showhotkey("cZ", love.graphics.getWidth()-120+7, strip_ypos-4, ALIGN.CENTER)
	showhotkey("cY", love.graphics.getWidth()-120+16+6, strip_ypos+8, ALIGN.CENTER)

	hoverdraw(cutbtn, love.graphics.getWidth()-120+64, strip_ypos, 16, 16, 1)
	hoverdraw(copybtn, love.graphics.getWidth()-120+80, strip_ypos, 16, 16, 1)
	hoverdraw(pastebtn, love.graphics.getWidth()-120+96, strip_ypos, 16, 16, 1)

	showhotkey("cX", love.graphics.getWidth()-120+64+6, strip_ypos-4, ALIGN.CENTER)
	showhotkey("cC", love.graphics.getWidth()-120+80+6, strip_ypos+8, ALIGN.CENTER)
	showhotkey("cV", love.graphics.getWidth()-120+96+6, strip_ypos-4, ALIGN.CENTER)

	love.graphics.printf(L.SHIFTROOMS, love.graphics.getWidth()-120-8, love.graphics.getHeight()-120+4+4, 8*12, "center")
	hoverrectangle(128,128,128,128, love.graphics.getWidth()-120+8*10, love.graphics.getHeight()-120+4, 10, 10)
	hoverrectangle(128,128,128,128, love.graphics.getWidth()-120+8*13, love.graphics.getHeight()-120+4, 10, 10)
	hoverrectangle(128,128,128,128, love.graphics.getWidth()-120+8*11+4, love.graphics.getHeight()-120-4, 10, 10)
	hoverrectangle(128,128,128,128, love.graphics.getWidth()-120+8*11+4, love.graphics.getHeight()-120+4+8, 10, 10)
	love.graphics.print(arrow_left, love.graphics.getWidth()-120+8*10+1, love.graphics.getHeight()-120+4+3)
	love.graphics.print(arrow_right, love.graphics.getWidth()-120+8*13+1, love.graphics.getHeight()-120+4+3)
	love.graphics.print(arrow_up, love.graphics.getWidth()-120+8*11+4+1, love.graphics.getHeight()-120-4+3)
	love.graphics.print(arrow_down, love.graphics.getWidth()-120+8*11+4+1, love.graphics.getHeight()-120+4+8+3)

	-- The buttons are clickable
	if not mousepressed and nodialog and love.mouse.isDown("l") then
		if onrbutton(0, nil, true) then
			-- Return
			tostate(1, true)
		elseif onrbutton(1, nil, true) then
			-- Save map
			create_export_dialog()
		elseif onrbutton(5, nil, true) then
			-- Copy rooms
			selectingrooms = 1
			selected1x = -1; selected1y = -1
			selected2x = -1; selected2y = -1
		elseif onrbutton(6, nil, true) then
			-- Swap rooms
			selectingrooms = 2
			selected1x = -1; selected1y = -1
			selected2x = -1; selected2y = -1
		elseif mouseon(love.graphics.getWidth()-120, strip_ypos, 16, 16) then
			undo()
		elseif mouseon(love.graphics.getWidth()-120+16, strip_ypos, 16, 16) then
			redo()
		elseif mouseon(love.graphics.getWidth()-120+64, strip_ypos, 16, 16) then
			cutroom()
		elseif mouseon(love.graphics.getWidth()-120+80, strip_ypos, 16, 16) then
			copyroom()
		elseif mouseon(love.graphics.getWidth()-120+98, strip_ypos, 16, 16) then
			pasteroom()
		elseif mouseon(love.graphics.getWidth()-120+8*10, love.graphics.getHeight()-120+4, 10, 10) then
			shiftrooms(SHIFT.LEFT, true)
		elseif mouseon(love.graphics.getWidth()-120+8*13, love.graphics.getHeight()-120+4, 10, 10) then
			shiftrooms(SHIFT.RIGHT, true)
		elseif mouseon(love.graphics.getWidth()-120+8*11+4, love.graphics.getHeight()-120-4, 10, 10) then
			shiftrooms(SHIFT.UP, true)
		elseif mouseon(love.graphics.getWidth()-120+8*11+4, love.graphics.getHeight()-120+4+8, 10, 10) then
			shiftrooms(SHIFT.DOWN, true)
		end
	end

	local toolanyofthese = selectedtool == 4 or selectedtool == 16 or selectedtool == 17

	local pluraltoolnames = table.copy(toolnames)
	pluraltoolnames[4] = L.TRINKETS
	pluraltoolnames[16] = L.CREWMATES
	if not s.psmallerscreen or keyboard_eitherIsDown(ctrl) then
		for t = 1, 4 do
			local actual_t
			if t == 1 then
				actual_t = 1
			elseif t == 2 then
				actual_t = 4
			elseif t == 3 then
				actual_t = 16
			elseif t == 4 then
				actual_t = 17
			end
			love.graphics.setColor(255,255,255,255)

			if not nodialog or (not mouseon(16, (16+(48*(t-1))), 32, 32) and ((t == 1 and not toolanyofthese) or selectedtool ~= actual_t)) then
				love.graphics.setColor(255,255,255,128)
			end
			if nodialog and t == 1 and not toolanyofthese then
				love.graphics.setColor(255,255,255,255)
			end

			if nodialog and not mousepressed and love.mouse.isDown("l") and mouseon(16, (16+(48*(t-1))), 32, 32) then
				selectedtool = actual_t
				updatewindowicon()
				toolscroll()
			end
			if nodialog and not mousepressed and love.mouse.isDown("r") and mouseon(16, (16+(48*(t-1))), 32, 32) and t == 4 then
				gotostartpointroom()
			end

			if (t ~= 1 and selectedtool == actual_t) or (t == 1 and not toolanyofthese) then
				love.graphics.draw(selectedtoolborder,  16, (16+(48*(t-1))))
			else
				love.graphics.draw(unselectedtoolborder,  16, (16+(48*(t-1))))
			end
			if t ~= 1 then
				local cx, cy = 16+2, (16+2+(48*(t-1)))
				love.graphics.draw(toolimg[actual_t], cx, cy)
				if nodialog and (mouseon(16, (16+(48*(t-1))), 32, 32)) then
					love.graphics.setColor(128,128,128,192)
					love.graphics.rectangle("fill", love.mouse.getX()+15, love.mouse.getY()-10, font8:getWidth(pluraltoolnames[actual_t]), 8)
					love.graphics.setColor(255,255,255,255)
					love.graphics.print(pluraltoolnames[actual_t], love.mouse.getX()+16, love.mouse.getY()-8)
				end
			end
		end
	end

	-- Smaller screen? Display a "CTRL" and the current tool, just like the main editor
	if s.psmallerscreen and not keyboard_eitherIsDown(ctrl) then
		love.graphics.setColor(0, 0, 0, 192)
		love.graphics.rectangle("fill", 0, 0, 32, love.graphics.getHeight())
		love.graphics.setColor(255,255,255,255)
		tinyprint(L.TINY_CTRL, 0, 0)

		love.graphics.draw(selectedtoolborder, 0, love.graphics.getHeight()-32)
		if toolanyofthese then
			love.graphics.draw(toolimg[selectedtool], 2, love.graphics.getHeight()-30)
		end
	end

	-- Put this here, otherwise we get tripped up when clicking on the tools
	if love.mouse.isDown("l") and nodialog then
		mousepressed = true
	end
end
