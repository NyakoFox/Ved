function load()
	-- Reeeeeally old version of love, I see
	love.load()
	
	draw = love.draw
end

function love.load()
	love.graphics.setCaption("Ved")

	-- Get the strings from every language!
	local languagesarray = love.filesystem.enumerate("lang")
	message = ""
	
	for k,v in pairs(languagesarray) do
		if v:sub(-4,-1) == ".lua" then
			require("lang/" .. v:sub(1,-5))
			
			message = message .. L.FATALERROR .. L.OUTDATEDLOVE .. "\n\n"
		end
	end
end

function love.draw()
	--love.graphics.printf("FATAL ERROR: Your version of L{ve is outdated. Please use version 0.9.0 or higher. You can download the latest version of L{ve from http://love2d.org/.\n\n", 10, 10, love.graphics.getWidth()-20, "left")
	love.graphics.printf(message, 10, 10, love.graphics.getWidth()-20, "left")
end