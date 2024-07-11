-- <-----------------<>------------------>
--    Speedlight NeoVim configuration     
-- https:/github.com/speedlight/dotfiles 
-- <-----------------<>------------------>

vim.opt.compatible = false
vim.cmd('set termguicolors')
vim.cmd('filetype off')
vim.cmd('filetype plugin indent on')

-- Set encoding and other options
vim.opt.encoding = 'utf-8'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.laststatus = 2
vim.opt.termguicolors = true
vim.opt.showcmd = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Set the runtime path to include Vundle and initialize
vim.opt.rtp:append('~/.config/nvim/bundle/Vundle.vim')

vim.cmd([[
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'hashivim/vim-terraform'
Plugin 'sindrets/diffview.nvim'
Plugin 'windwp/nvim-autopairs'
Plugin 'nvim-lualine/lualine.nvim'
Plugin 'nvim-lua/plenary.nvim'
Plugin 'nvim-telescope/telescope.nvim'
Plugin 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plugin 'numToStr/Comment.nvim'

Plugin 'catppuccin/nvim', { 'as': 'catppuccin' }
Plugin 'chriskempson/base16-vim'
call vundle#end()
]])

require('lualine').setup {
  options = {
    theme = 'onelight',
  },
}

require("diffview").setup()
require("nvim-autopairs").setup {}
require('Comment').setup()

-- Telescope keymaps
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Airline and indentLine settings
vim.g.airline_powerline_fonts = 1
vim.g.indentLine_color_term = 239
vim.g.python_highlight_all = 1

-- PEP8 Tabulation for Python
vim.cmd([[
autocmd FileType python set sw=4 ts=4 sts=4
autocmd FileType html,yml set sw=2 ts=2 sts=2
]])

-- Treesitter
-- require'nvim-treesitter.configs'.setup {
--   -- A list of parser names, or "all" (the listed parsers MUST always be installed)
--   ensure_installed = { "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "hcl", "terraform" },
-- 
--   -- Install parsers synchronously (only applied to `ensure_installed`)
--   sync_install = false,
-- 
--   -- Automatically install missing parsers when entering buffer
--   -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
--   auto_install = false,
-- }

-- Keybinds
vim.g.mapleader = ","
vim.api.nvim_set_keymap('n', '<F2>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<MouseMiddle>', '<esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F12>', ':bn<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-F12>', ':bp<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '+', ':tabnew<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '-', ':tabclose<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', ':tabn<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-A-Tab>', ':tabp<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })

-- Enable syntax highlighting
if vim.fn.has('syntax') == 1 then
  vim.cmd('syntax on')
end

vim.cmd('syntax on')
vim.cmd.colorscheme "catppuccin-macchiato"

