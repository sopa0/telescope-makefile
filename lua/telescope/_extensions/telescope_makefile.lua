local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local action_state = require("telescope.actions.state")
local actions = require("telescope.actions")
local Terminal = require("toggleterm.terminal").Terminal

local function get_targets()
	local handle = io.popen("make -rpn | sed -n -e '/^$/ { n ; /^[^ .#][^ ]*:/ { s/:.*$// ; p ; } ; }'")
	local data = handle:read("*a")
	local targets = {}

	for target in data:gmatch("([^\n]*)\n?") do
    table.insert(targets, target)
	end

	return targets
end

local function run_target(cmd)
	local run_term = Terminal:new({
		cmd = "make " .. cmd[1],
		direction = "horizontal",
		close_on_exit = false,
	})

	run_term:toggle()
end

local telescope_makefile = function(opts)
	pickers.new(opts, {
		prompt_title = "Makefile",
		finder = finders.new_table(get_targets()),
		sorter = conf.generic_sorter({}),
		attach_mappings = function(prompt_bufnr, _)
            actions.select_default:replace(function ()
                actions.close(prompt_bufnr)
				local command = action_state.get_selected_entry()
                if not command then
                    return
                end
				run_target(command)
            end)
			return true
		end,
	}):find()
end

return require("telescope").register_extension({
	exports = {
		telescope_makefile = telescope_makefile,
	},
})
