-- options/draw

return function()
	ved_print(L.VEDOPTIONS, 8, 8+4)

	for k,v in pairs({
			"dialoganimations",
			"flipsubtoolscroll",
			"adjacentroomlines",
			"neveraskbeforequit",
			"coords0",
			"showfps",
			false,
			"checkforupdates",
			"pausedrawunfocused",
			"enableoverwritebackups",
			false,
			"autosavecrashlogs",
			"loadallmetadata",
			"usefontpng",
			"uselevelfontpng",
			"opaqueroomnamebackground"
		}
	) do
		if v then
			local label = L[v:upper()]
			local affects_font = false
			if v == "usefontpng" or v == "uselevelfontpng" then
				if love_version_meets(10) then
					affects_font = true
				else
					label = label .. langkeys(L.REQUIRESHIGHERLOVE, {"0.10.0"})
				end
			end

			checkbox(s[v], 8, 8+(24*k), v, label,
				function(key, newvalue)
					s[key] = newvalue
					if key == "showfps" then
						savedwindowtitle = ""
					elseif affects_font then
						loadfonts()
						unloadlanguage()
						loadlanguage()
					end
				end
			)
		end
	end

	ved_print(L.FPSLIMIT, 8, 8+(24*7)+4)
	int_control(16+font8:getWidth(L.FPSLIMIT), 8+(24*7), "fpslimit_ix", 1, 4, nil, nil,
		function(value)
			local ret = ({"30", "60", "120", "---"})[value]
			if ret == nil then
				return "??"
			end
			return ret
		end, 24
	)

	if s.enableoverwritebackups then
		ved_print(L.AMOUNTOVERWRITEBACKUPS, 8, 8+(24*11)+4)
		int_control(16+font8:getWidth(L.AMOUNTOVERWRITEBACKUPS), 8+(24*11), "amountoverwritebackups", 0, 999)
	end

	ved_print(
		ERR_VEDVERSION .. " " .. ved_ver_human() .. "\n"
		.. ERR_LOVEVERSION .. " " .. love_ver_human(),
		8, love.graphics.getHeight()-23
	)
end
