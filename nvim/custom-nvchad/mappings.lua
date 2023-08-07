---@type MappingsTable
local M = {}
local utils = require("custom.utils")

M.general = {
    n = {
        ["<space>"] = { "<nop>", "No action" },
        ["<leader>X"] = { ":qa<CR>", "Quit all windows" },
        ["<leader>s"] = { "/", "Start search" },
        ["+"] = { "\"0p", "Paste latest yank" },
        ["<leader>g"] = { 
            function()
                utils.grep()
            end,
            "Custom grep"
        },
    },
    v = {
        ["J"] = { ":m '>+1<CR>gv=gv", "Move selection down"},
        ["K"] = { ":m '<-2<CR>gv=gv", "Move selection up"},
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
            end,
            "Select marks"
        },
        -- ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
    },
}

M.telescope = {
    n = {
        -- ["<leader><leader>"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
        ["<leader>b"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
    },
}
-- more keybinds!

return M
