local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
function get_config(name)
    return string.format("require(\"config/%s\")", name)
end

-- bootstrap packer if not installed
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
        "git", "clone", "https://github.com/wbthomason/packer.nvim",
        install_path
    })
    execute "packadd packer.nvim"
end

-- initialize and configure packer
local packer = require("packer")
packer.init {
    enable = true, -- enable profiling via :PackerCompile profile=true
    threshold = 0 -- the amount in ms that a plugins load time must be over for it to be included in the profile
}
local use = packer.use
packer.reset()

local packer_compiled = vim.fn.stdpath('config') .. '/plugin/packer_compiled.lua'

-- actual plugins list
use "wbthomason/packer.nvim"

use {"nvim-telescope/telescope.nvim", requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}, config = get_config("alexis")}

--use {"crispgm/telescope-heading.nvim"}
use {"nvim-telescope/telescope-symbols.nvim"}
use {"nvim-telescope/telescope-file-browser.nvim"}
use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}
use {"jvgrootveld/telescope-zoxide"}
use {"fannheyward/telescope-coc.nvim"} --, config = get_config("telescope-coc")}

-- Symbole git dans colonne vim
use {'airblade/vim-gitgutter'}

-- Naviguer avec tmux
use {"numToStr/Navigator.nvim", config = get_config("navigator")}

-- Arbre fichier
use {"kyazdani42/nvim-tree.lua", config = get_config("nvim-tree")}

-- Status barre
use { "nvim-lualine/lualine.nvim", config = get_config("lualine"), event = "VimEnter", requires = {"kyazdani42/nvim-web-devicons", opt = true}}

-- Color variables
use {"norcalli/nvim-colorizer.lua", event = "BufReadPre", config = get_config("colorizer")}

-- Commande git
--use {"tpope/vim-fugitive"}

-- parenthèse
use {"tpope/vim-surround"}

-- parenthèse
use {"windwp/nvim-autopairs", config = get_config("autopairs")}

-- Meilleur coloration syntax
use {"nvim-treesitter/nvim-treesitter", config = get_config("treesitter"), run = ":TSUpdate"}

--use "nvim-treesitter/nvim-treesitter-textobjects"

--use {
--    "hrsh7th/nvim-cmp",
--    requires = {
--        {"hrsh7th/cmp-nvim-lsp"}, {"hrsh7th/cmp-buffer"}, {"hrsh7th/cmp-path"},
--        {"hrsh7th/cmp-cmdline"}, {"hrsh7th/cmp-vsnip"},
--        {"f3fora/cmp-spell", {"hrsh7th/cmp-calc"}}
--    },
--    config = get_config("cmp")
--}

-- snipet
--use {"hrsh7th/vim-vsnip", config = get_config("vsnip")}
--use {"rafamadriz/friendly-snippets", requires = {{"hrsh7th/vim-vsnip"}}}

--use {"mhartington/formatter.nvim", event = "BufWritePre", config = get_config("formatter")}

-- requirement for Neogit
-- GitDiff
use {
  "sindrets/diffview.nvim",
  cmd = {
    "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles",
    "DiffviewFocusFiles"
  },
  config = get_config("diffview")
}
-- Git utils
use {"TimUntersberger/neogit", requires = {"nvim-lua/plenary.nvim"}, cmd = "Neogit", config = get_config("neogit")}

-- Affichage Auteur commit
use {"f-person/git-blame.nvim", config = get_config("git-blame")}

-- Git utils ???
use {"lewis6991/gitsigns.nvim", requires = {"nvim-lua/plenary.nvim"}, event = "BufReadPre", config = get_config("gitsigns")}

-- Quickfix list
--use {"kevinhwang91/nvim-bqf", requires = {{"junegunn/fzf", module = "nvim-bqf"}}}

-- Buffer liNe on top
use { "akinsho/nvim-bufferline.lua", requires = "kyazdani42/nvim-web-devicons", event = "BufReadPre", config = get_config("bufferline")}

use "famiu/bufdelete.nvim"

--use {"folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons", cmd = {"TroubleToggle", "Trouble"}, config = get_config("trouble")}

-- TODO ??
use {"folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim", cmd = {"TodoTrouble", "TodoTelescope"}, event = "BufReadPost", config = get_config("todo")}

use {"ahmedkhalf/project.nvim", config = get_config("project")}

-- racourci clavier
use {"folke/which-key.nvim", event = "VimEnter", config = get_config("which")}

-- Alignement
use "junegunn/vim-easy-align" -- no lua alternative

-- Scoll
use {"karb94/neoscroll.nvim", keys = {"<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-e>", "zt", "zz", "zb"}, config = get_config("neoscroll")}

--use {"ThePrimeagen/harpoon", keys = {"<leader>ha", "<leader>hu", "<leader>h1", "<leader>h1", "<leader>h3", "<leader>h4"}, requires = {"nvim-lua/plenary.nvim"}}


-- Commande Line
--use {"VonHeikemen/fine-cmdline.nvim", requires = {"MunifTanjim/nui.nvim"}, config = get_config("fine-cmdline")}

use {"sidebar-nvim/sidebar.nvim", config = get_config("sidebar")}

use {"famiu/nvim-reload", config = get_config("nvim-reload")}

--use {"rcarriga/nvim-notify", config = get_config("notify")}

-- Vim Transparent
use {"xiyaowong/nvim-transparent", config = get_config("transparent")}

-- Theme
--use {'folke/tokyonight.nvim', config = get_config("tokyonight") }
--use {'ellisonleao/gruvbox.nvim', config = get_config("theme") }
use {'morhetz/gruvbox', config = get_config("theme") }
--use {"NTBBloodbath/doom-one.nvim", config = get_config("doom-one")}

