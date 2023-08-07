-- Put all custom stuff here
local opt = vim.opt

-- Examples
-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

opt.clipboard = ""
opt.timeoutlen = 1000 -- Time in milliseconds to wait for a mapped sequence to complete

-- Indenting
opt.shiftwidth = 4 -- When indenting with '>>', '<<' or '==', use 4 spaces width
opt.tabstop = 4 -- Number of spaces that a <Tab> in the file counts for
opt.softtabstop = 4 -- Change number of spaces that a <Tab> counts for during editing ops
opt.scrolloff = 3 -- Minimal number of screen lines to keep above and below the cursor
