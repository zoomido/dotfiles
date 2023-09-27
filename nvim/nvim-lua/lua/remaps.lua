-- remaps.lua

-- [[ Basic vim key remaps ]]
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true }) -- Holding down space wont repeat
vim.keymap.set({ 'n', 'v' }, '{', '[{', { silent = true, desc = 'Jump to parent bracket' })
vim.keymap.set({ 'n', 'v' }, '}', ']}', { silent = true, desc = 'Jump to next outer bracket' })
vim.keymap.set({ 'n', 'v' }, '-', '%', { silent = true, desc = 'Jump between matching pairs' })
vim.keymap.set({ 'n' }, '<C-s>', '<Cmd>w<Cr>', { silent = true, desc = 'Save current buffer' })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Better yank/cut/paste
 --         ["+"] = { "\"0p", "Paste latest yank" },


-- Search and replace
-- " Replace word under cursor
-- nnoremap <leader>r :%s/\<<C-r><C-w>\>//c<Left><Left>
-- vnoremap <leader>r :s/\<<C-r><C-w>\>//c<Left><Left>

vim.keymap.set('v', 'J', ":m '>+1<Cr>gv=gv", { silent = true, desc = 'Move visual selection down' })
vim.keymap.set('v', 'K', ":m '<-2<Cr>gv=gv", { silent = true, desc = 'Move visual selection up' })
vim.keymap.set('v', ':p', "y:<C-r>\"<C-b>", { silent = true, desc = 'Paste visual selection in cmdline' })
vim.keymap.set('v', 'r', "\"hy:%s/<C-r>h//c<Left><Left><Left>", { silent = true, desc = 'Replace the visual selection everywhere' })
vim.keymap.set('v', ':r', ":s/\\%V\\%V/<Left><Left><Left><Left>", { silent = true, desc = 'Replace inside visual selection' })

