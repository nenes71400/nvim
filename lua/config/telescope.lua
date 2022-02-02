local pickers       = require("telescope.pickers")
local finders       = require("telescope.finders")
local previewers    = require("telescope.previewers")
local action_state  = require("telescope.actions.state")
local conf          = require("telescope.config").values
local actions       = require("telescope.actions")
local sorters       = require("telescope.sorters")

local custom_actions = {}

require('telescope').setup {
  defaults = {
    prompt_prefix = " ",
    -- prompt_prefix         = "$",
    color_devicons        = true,
    --hidden                = true,
    --file_ignore_patterns  = {"node_modules", "%.jpg", "%.png"},
    file_sorter           = sorters.get_fzy_sorter,
    generic_sorter        = sorters.get_fzf_sorter,
    --vimgrep_arguments   = {"rg", "--follow", "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case"},

    file_previewer   = previewers.vim_buffer_cat.new,
    grep_previewer   = previewers.vim_buffer_vimgrep.new,
    qflist_previewer = previewers.vim_buffer_qflist.new,

    mappings = {
      i = {
        --          Close on first esc instead of gonig to normal mode
        --["<esc>"] = actions.close,
        ["<A-q>"]   = actions.send_selected_to_qflist,
        ["<c-q>"]   = actions.send_to_qflist,
        ["<s-tab>"] = actions.toggle_selection + actions.move_selection_next,
        ["<tab>"]   = actions.toggle_selection + actions.move_selection_previous,
        ["<cr>"]    = custom_actions.multi_selection_open,
        ["<c-v>"]   = custom_actions.multi_selection_open_vsplit,
        ["<c-s>"]   = custom_actions.multi_selection_open_split,
        ["<c-t>"]   = custom_actions.multi_selection_open_tab
      },
      n = {}
    }
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter    = true,
    },
  },
}

require('telescope').load_extension("file_browser")
require('telescope').load_extension('fzf')
-- require('telescope').load_extension("fzy_native")
--require('telescope').load_extension("projects")
--require('telescope').load_extension("zoxide")
--require('telescope').load_extension("heading")
--require('telescope').load_extension('coc')
-- require("telescope").load_extension("git_worktree")


local mappings = {}

mappings.curr_buf = function()
  local opt = require('telescope.themes').get_dropdown({height=10, previewer=false})
  require('telescope.builtin').current_buffer_fuzzy_find(opt)
end

mappings.search_tuto = function()
  require('telescope.builtin').find_files({prompt_title = "< Tuto >",cwd = "~/Tuto/", hidden = false})
end

mappings.search_dotfiles = function()
  --require('telescope.builtin').find_files({prompt_title = "< Dotfiles >", cwd = "~/dotfiles/", hidden = true})
  require('telescope.builtin').git_files({prompt_title = "< Dotfiles >", cwd = "~/dotfiles/"})
end

return mappings


