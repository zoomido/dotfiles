return {
    
    --
    -- Aesthetics
    -- "a set of principles concerned with the nature and appreciation of beauty."
    --

    -- {
    --     -- Statusline plugin
    --     -- See `:help lualine.txt`
    --     'nvim-lualine/lualine.nvim',
    --     event = 'VeryLazy',
    --     opts = {
    --         options = {
    --             icons_enabled = false,
    --             -- theme = 'tokyonight',
    --             theme = 'auto',
    --             component_separators = { left = '', right = '' },
    --             section_separators = { left = '', right = '' },
    --             -- component_separators = '|',
    --             -- section_separators = '',
    --         },
    --     },
    -- },

    -- {
    --     -- Tabline plugin
    --     'romgrk/barbar.nvim',
    --     event = 'VeryLazy',
    --     dependencies = {
    --         'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
    --         'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    --     },
    --     init = function() vim.g.barbar_auto_setup = false end,
    --     config = function()
    --         require('barbar').setup {
    --             icons = {
    --                 -- Enables / disables diagnostic symbols
    --                 diagnostics = {
    --                     [vim.diagnostic.severity.ERROR] = {enabled = true},
    --                     [vim.diagnostic.severity.WARN] = {enabled = true},
    --                     [vim.diagnostic.severity.INFO] = {enabled = true},
    --                     [vim.diagnostic.severity.HINT] = {enabled = true},
    --                 },
    --                 gitsigns = {
    --                     added = {enabled = true, icon = '+'},
    --                     changed = {enabled = true, icon = '~'},
    --                     deleted = {enabled = true, icon = '-'},
    --                 },
    --             },
    --         }
    --         local opts = { noremap = true, silent = true }
    --         -- Move to previous/next
    --         -- vim.keymap.set('n', '<tab>', '<Cmd>BufferNext<Cr>', opts)
    --         vim.keymap.set('n', '<C-p>', '<Cmd>BufferPrevious<Cr>', opts)
    --         vim.keymap.set('n', '<C-n>', '<Cmd>BufferNext<Cr>', opts)
    --         -- Re-order to previous/next
    --         vim.keymap.set('n', '<Leader>>', '<Cmd>BufferMovePrevious<Cr>', opts)
    --         vim.keymap.set('n', '<Leader><', '<Cmd>BufferMoveNext<Cr>', opts)
    --         -- Close buffer
    --         vim.keymap.set('n', '<C-x>', '<Cmd>BufferClose<Cr>', opts)
    --         -- Magic buffer-picking mode
    --         vim.keymap.set('n', '<C-b>', '<Cmd>BufferPick<Cr>', opts)
    --     end,
    -- },

    {
        -- Minimal and fast tabline showing listed buffers
        'nvim-mini/mini.tabline',
        version = '*',
        config = true,
    },

    {
        -- Useful plugin to show you pending keybinds.
        'folke/which-key.nvim',
        event = 'VeryLazy',
        opts = {},
    },

    -- {
    --     -- Add indentation guides even on blank lines
    --     -- See `:help indent_blankline.txt`
    --     -- Use listchars in config.lua for uglier but plugin-less solution
    --     'lukas-reineke/indent-blankline.nvim',
    --     event = 'VeryLazy',
    --     main = 'ibl',
    --     opts = {
    --         indent = {
    --             char = '┊',
    --             -- tab_char = { 'a', 'b', 'c' },
    --             tab_char = { '>', '>', '>' },
    --             smart_indent_cap = false,
    --         },
    --         whitespace = {
    --             remove_blankline_trail = false,
    --         },
    --     },
    -- },

    -- {
    --     -- Highlight delimiters in different colors
    --     'https://gitlab.com/HiPhish/rainbow-delimiters.nvim',
    --     event = 'VeryLazy',
    --     main = 'rainbow-delimiters.setup',
    --     opts = {
    --         highlight = {
    --             'RainbowDelimiterYellow',
    --             'RainbowDelimiterCyan',
    --             'RainbowDelimiterGreen',
    --             'RainbowDelimiterBlue',
    --             'RainbowDelimiterViolet',
    --         },
    --     },
    -- },

    -- {
    --     -- Smooth scrolling
    --     'declancm/cinnamon.nvim',
    --     event = 'VeryLazy',
    --     opts = {
    --         keymaps = {
    --             -- Enable the provided 'basic' keymaps
    --             basic = true,
    --             -- Enable the provided 'extra' keymaps (j & k moving over wrapped lines broken when using this)
    --             -- extra = true,
    --         },
    --         options = {
    --             delay = 10,
    --             mode = 'window',
    --             max_delta = {
    --                 -- Maximum distance for line movements before scroll
    --                 -- animation is skipped. Set to `false` to disable
    --                 line = 200,
    --                 -- Maximum distance for column movements before scroll
    --                 -- animation is skipped. Set to `false` to disable
    --                 -- column = 1,
    --                 -- Maximum duration for a movement (in ms). Automatically scales the delay and step size
    --                 -- time = 1000,
    --             },
    --         }
    --     },
    -- },

    -- {
    --     -- Highlight active parts of the code
    --     "folke/twilight.nvim",
    --     cmd = 'Twilight',
    --     opts = {
    --         treesitter = true,
    --     },
    -- },

    -- {
    --     -- Follows system theme (MacOS, Linux Windows))
    --     -- Currently only enabled on macos == darwin
    --     'f-person/auto-dark-mode.nvim',
    --     enabled = vim.loop.os_uname().sysname == "Darwin",
    --     opts = {
    --         update_interval = 10000,
    --     },
    -- },


    {
        'folke/tokyonight.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('tokyonight').setup({
                -- transparent = true, -- Enable this to disable setting the background color
                day_brightness = 0.4, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
            })
            -- vim.cmd[[colorscheme tokyonight]]
            vim.cmd('colorscheme tokyonight')
        end,
    },

}
