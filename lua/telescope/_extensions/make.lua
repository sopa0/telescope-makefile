local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local action_state = require("telescope.actions.state")
local actions = require("telescope.actions")
local Terminal = require("toggleterm.terminal").Terminal
local config   = require("telescope-makefile.config")

local function get_targets()
    local data
    for _, make_dir in ipairs(config.makefile_priority) do
        local handle = io.popen("make -rpn -C " .. make_dir .. " 2>/dev/null | sed -n -e '/^$/ { n ; /^[^ .#][^ ]*:/ { s/:.*$// ; p ; } ; }' 2>/dev/null")
        if not handle then
            break
        end
        data = handle:read("*a")
        io.close(handle)
        if #data ~= 0 then
            break
        end
    end
    if #data == 0 then
        return
    end
	return vim.split(string.sub(data, 1, #data - 1), '\n')
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
    local targets = get_targets()
    if not targets then
        vim.notify("No make targets")
        return
    end
	pickers.new(opts, {
		prompt_title = "Make",
		finder = finders.new_table(targets),
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
		make = telescope_makefile,
	},
})
