local config = {}

config.defaults = {
    -- The path where to search the makefile in the priority order
	makefile_priority = { ".", "build/" },
}

setmetatable(config, { __index = config.defaults })

return config
