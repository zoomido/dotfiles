local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

    -- Override plugin definition options

    {
        "neovim/nvim-lspconfig",
        dependencies = {
            -- format & linting
            {
                "jose-elias-alvarez/null-ls.nvim",
                config = function()
                    require "custom.configs.null-ls"
                end,
            },
        },
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end, -- Override to setup mason-lspconfig
    },

    -- override plugin configs
    {
        "williamboman/mason.nvim",
        opts = overrides.mason
    },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = overrides.treesitter,
    },

    {
        "nvim-tree/nvim-tree.lua",
        opts = overrides.nvimtree,
    },

    {
        "max397574/better-escape.nvim",
        event = "InsertEnter",
        config = true,
        -- config = function()
        --     require("better_escape").setup()
        -- end,
    },

    -- Telescope settings & Plugins
    {
        "nvim-telescope/telescope.nvim",
        opts = {
            defaults = {
                -- layout_strategy = 'vertical',
                layout_config = { height = 0.99, width = 0.99 },
            },
            extensions = {
                zoxide = {
                    -- prompt_title = "[ Walking on the shoulders of TJ ]",
                    mappings = {
                        -- default = {
                        --     after_action = function(selection)
                        --         print("Update to (" .. selection.z_score .. ") " .. selection.path)
                        --     end
                        -- },
                        -- ["<C-s>"] = {
                        --     before_action = function(selection) print("before C-s") end,
                        --     action = function(selection)
                        --         vim.cmd.edit(selection.path)
                        --     end
                        -- },
                        -- ["<C-q>"] = { action = z_utils.create_basic_command("split") },
                        ["<C-b>"] = {
                            keepinsert = true,
                            action = function(selection)
                                -- builtin.file_browser({ cwd = selection.path })
                                require "telescope".extensions.file_browser.file_browser({path = selection.path})
                            end
                        },
                    },
                },
            },
        },
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        event = "VeryLazy",
        keys = {
            { "<leader>E", "<CMD>Telescope file_browser<CR>", desc = "Telescope file browser" },
        },
        config = function()
            require("telescope").load_extension("file_browser")
        end,
    },
    {
        "jvgrootveld/telescope-zoxide",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-telescope/telescope-file-browser.nvim" },
        event = "VeryLazy",
        config = function()
            require("telescope").load_extension("zoxide")
        end
    },

    -- Custom plugins Basics
    {
        "karb94/neoscroll.nvim",
        event = "VeryLazy",
        config = true,
        -- config = function()
        --     require("neoscroll").setup()
        -- end,
    },
    {
        "roobert/neoscroll-motions.nvim",
        dependencies = "karb94/neoscroll.nvim",
        event = "VeryLazy",
        config = true,
        -- config = function()
        --     require("neoscroll-motions").setup()
        -- end,
    },

    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = true,
        -- config = function()
        --     require("nvim-surround").setup({
        --         -- Configuration here, or leave empty to use defaults
        --     })
        -- end
    },

    -- {
    --     "svermeulen/vim-cutlass",
    -- },

    {
        "gbprod/yanky.nvim",
        event = "VeryLazy",
        keys = {
            { "p", mode = { "n", "x" }, "<Plug>(YankyPutAfter)", desc = "YankyPutAfter" },
            { "P", mode = { "n", "x" }, "<Plug>(YankyPutBefore)", desc = "YankyPutBefore" },
            { "<C-p>", mode = { "n", "x" }, ":Telescope yank_history<CR>", desc = "YankyPutAfter" },
        },
        config = function()
            local utils = require("yanky.utils")
            local mapping = require("yanky.telescope.mapping")
            require("yanky").setup({
                picker = {
                    telescope = {
                        use_default_mappings = false,
                        mappings = {
                            default = mapping.put("p"),
                            i = {
                                ["<c-l>"] = mapping.put("p"),
                                ["<c-k>"] = mapping.put("P"),
                                ["<c-x>"] = mapping.delete(),
                                ["<c-r>"] = mapping.set_register(utils.get_default_register()),
                            },
                            n = {
                                p = mapping.put("p"),
                                P = mapping.put("P"),
                                d = mapping.delete(),
                                r = mapping.set_register(utils.get_default_register())
                            },
                        }
                    }
                }
            })
            require("telescope").load_extension("yank_history")
        end,
    },

    -- Custom plugins Git
    {
        "samoshkin/vim-mergetool",
        cmd = "MergetoolStart",
    },

    -- Custom plugins Navigation
    -- {
    --     "nanotee/zoxide.vim",
    --     cmd = "Z",
    -- },

    {
        'notjedi/nvim-rooter.lua',
        config = function()
            require("nvim-rooter").setup({
                manual = true,
            })
        end,
    },

    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump({search = {
                mode = "fuzzy"
            },}) end, desc = "Flash" },
            -- Search only start of word
            -- { "s", mode = { "n", "x", "o" }, function() require("flash").jump({search = {
            --     mode = function(str)
            --         return "\\<" .. str
            --     end,
            -- },}) end, desc = "Flash" },
            { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
    },

    -- To make a plugin not be loaded
    -- {
    --   "NvChad/nvim-colorizer.lua",
    --   enabled = false
    -- },

    -- All NvChad plugins are lazy-loaded by default
    -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
    -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
    -- {
    --   "mg979/vim-visual-multi",
    --   lazy = false,
    -- }
}

return plugins
