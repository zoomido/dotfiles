local M = {}

M.treesitter = {
    ensure_installed = {
        "vim",
        "lua",
        "html",
        "css",
        "javascript",
        "json",
        "typescript",
        "tsx",
        "vue",
        "php",
        "phpdoc",
        "markdown",
        "markdown_inline",
        "fish",
        "regex",
        "xml",
        "yaml",
        "dockerfile",
        "git_config",
    },
    indent = {
        enable = true,
        -- disable = {
        --   "python"
        -- },
    },
    context_commentstring = {
        enable = true,
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
        "lemminx",
        "xmlformatter",
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
