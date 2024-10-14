-- options.lua

-- [[ Setting standard vim options ]]
-- See `:help vim.o`

-- Set default tab widths
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true

-- Set highlight on search
vim.o.hlsearch = false
-- Use global search/replace by default
vim.o.gdefault = true
-- Make line numbers default
vim.wo.number = true
-- Keep space above/below cursor
vim.o.scrolloff = 5
-- Highlight current line
vim.o.cursorline = true
-- Enable break indent
vim.o.breakindent = true
-- Soft linebreaks to stop wrapping in the middle
vim.o.linebreak = true
-- Save undo history
vim.o.undofile = true
-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true
-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'
-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 500
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'
-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true
-- Enable mouse mode
-- vim.o.mouse = 'a'
-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- vim.o.clipboard = 'unnamedplus'

