--require("sidebar-nvim").setup({
--    disable_default_keybindings = 0,
--    bindings = nil,
--    open = false,
--    side = "left",
--    initial_width = 35,
--    hide_statusline = false,
--    update_interval = 1000,
--    sections = { "datetime", "git", "diagnostics" },
--    section_separator = {"", "-----", ""},
--    containers = {
--        attach_shell = "/bin/sh", show_all = true, interval = 5000,
--    },
--    datetime = { format = "%a %b %d, %H:%M", clocks = { { name = "local" } } },
--    todos = { ignored_paths = { "~" } },
--    disable_closing_prompt = false
--})

require("sidebar-nvim").setup({
    disable_default_keybindings = 0,
    bindings = { ["q"] = function() require("sidebar-nvim").close() end },
    --bindings = nil,
    open = false,
    side = "right",
    initial_width = 30,
    hide_statusline = true,
    update_interval = 1000,
    section_separator = "-----",
    sections = {
        "git", "symbols", "todos", "diagnostics", "buffers"
        --"git", "symbols", "todos", "diagnostics", "buffers", "containers"
    },
    buffers = {icon = "", ignored_buffers = {"NvimTree", "SidebarNvim_*"}},
    files = {
        icon = "",
        show_hidden = false,
        ignored_paths = {"%.git$", "node_modules$"}
    },
    symbols = {icon = "ƒ"},
    containers = {
        icon = "",
        use_podman = false,
        attach_shell = "/bin/sh",
        show_all = true, -- whether to run `docker ps` or `docker ps -a`
        interval = 2000 -- the debouncer time frame to limit requests to the docker daemon
    },
    datetime = {format = "%a %b %d, %H:%M", clocks = {{name = "time"}}},
    todos = {
        icon = "",
        ignored_paths = {"~"}, -- ignore certain paths, this will prevent huge folders like $HOME to hog Neovim with TODO searching
        initially_closed = false -- whether the groups should be initially closed on start. You can manually open/close groups later.
    },
    diagnostics = {icon = ""},
    disable_closing_prompt = true
})

