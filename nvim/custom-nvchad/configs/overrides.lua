local M = {}

M.treesitter = {
    ensure_installed = {
        "vim",
        "lua",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "markdown",
        "markdown_inline",
        "php",
    },
    indent = {
        enable = true,
        -- disable = {
        --   "python"
        -- },
    },
}

M.mason = {
    ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",

        -- web dev stuff
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        "deno",
        "prettier",
        "intelephense",
        "phpmd",
    },
}

-- git support in nvimtree
M.nvimtree = {
    git = {
        enable = true,
    },

    view = {
        float = {
            enable = true,
            open_win_config = {
                relative = "editor",
                width = 140,
                height = 25,
                row = 1,
                col = 1,
            },
        },
    },

    renderer = {
        highlight_git = true,
        icons = {
            show = {
                git = true,
            },
        },
    },
}

return M
