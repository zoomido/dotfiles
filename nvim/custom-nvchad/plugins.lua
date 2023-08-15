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
        'JoosepAlviste/nvim-ts-context-commentstring',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
        },
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
                mappings = {
                    i = {
                        -- map actions.which_key to <C-h> (default: <C-/>)
                        -- actions.which_key shows the mappings for your picker,
                        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                        ["<C-l>"] = "select_default"
                    },
                },
            },
            pickers = {
                buffers = {
                    sort_lastused = true,
                    sort_mru = true,
                },
            },
            extensions = {
                zoxide = {
                    mappings = {
                        ["<C-g>"] = {
                            action = function(selection)
                                require("telescope").extensions.egrepify.egrepify({cwd = selection.path})
                            end
                        },
                        ["<C-b>"] = {
                            keepinsert = true,
                            action = function(selection)
                                require("telescope").extensions.file_browser.file_browser({path = selection.path})
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
        keys = {
            { "<leader>z", "<CMD>Telescope zoxide list<CR>", desc = "List latest folders" },
        },
        config = function()
            require("telescope").load_extension("zoxide")
        end
    },
    {
        "fdschmidt93/telescope-egrepify.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        event = "VeryLazy",
        config = function()
            require("telescope").load_extension("egrepify")
        end
    },
    {
        "brookhong/telescope-pathogen.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
        event = "VeryLazy",
        keys = {
            -- { "<leader>g", mode = { "v" }, require("telescope").extensions["pathogen"].grep_string(), desc = "Search for visual selection" },
        { "<leader>g", mode = { "v" }, function() require("telescope").extensions["pathogen"].grep_string() end, desc = "Search for visual selection" },
            -- { "<space>a", ":Telescope pathogen live_grep<CR>", silent = true },
            -- { "<C-p>", ":Telescope pathogen<CR>", silent = true },
            -- { "<C-f>", ":Telescope pathogen find_files<CR>", silent = true },
            -- { "<space>g", ":Telescope pathogen grep_string<CR>", silent = true },
        },
        config = function()
            require("telescope").load_extension("pathogen")
        end
    },

    -- Custom plugins Basics
    {
        "karb94/neoscroll.nvim",
        event = "VeryLazy",
        config = true,
    },
    -- {
    --     "roobert/neoscroll-motions.nvim",
    --     dependencies = "karb94/neoscroll.nvim",
    --     event = "VeryLazy",
    --     config = true,
    -- },

    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = true,
    },

    -- {
    --     "yamatsum/nvim-cursorline",
    --     event = "VeryLazy",
    --     config = function ()
    --         require('nvim-cursorline').setup {
    --             cursorline = {
    --                 enable = true,
    --                 timeout = 1000,
    --                 number = false,
    --             },
    --             cursorword = {
    --                 enable = true,
    --                 min_length = 3,
    --                 hl = { underline = true },
    --             }
    --         }
    --     end
    -- },
    -- {
    --     "delphinus/auto-cursorline.nvim",
    --     event = "VeryLazy",
    --     -- config = true,
    --     config = function()
    --         require("auto-cursorline").setup {}
    --     end,
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

    {
        "jedrzejboczar/possession.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        event = "VeryLazy",
        -- cmd = {"SSave", "SLoad", "SList", "SDelete"},
        config = function ()
            require("possession").setup {
                autosave = {
                    current = true,
                    tmp = true,
                },
                plugins = {
                    delete_hidden_buffers = false, -- Keep hidden buffers in session
                    delete_buffers = true, -- Delete all buffers before loading another session
                },
                commands = {
                    save = "SSave",
                    load = "SLoad",
                    list = "SList",
                    delete = "SDelete",
                },
            }
            require("telescope").load_extension("possession")
        end
    },

    -- Custom plugins Git
    {
        "samoshkin/vim-mergetool",
        cmd = "MergetoolStart",
    },

    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",         -- required
            "nvim-telescope/telescope.nvim", -- optional
            "sindrets/diffview.nvim",        -- optional
        },
        cmd = "Neogit",
        config = true
    },

    -- Custom plugins Navigation
    {
        "notjedi/nvim-rooter.lua",
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

    -- Custom plugins ChatGPT
    {
        "jackMort/ChatGPT.nvim",
        event = "VeryLazy",
        opts = { api_key_cmd = "cat ~/openai_secret_api.txt" },
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim"
        }
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
