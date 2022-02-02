local map = vim.api.nvim_set_keymap
default_options = {noremap = true, silent = true}
expr_options = {noremap = true, expr = true, silent = true}

-- map the leader key
vim.g.mapleader = ","

-- map EsayAlign
map('n', 'ga', '<Plug>(EasyAlign)', { noremap = false, silent = true })
map('x', 'ga', '<Plug>(EasyAlign)', { noremap = false, silent = true })

--- Cancel search highlighting with ESC
map("n", "<leader><ESC>", ":nohlsearch<Bar>:echo<CR>", default_options)

-------------------------------------------------------------------------------
--  split
-------------------------------------------------------------------------------
-- Move next split
map("n", "<leader>ww", '<c-w>w', default_options)
-- Swap split
map("n", "<leader>ws", '<c-w>x', default_options)
-- New vertical split
map("n", "<leader>wv", '<c-w>v', default_options)
-- New horizontal split
map("n", "<leader>wb", '<cmd>split<cr>', default_options)
-- Close split
map("n", "<leader>wq", '<c-w>q', default_options)

-------------------------------------------------------------------------------
--  Telescope
-------------------------------------------------------------------------------
-- CRTL / search telescope current buffer
map("n", "<c-_>", '<cmd>lua require("config.telescope").curr_buf()<CR>', default_options)
-- search telescope find_file
map("n", "<leader>ff", '<cmd>Telescope find_files<CR>', default_options)
-- search telescope tuto
map("n", "<leader>ft", "<cmd>lua require('config.telescope').search_tuto()<CR>", default_options)
-- search telescope dotfiles
map("n", "<leader>fd", "<cmd>lua require('config.telescope').search_dotfiles()<CR>", default_options)
-- search telescope buffer
map("n", "<leader>fb", "<cmd>lua require'telescope.builtin'.buffers({ sort_mru = true, ignore_current_buffer = true })<CR>", default_options)
-- search telescope old file
map("n", "<leader>fr", "<cmd>lua require'telescope.builtin'.oldfiles()<CR>", default_options)
-- search telescope tree
map("n", "<leader>fe", "<cmd>Telescope file_browser<CR>", default_options)
-- search telescope live grep
map("n", "<leader>fg", "<cmd>lua require'telescope'.extensions.live_grep_raw.live_grep_raw()<CR>", default_options)

-------------------------------------------------------------------------------
-- Tree
-------------------------------------------------------------------------------
map("n", "<leader>t", "<cmd>NvimTreeToggle<CR>", default_options)

-------------------------------------------------------------------------------
-- Git fugitive
-------------------------------------------------------------------------------
map("n", "<leader>gs", "<cmd>G<CR>", default_options)
--map("n", "<leader>gc", "<cmd>Git commit<CR>", default_options)
--map("n", "<leader>gp", "<cmd>Git push<CR>", default_options)
map("n", "<leader>gf", "<cmd>diffget //2<CR>", default_options)
map("n", "<leader>gh", "<cmd>diffget //2<CR>", default_options)

---- paste over currently selected text without yanking it
--map("v", "p", "\"_dP", default_options)

-- Tab switch buffer
--map("n", "<TAB>", ":bnext<CR>", default_options)
--map("n", "<S-TAB>", ":bprevious<CR>", default_options)
--
---- Resizing panes
--map("n", "<c-><s-><Left>", ":vertical resize +1<CR>", default_options)
--map("n", "<Right>", ":vertical resize -1<CR>", default_options)
--map("n", "<Up>", ":resize -1<CR>", default_options)
--map("n", "<Down>", ":resize +1<CR>", default_options)
