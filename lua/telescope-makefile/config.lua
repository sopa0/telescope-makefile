local config = {}

config.defaults = {
    -- The path where to search the makefile in the priority order
	makefile_priority = { ".", "build/" },
    default_target = '[DEFAULT]', -- nil or string : Name of the default target | nil will disable the default_target
}

setmetatable(config, { __index = config.defaults })

return config
