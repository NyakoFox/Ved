function drawmap()
	love.graphics.setColor(128,128,128)
	love.graphics.rectangle("line", mapxoffset+screenoffset-0.5, mapyoffset-0.5, 640*mapscale*metadata.mapwidth+1, 480*mapscale*metadata.mapheight+1)
	love.graphics.setColor(255,255,255)
	love.graphics.setScissor(mapxoffset+screenoffset, mapyoffset, 640*mapscale*metadata.mapwidth, 480*mapscale*metadata.mapheight)
	love.graphics.draw(fullcovered, mapxoffset+screenoffset, mapyoffset)
	love.graphics.setScissor()
	for mry = 0, metadata.mapheight-1 do
		for mrx = 0, metadata.mapwidth-1 do
			--displayroom(mapxoffset+screenoffset+(mrx*mapscale*640), mapyoffset+mry*mapscale*480, roomdata[mry][mrx], levelmetadata[(mry)*20 + (mrx+1)], mapscale)
			--love.graphics.rectangle("line", mapxoffset+screenoffset+(mrx*mapscale*640), mapyoffset+mry*mapscale*480, mapscale*640, mapscale*480)
			if rooms_map[mry][mrx].map ~= nil then
				love.graphics.draw(rooms_map[mry][mrx].map, mapxoffset+screenoffset+(mrx*mapscale*640), mapyoffset+mry*mapscale*480, 0, mapscale*2)
			end
		end
	end

	-- We should be able to hover over rooms
	hoverx = nil
	hovery = nil
	hovername = nil

	if nodialog then
		for mry = 0, metadata.mapheight-1 do
			for mrx = 0, metadata.mapwidth-1 do
				if mouseon(mapxoffset+screenoffset+(mrx*mapscale*640), mapyoffset+mry*mapscale*480, mapscale*640, mapscale*480) then
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
		love.graphics.rectangle("line", mapxoffset+screenoffset+(roomx*mapscale*640), mapyoffset+roomy*mapscale*480, mapscale*640, mapscale*480)
		love.graphics.setLineWidth(1)
		love.graphics.setColor(255,255,255)
	end

	if (hoverx ~= nil) and (hovery ~= nil) then
		if s.coords0 then
			love.graphics.print("(" .. hoverx .. "," .. hovery .. ")", screenoffset+640, 3)
		else
			love.graphics.print("(" .. (hoverx+1) .. "," .. (hovery+1) .. ")", screenoffset+640, 3)
		end
	--[[
	elseif selectingrooms ~= 0 then
		love.graphics.printf(langkeys(L.SELECTCOPYSWAP, {(selected1x == -1 and L.SELECTFIRST or L.SELECTSECOND), (selectingrooms == 1 and L.SELECTCOPY or L.SELECTSWAP)}), screenoffset+640, 3, love.graphics.getWidth()-(screenoffset+640), "left")
	]]
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
	rbutton(L.SAVEMAP, 1, nil, true)
	rbutton(L.COPYROOMS, 3, nil, true)
	rbutton(L.SWAPROOMS, 4, nil, true)

	-- The buttons are clickable
	if nodialog and love.mouse.isDown("l") then
		if onrbutton(0, nil, true) then
			-- Return
			tostate(1, true)
		elseif onrbutton(1, nil, true) then
			-- Save map
			dialog.create("Not currently supported")
		elseif onrbutton(3, nil, true) then
			-- Copy rooms
			selectingrooms = 1
			selected1x = -1; selected1y = -1
			selected2x = -1; selected2y = -1
		elseif onrbutton(4, nil, true) then
			-- Swap rooms
			selectingrooms = 2
			selected1x = -1; selected1y = -1
			selected2x = -1; selected2y = -1
		end
	end
end
