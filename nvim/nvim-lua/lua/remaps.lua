-- remaps.lua

-- [[ Basic vim key remaps ]]
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
-- {mode} Mode short-name (map command prefix: "n", "i", "v", "x", …) or "!" for :map!, or empty string for :map. "ia", "ca" or "!a" for abbreviation in Insert mode, Cmdline mode, or both, respectively

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true }) -- Holding down space wont repeat
vim.keymap.set({ 'n', 'v' }, '{', '[{', { silent = true, desc = 'Jump to parent bracket' })
vim.keymap.set({ 'n', 'v' }, '<S-Tab>', '[{', { silent = true, desc = 'Jump to parent bracket' })
vim.keymap.set({ 'n', 'v' }, '}', ']}', { silent = true, desc = 'Jump to next outer bracket' })
vim.keymap.set({ 'n', 'v' }, '<tab>', '%', { silent = true, desc = 'Jump between matching pairs' })
vim.keymap.set({ 'n' }, '<C-s>', '<Cmd>w<Cr>', { silent = true, desc = 'Save current buffer' })
vim.keymap.set({ 'n' }, '<Leader><Leader>', '<Cmd>b#<Cr>', { silent = true, desc = 'Jump to previously edited buffer' })

-- Left as a reminder, could use gj and gk for faster navigaton maybe but better to learn original binds?
-- vim.keymap.set({ 'n' }, 'gj', ']c', { silent = true, desc = 'Jump to start of next change' })
-- vim.keymap.set({ 'n' }, 'gk', '[c', { silent = true, desc = 'Jump to start of previous change' })

-- Traversing windows
vim.keymap.set({ 'n' }, '<C-h>', '<C-w>h', { silent = true, desc = 'Jump to left window' })
vim.keymap.set({ 'n' }, '<C-j>', '<C-w>j', { silent = true, desc = 'Jump to window below' })
vim.keymap.set({ 'n' }, '<C-k>', '<C-w>k', { silent = true, desc = 'Jump to window above' })
vim.keymap.set({ 'n' }, '<C-l>', '<C-w>l', { silent = true, desc = 'Jump to right window' })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Better yank/cut/paste
-- vim.keymap.set({ 'n', 'v' }, 'd', '"_d', { silent = true, desc = 'Delete to black hole register' }) -- Deletes go to register 1-9
-- vim.keymap.set('', 'p', '"0p', { silent = true, desc = 'Always paste latest yank' }) -- blank
-- vim.keymap.set({ 'n', 'v' }, 'P', '"0P', { silent = true, desc = 'Always paste latest yank' })
vim.keymap.set({ 'n', 'v' }, '+', '"1p', { silent = true, desc = '' })
 --         ["+"] = { "\"0p", "Paste latest yank" },

-- Search and replace
-- " Replace word under cursor
-- nnoremap <leader>r :%s/\<<C-r><C-w>\>//c<Left><Left>
-- vnoremap <leader>r :s/\<<C-r><C-w>\>//c<Left><Left>

vim.keymap.set('v', 'J', ":m '>+1<Cr>gv=gv", { silent = true, desc = 'Move visual selection down' })
vim.keymap.set('v', 'K', ":m '<-2<Cr>gv=gv", { silent = true, desc = 'Move visual selection up' })
vim.keymap.set('v', ':p', "y:<C-r>\"<C-b>", { silent = true, desc = 'Paste visual selection in cmdline' })
vim.keymap.set('v', ':re', "\"hy:%s/<C-r>h//c<Left><Left>", { silent = true, desc = 'Replace the visual selection elsewhere' })
vim.keymap.set('v', ':ri', ":s/\\%V\\%V/<Left><Left><Left><Left>", { silent = true, desc = 'Replace inside visual selection' })


--
-- Abbreviations
--
vim.cmd('abb clog; console.log( );<Left><Left><Left>')

