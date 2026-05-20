-- remaps.lua

-- See `:help vim.keymap.set()`
-- {mode} Mode short-name (map command prefix: "n", "i", "v", "x", …) or "!" for :map!, or empty string for :map. "ia", "ca" or "!a" for abbreviation in Insert mode, Cmdline mode, or both, respectively

--
-- General keybinds
--
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true }) -- Holding down space wont repeat
vim.keymap.set({ 'n' }, '<C-s>', '<Cmd>w<Cr>', { silent = true, desc = 'Save current buffer' })
vim.keymap.set({ 'n', 't' }, '<C-q>', '<Cmd>q<Cr>', { silent = true, desc = 'Close current buffer' })
vim.keymap.set({ 'n', 't' }, '<C-x>', '<Cmd>bd<Cr>', { silent = true, desc = 'Close current window' })
vim.keymap.set({ 'n' }, '<Leader><Leader>', '<Cmd>b#<Cr>', { silent = true, desc = 'Jump to previously edited buffer' })
-- vim.keymap.set({ 'i' }, 'ii', '<Esc>', { silent = true, desc = 'Escape insert mode' })
vim.keymap.set('v', 'J', ":m '>+1<Cr>gv=gv", { silent = true, desc = 'Move visual selection down' })
vim.keymap.set('v', 'K', ":m '<-2<Cr>gv=gv", { silent = true, desc = 'Move visual selection up' })
vim.keymap.set('n', 'v_', "^vg_", { silent = true, desc = 'Select line without line ending char' })


--
-- Navigation keybinds
--
-- vim.keymap.set({ 'n', 'v' }, '{', '[{', { silent = true, desc = 'Jump to parent bracket' })
vim.keymap.set({ 'n', 'v' }, '<S-Tab>', '[{', { silent = true, desc = 'Jump to parent bracket' })
-- vim.keymap.set({ 'n', 'v' }, '}', ']}', { silent = true, desc = 'Jump to next outer bracket' })
vim.keymap.set({ 'n', 'v' }, '<Tab>', '%', { silent = true, desc = 'Jump between matching pairs' })
-- vim.keymap.set({ 'n' }, '<Tab>', '<Plug>(MatchitNormalForward)', { silent = true, desc = 'Jump between matching pairs' })
-- vim.keymap.set({ 'v' }, '<Tab>', '<Plug>(MatchitVisualForward)', { silent = true, desc = 'Jump between matching pairs' })

-- Left as a reminder, could use gj and gk for faster navigaton maybe but better to learn original binds?
-- vim.keymap.set({ 'n' }, 'gj', ']c', { silent = true, desc = 'Jump to start of next change' })
-- vim.keymap.set({ 'n' }, 'gk', '[c', { silent = true, desc = 'Jump to start of previous change' })

-- Traversing windows
vim.keymap.set({ 'n' }, '<C-h>', '<C-w>h', { silent = true, desc = 'Jump to left window' })
vim.keymap.set({ 'n' }, '<C-j>', '<C-w>j', { silent = true, desc = 'Jump to window below' })
vim.keymap.set({ 'n' }, '<C-k>', '<C-w>k', { silent = true, desc = 'Jump to window above' })
vim.keymap.set({ 'n' }, '<C-l>', '<C-w>l', { silent = true, desc = 'Jump to right window' })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true})
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true})

--
-- Better yank/cut/paste
--
-- Use capital P, it will paste in insert mode without overriding yank register (")
vim.keymap.set({ 'n', 'v' }, 'x', '"_x', { silent = true, desc = 'Dont put deleted text into yank register' }) -- Deletes go to register 1-9
vim.keymap.set({ 'n', 'v' }, 'X', '"_X', { silent = true, desc = 'Dont put deleted text into yank register' }) -- Deletes go to register 1-9
vim.keymap.set({ 'n', 'v' }, 'd', '"_d', { silent = true, desc = 'Dont put deleted text into yank register' }) -- Deletes go to register 1-9
vim.keymap.set({ 'n', 'v' }, 'D', '"_D', { silent = true, desc = 'Dont put deleted text into yank register' }) -- Deletes go to register 1-9
vim.keymap.set({ 'n', 'v' }, 'c', '"_c', { silent = true, desc = 'Dont put changed text into yank register' }) -- Deletes go to register 1-9
vim.keymap.set({ 'n', 'v' }, 'C', '"_C', { silent = true, desc = 'Dont put changed text into yank register' }) -- Deletes go to register 1-9
vim.keymap.set({ 'v' }, 'p', '"0p', { silent = true, desc = '[p]aste latest yank in visual mode' })
vim.keymap.set({ 'v' }, 'p', '"0P', { silent = true, desc = '[P]aste latest yank in visual mode' })
vim.keymap.set({ 'v' }, '+', '"0ygvd"', { silent = true, desc = 'Cut to yank register' }) -- Deletes go to register 1-9
 --         ["+"] = { "\"0p", "Paste latest yank" },
vim.keymap.set({ 'v' }, ':p', "y:<C-r>\"<C-b>", { silent = true, desc = 'Paste visual selection in cmdline' })

--
-- Search and replace
--
vim.keymap.set('v', ':re', "\"hy:%s/<C-r>h//c<Left><Left>", { silent = true, desc = 'Replace the visual selection elsewhere' })
vim.keymap.set('v', ':ri', ":s/\\%V\\%V/<Left><Left><Left><Left>", { silent = true, desc = 'Replace inside visual selection' })

local function search_in_visible_lines()
  local scrolloff = vim.o.scrolloff
  vim.o.scrolloff = 0
  vim.cmd.norm(vim.api.nvim_replace_termcodes("VHoL<Esc>", true, true, true))
  vim.o.scrolloff = scrolloff
  vim.cmd.norm("``")
  vim.fn.feedkeys("/\\%V")
end
vim.keymap.set("n", "z/", search_in_visible_lines)

--
-- Abbreviations
--
vim.cmd('abb clog; console.log( );<Left><Left><Left>')

--
-- Toggle checkboxes
--
vim.keymap.set('n', '<leader>x', function()
    local line = vim.api.nvim_get_current_line()

    -- capture leading whitespace + optional list marker
    local indent, bullet, rest = line:match("^(%s*)([-*+]%s+)(.*)")
    if not indent then
        indent, rest = line:match("^(%s*)(.*)")
        bullet = ""
    end

    -- toggle states [ ] -> [X] -> '' inside the "rest"
    if rest:match("^%[ %]") then
        rest = rest:gsub("^%[ %]%s*", "[X] ", 1)

    elseif rest:match("^%[X%]") then
        rest = rest:gsub("^%[X%]%s*", "", 1)

    else
        rest = "[ ] " .. rest
    end

    vim.api.nvim_set_current_line(indent .. (bullet or "") .. rest)
end, { desc = 'Toggle markdown checkbox (3-state)' })

