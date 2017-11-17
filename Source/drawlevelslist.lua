function drawlevelslist()
	if state6old1 and editorscreenshot ~= nil then
		-- Print the screenshot we took, use it as a background!
		love.graphics.setColor(128,128,128,128)
		love.graphics.draw(editorscreenshot, 0, 0, 0, s.pscale^-1)
		love.graphics.setColor(255,255,255,255)
	end

	if not backupscreen then
		love.graphics.print(secondlevel and L.DIFFSELECT or L.LEVELSLIST, 8, 8)
	end

	if not lsuccess and not backupscreen then
		love.graphics.setColor(255,128,0)
		love.graphics.printf(langkeys(L.COULDNOTGETCONTENTSLEVELFOLDER, {levelsfolder}), 8, 24, love.graphics.getWidth()-136, "left")
		love.graphics.setColor(255,255,255)
	else
		hoveringlevel = nil
		hoveringlevel_k = nil
		local hoverarea = 734
		if s.smallerscreen then
			hoverarea = hoverarea - 96
		end
		-- Are we in the root, or is there a subfolder we're supposed to look in?
		local currentdir = ""

		if backupscreen then
			if currentbackupdir == "" then
				love.graphics.print(L.BACKUPS, 8, 4)
				currentdir = ".ved-sys" .. dirsep .. "backups"
			else
				love.graphics.print(langkeys(L.BACKUPSOFLEVEL, {currentbackupdir:sub((".ved-sys/backups"):len()+2, -1)}), 8, 4)
				love.graphics.print(L.LASTMODIFIEDTIME, 66, 15)
				love.graphics.print(L.OVERWRITTENTIME, 408, 15)
				currentdir = currentbackupdir
			end
		else
			if string.find(input .. input_r, dirsep) ~= nil then
				local lastindex = string.find(input .. input_r, dirsep .. "[^" .. dirsep .. "]-$")
				currentdir = (input .. input_r):sub(1, lastindex-1)
			end
		end
		local lessheight = 48
		if #s.recentfiles > 0 and currentdir == "" and input == "" and input_r == "" then
			lessheight = lessheight + 16 + #s.recentfiles*8
			love.graphics.setColor(64,64,64)
			--love.graphics.rectangle("line", 7.5, love.graphics.getHeight()-lessheight+34.5, hoverarea+1, lessheight-59)
			--love.graphics.setColor(255,0,0)
			love.graphics.line(
				13.5, love.graphics.getHeight()-lessheight+34.5,
				7.5, love.graphics.getHeight()-lessheight+34.5,
				7.5, love.graphics.getHeight()-24.5,
				8.5+hoverarea, love.graphics.getHeight()-24.5,
				8.5+hoverarea, love.graphics.getHeight()-lessheight+34.5,
				20.5+font8:getWidth(L.RECENTLYOPENED), love.graphics.getHeight()-lessheight+34.5
			)
			love.graphics.setColor(255,255,255)
			love.graphics.print(L.RECENTLYOPENED, 18, love.graphics.getHeight()-(lessheight-25)+8)
			love.graphics.setScissor(8, love.graphics.getHeight()-(lessheight-23)+12, hoverarea, lessheight-48-12)

			local removerecent
			for k,v in pairs(s.recentfiles) do
				local mouseishovering = nodialog and not mousepressed and mouseon(8, love.graphics.getHeight()-(lessheight-23)+8+8*k, hoverarea, 8)
				if mouseishovering then
					hoveringlevel = v
				end
				if mouseishovering or tabselected == (-#s.recentfiles)+(k-1) then
					love.graphics.setColor(255,255,255,64)
					love.graphics.rectangle("fill", 8, love.graphics.getHeight()-(lessheight-23)+8+8*k, hoverarea, 8)
					love.graphics.setColor(255,255,0)
				end
				love.graphics.print(v .. ".vvvvvv", 18, love.graphics.getHeight()-(lessheight-25)+8+8*k)
				love.graphics.setColor(255,255,255)

				if tabselected == (-#s.recentfiles)+(k-1) and nodialog then
					if love.keyboard.isDown("return") then
						state6load(v)
					elseif love.keyboard.isDown("delete") then
						removerecent = k
					end
				end
			end
			if removerecent ~= nil then
				table.remove(s.recentfiles, removerecent)
				tabselected = 0
				saveconfig()
			end

			love.graphics.setScissor()
		end
		local k2 = 1
		if files[currentdir] ~= nil then
			love.graphics.setScissor(0, 22, love.graphics.getWidth()-128, love.graphics.getHeight()-lessheight)
			for k,v in pairs(files[currentdir]) do
				local prefix
				if currentdir == "" then
					prefix = ""
				else
					prefix = currentdir .. dirsep
				end
				local barename = v.name:sub(1, -8)
				if v.isdir then
					barename = v.name
				end
				if backupscreen or (input == "" and input_r == "") or (prefix .. v.name):lower():find("^" .. escapegsub(input .. input_r)) then
					local mouseishovering = nodialog and not mousepressed and mouseon(8, 14+8*k2+levellistscroll, hoverarea, 8) and mousein(0, 22, love.graphics.getWidth(), love.graphics.getHeight()-26)

					if mouseishovering then
						hoveringlevel = prefix .. barename
						if backupscreen and not v.isdir then
							hoveringlevel_k = k
						end
					end
					if mouseishovering or tabselected == k2 then
						love.graphics.setColor(255,255,255,64)
						love.graphics.rectangle("fill", 8, 14+8*k2+levellistscroll, hoverarea, 8)
						love.graphics.setColor(255,255,0)
					end

					if v.isdir then
						love.graphics.draw(smallfolder, 8, 14+8*k2+levellistscroll)
					end
					if backupscreen and not v.isdir then
						if v.overwritten == 0 then
							-- This is kind of a weird place for that file.
							love.graphics.draw(smallunknown, 8, 14+8*k2+levellistscroll)
							love.graphics.print(v.name, 18, 16+8*k2+levellistscroll)
						else
							-- Display the dates, we already know what the level is we're looking at.
							love.graphics.print("[" .. k .. "]", 18, 16+8*k2+levellistscroll)
							love.graphics.print(format_date(v.lastmodified), 66, 16+8*k2+levellistscroll)
							love.graphics.print(format_date(v.overwritten), 408, 16+8*k2+levellistscroll)
						end
					else
						love.graphics.print(v.name, 18, 16+8*k2+levellistscroll) -- y = 16+8*k
					end


					love.graphics.setColor(255,255,255)

					--[[
					if k2 == 1 and love.keyboard.isDown("tab") then
						input = v.name:sub(1, -8)
					end
					]]
					if tabselected == k2 and love.keyboard.isDown("return") and nodialog then
						state6load(prefix .. barename)
					end

					k2 = k2 + 1
				end

				lastk = k
			end
			love.graphics.setScissor()
		end

		-- Scrollbar
		if max_levellistscroll ~= (k2-1)*8 then
			levellistscroll = 0
			max_levellistscroll = (k2-1)*8
		end
		local newperonetage = scrollbar(16+hoverarea, 22, love.graphics.getHeight()-lessheight, max_levellistscroll, (-levellistscroll)/(max_levellistscroll-(love.graphics.getHeight()-lessheight)))

		if newperonetage ~= nil then
			levellistscroll = -(newperonetage*(max_levellistscroll-(love.graphics.getHeight()-lessheight)))
		end

		if (love.keyboard.isDown("up") or (keyboard_eitherIsDown("shift") and love.keyboard.isDown("tab"))) then
			if tabselected == 0 and #s.recentfiles > 0 and currentdir == "" and input == "" and input_r == "" then
				tabselected = -1
			elseif tabselected == 0 or tabselected < -#s.recentfiles then
				-- Start from the bottom.
				tabselected = k2-1
			end
		elseif tabselected >= k2 then
			if #s.recentfiles > 0 and currentdir == "" and input == "" and input_r == "" then
				tabselected = -#s.recentfiles
			else
				tabselected = 1
			end
		end
	end

	if not backupscreen then
		love.graphics.print(L.LOADTHISLEVEL .. input .. __, 10, love.graphics.getHeight()-18)
		if nodialog then
			startinputonce()
		end
	end

	if not secondlevel then
		hoverdraw(helpbtn, love.graphics.getWidth()-128+8, 8, 16, 16, 1)
	end
	if not state6old1 then
		hoverdraw(newbtn, love.graphics.getWidth()-32, 0, 32, 32, 2) -- -96
	else
		hoverdraw(retbtn, love.graphics.getWidth()-32, 0, 32, 32, 2)
	end

	if not mousepressed and nodialog and love.mouse.isDown("l") then
		if not secondlevel and mouseon(love.graphics.getWidth()-128+8, 8, 16, 16) then
			stopinput()
			tostate(15)
		elseif mouseon(love.graphics.getWidth()-32, 0, 32, 32) then -- -96
			if not state6old1 then
				-- New
				stopinput()
				triggernewlevel()
				-- Make sure we don't immediately click the next button
				nodialog = false
				mousepressed = true
			else
				-- Return to editor.
				stopinput()
				tostate(1, true)
				mousepressed = true
			end
		end
	end

	--love.graphics.print("Levels folder error: " .. lerror .. " (0 means no error)", 8, 16+8*lastk+16)
	--love.graphics.print("Levels folder: " .. anythingbutnil(levelsfolder), 8, 16+8*lastk+24)

	if not secondlevel then
		rbutton(L.VEDOPTIONS, 0, 40)
		rbutton(L.PLUGINS, 1, 40)
		rbutton(L.LANGUAGE, 2, 40)
		rbutton(L.SENDFEEDBACK, 6, 40, false, 20)
		if updatenotesavailable then
			rbutton(L.MOREINFO, 11, 40, false, 20)
		end
		if backupscreen then
			rbutton(L.RETURN, 0, nil, true)
		else
			rbutton(L.BACKUPS, 0, nil, true)
		end

		if s.pcheckforupdates and not opt_disableversioncheck then
			versionchecked = verchannel:peek()
		end

		local unsupportedpluginstext = ""

		if unsupportedplugins > 0 then
			unsupportedpluginstext = "\n\n" .. langkeys(L.NUMUNSUPPORTEDPLUGINS, {unsupportedplugins})
		end

		if intermediate_version then
			love.graphics.setColor(255,128,0)
		end
		if not s.pcheckforupdates or opt_disableversioncheck then
			love.graphics.printf(L.VERSIONDISABLED .. unsupportedpluginstext, love.graphics.getWidth()-(128-8), 217, 128-16, "left") -- 40+120+16+3+8+30 = 217
		elseif versionchecked ~= nil then		
			if versionchecked == "connecterror" or versionchecked == "error" then
				love.graphics.printf(L.VERSIONERROR .. unsupportedpluginstext, love.graphics.getWidth()-(128-8), 217, 128-16, "left")
			else
				if updateversion == nil then
					updateversion = ""
					local currentarticle = 1
					local currentarticlename = nil
					local currentarticlecontents
					local articlelines = explode("\n", versionchecked)
					for k, v in pairs(articlelines) do
						if v:sub(1,3) == "!>>" then
							currentarticlename = v:sub(4,-1)
							if (currentarticlename:sub(1,1) ~= "_" or allowdebug) then
								if currentarticle == 1 then
									updatenotesavailable = true
								else
									updatenotes[currentarticle].cont = table.concat(currentarticlecontents, "\n")
								end
								currentarticlecontents = {}
								currentarticle = currentarticle + 1
								updatenotes[currentarticle] = {subj = currentarticlename, imgs = {}, cont = nil}
							end
						else
							if currentarticlename == "_VERSION" then
								updateversion = updateversion .. v
							end
							if currentarticle ~= nil and (currentarticlename:sub(1,1) ~= "_" or allowdebug) then
								table.insert(currentarticlecontents, v)
							end
						end
					end
					if currentarticle ~= 1 then
						updatenotes[currentarticle].cont = table.concat(currentarticlecontents, "\n")
					end
				end
				if updateversion == "latest" then
					love.graphics.printf(L.VERSIONUPTODATE .. unsupportedpluginstext, love.graphics.getWidth()-(128-8), 217, 128-16, "left")
				else
					love.graphics.printf(langkeys(L.VERSIONOLD, {updateversion}) .. unsupportedpluginstext, love.graphics.getWidth()-(128-8), 217, 128-16, "left")
					updatebutton = true
				end
			end
		else
			love.graphics.printf(L.VERSIONCHECKING .. unsupportedpluginstext, love.graphics.getWidth()-(128-8), 217, 128-16, "left")
		end
		if intermediate_version then
			love.graphics.setColor(255,255,255)
		end

		if not mousepressed and nodialog and love.mouse.isDown("l") then
			if onrbutton(0, 40) then
				-- Ved options
				stopinput()
				tostate(13)

				mousepressed = true
			elseif onrbutton(1, 40) then
				-- Plugins
				stopinput()
				tostate(15, nil, "plugins")
			elseif onrbutton(2, 40) then
				-- Language
				languagedialog()
			elseif not mousepressed and onrbutton(6, 40, false, 20) then
				-- Test BUT "SEND FEEDBACK" FOR NOW
				--dialog.new("Auto-creation of a save file for VVVVVV coming soon!", "", 1, 1, 0)
				openurl("http://ved.idea.informer.com/")

				mousepressed = true
			elseif updatenotesavailable and not mousepressed and onrbutton(11, 40, false, 20) then
				-- Update notes and such
				stopinput()
				tostate(15, nil, {updatenotes, false})
			elseif not mousepressed and onrbutton(0, nil, true) then
				-- Backups/return
				if backupscreen and currentbackupdir ~= "" then
					currentbackupdir = ""
				else
					backupscreen = not backupscreen
					if backupscreen then
						input, input_r = "", ""
						currentbackupdir = ""
						stopinput()
					end
				end
				mousepressed = true
			end
		elseif oldstate == 13 and mousepressed and love.mouse.isDown("r") and mouseon(love.graphics.getWidth()-(128-8), 40+120, 128-16, 16) then
			-- Not a bug, it's a feature
			allowdebug = true
		end
	end
end
