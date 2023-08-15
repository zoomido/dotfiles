---@type MappingsTable
local M = {}
local utils = require("custom.utils")

M.general = {
    n = {
        ["<space>"] = { "<nop>", "No action" },
        ["{"] = { "[{", "Jump to parent bracket" },
        ["}"] = { "]}", "Jump to next outer bracket" },
        ["-"] = { "%", "Jump between matching pair" },
        ["<leader>X"] = { ":qa!<CR>", "Quit all windows, force" },
        ["<leader>s"] = { "/", "Start search" },
        ["+"] = { "\"0p", "Paste latest yank" },
        ["<leader>g"] = {
            function()
                utils.grep()
            end,
            "Custom grep"
        },
    },
-- " Replace word under cursor
-- nnoremap <leader>r :%s/\<<C-r><C-w>\>//c<Left><Left>
-- vnoremap <leader>r :s/\<<C-r><C-w>\>//c<Left><Left>
--
    v = {
        ["-"] = { "%", "Jump between matching pair" },
        ["J"] = { ":m '>+1<CR>gv=gv", "Move selection down"},
        ["K"] = { ":m '<-2<CR>gv=gv", "Move selection up"},
        [":p"] = { "y:<C-r>\"<C-b>", "Paste visual selection in cmdline"},
        ["r"] = { "\"hy:%s/<C-r>h//c<left><left><left>", "Replace the visual selection everywhere"},
        [":r"] = { ":s/\\%V\\%V/<Left><Left><Left><Left>", "Replace inside visual selection"},
    },
    -- x = {
    --     ["+"] = { "d", "Cut" },
    -- },
}

M.nvimtree = {
    n = {
        ["<leader>ms"] = {
            function()
                require("nvim-tree.api").marks.navigate.select()
            end, "Select marks"
        },
        -- ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
    },
}

M.telescope = {
    n = {
        -- ["<leader><leader>"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
        ["<leader>b"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
        ["<leader>fb"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },
        ["<leader>t"] = { function()
            require('telescope.builtin').builtin { include_extensions = true }
        end, "Find in current buffer" },
    },
}

return M
