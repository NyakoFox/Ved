dirsep, levelsfolder, loaded_filefunc, L = ...

local inchannel = love.thread.getChannel("allmetadata_in")
local outchannel = love.thread.getChannel("allmetadata_out")

require("love.filesystem")
require("vvvvvvxml")
require("filefunc_" .. loaded_filefunc)

-- Could do cons = print, but if you have 300 levels then that'd be chaos in the console
cons = function() end

while true do
	local level = inchannel:demand()

	local success, metadata = loadlevelmetadata(level.path)

	if not success then
		outchannel:push(
			{
				dir = level.dir,
				id = level.id,
				path = level.path,
				success = false,
				errmsg = metadata
			}
		)
	else
		metadata.dir = level.dir
		metadata.id = level.id
		metadata.path = level.path
		metadata.success = true
		outchannel:push(metadata)
	end
end