return {
    
    {
        -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        -- branch = 'main',
        dependencies = {
            { 
                -- Currently rewriting master->main branches
                -- wait for a fix to treesitter configs not found
                -- recommended with nvim-surround
                -- 'nvim-treesitter/nvim-treesitter-textobjects',
                -- branch = 'main',
            },
            {
                'nvim-treesitter/nvim-treesitter-context',
                opts = {
                    max_lines = 5,
                    min_window_height = 20,
                    multiline_threshold = 3,
                    -- separator = '—',
                },
            },
            -- setting the commentstring option based on cursor location, via treesitter queries.
            { 'JoosepAlviste/nvim-ts-context-commentstring', opts = { enable_autocmd = false } },
        },
        build = ':TSUpdate',
        config = true,
    },
    --[[{
        -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
	branch = 'main',
        dependencies = {
		{ 
			-- Currently rewriting master->main branches
			-- recommended with nvim-surround
			'nvim-treesitter/nvim-treesitter-textobjects',
			branch = 'main',
		},
            {
                'nvim-treesitter/nvim-treesitter-context',
                opts = {
                    max_lines = 5,
                    min_window_height = 20,
                    multiline_threshold = 3,
                    -- separator = '—',
                },
            },
            -- setting the commentstring option based on cursor location, via treesitter queries.
            { 'JoosepAlviste/nvim-ts-context-commentstring', opts = { enable_autocmd = false } },
        },
        build = ':TSUpdate',
        config = function()
            local configs = require('nvim-treesitter.config')
            configs.setup({
                -- ensure_installed = { 'lua', 'vim', 'vimdoc', 'javascript', 'html', 'less' },
                -- Automatically install missing parsers when entering buffer
                -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
                -- auto_install = true,
                highlight = { enable = true },
                -- indent = { enable = true }, -- Breaks indentation
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = 'gnn', -- set to `false` to disable one of the mappings
                        node_incremental = '<C-g>',
                        scope_incremental = 'grc',
                        node_decremental = '<C-f>',
                    },
                },
            })
        end,
    },]]

    {
        'stevearc/resession.nvim',
        opts = {
            autosave = {
                enabled = true,
                interval = 120,
                notify = true,
            },
        },
        cmd = { "SSave", "SLoad", "SDelete" },
        config = function(_, opts)
            local resession = require("resession")
            -- apply opts
            resession.setup(opts)

            vim.api.nvim_create_user_command("SSave", function(opts)
                local name = opts.args ~= "" and opts.args or "last"
                resession.save(name)
            end, {
                nargs = "?",
                complete = function()
                    return resession.list()
                end,
                desc = "Save a session",
            })

            vim.api.nvim_create_user_command("SLoad", function(opts)
                local name = opts.args ~= "" and opts.args or nil  -- nil opens picker
                resession.load(name)
            end, {
                nargs = "?",
                complete = function(ArgLead)
                    local sessions = resession.list()
                    local matches = {}
                    for _, s in ipairs(sessions) do
                        if s:match("^" .. ArgLead) then
                            table.insert(matches, s)
                        end
                    end
                    return matches
                end,
                desc = "Load a session",
            })

            vim.api.nvim_create_user_command("SDelete", function(opts)
                local name = opts.args
                if name == "" or not name then
                    print("You must provide a session name")
                    return
                end
                resession.delete(name)
            end, {
                nargs = 1,
                complete = function(ArgLead)
                    local sessions = resession.list()
                    local matches = {}
                    for _, s in ipairs(sessions) do
                        if s:match("^" .. ArgLead) then
                            table.insert(matches, s)
                        end
                    end
                    return matches
                end,
                desc = "Delete a session",
            })

            vim.api.nvim_create_autocmd("VimLeavePre", {
                callback = function()
                    -- Always save a special session named "last"
                    resession.save("last")
                end,
            })
        end,
    },
 
    -- {
    --     -- Session management
    --     'jedrzejboczar/possession.nvim',
    --     dependencies = { 'nvim-lua/plenary.nvim' },
    --     -- event = 'VeryLazy',
    --     cmd = { 'PosSave', 'PosLoad', 'PosDelete', 'PosPick' },
    --     config = function()
    --         require('possession').setup {
    --             autosave = {
    --                 current = true,
    --                 tmp = true,
    --             },
    --             plugins = {
    --                 -- delete_hidden_buffers = false, -- Keep hidden buffers in session
    --                 delete_buffers = true,         -- Delete all buffers before loading another session
    --             },
    --             commands = {
    --                 save = 'PosSave',
    --                 load = 'PosLoad',
    --                 delete = 'PosDelete',
    --                 pick = 'PosPick',
    --             },
    --         }
    --         -- require('telescope').load_extension('possession')
    --     end
    -- },

    {
        -- Navigate with search labels, enhanced character motions, and Treesitter integration
        'folke/flash.nvim',
        -- event = 'VeryLazy',
        opts = {
            label = {
                -- show the label after/before the match
                after = false,
                before = true,
                -- position of the label extmark
                -- style = "overlay", ---@type "eol" | "overlay" | "right_align" | "inline"
                -- minimum pattern length to show labels
                -- Ignored for custom labelers.
                -- min_pattern_length = 2,
                -- Enable this to use rainbow colors to highlight labels
                -- Can be useful for visualizing Treesitter ranges.
                rainbow = {
                    enabled = true,
                    -- number between 1 and 9
                    -- shade = 5,
                },
            },
            -- options used when flash is activated through
            -- `f`, `F`, `t`, `T`, `;` and `,` motions
            modes = {
                char = {
                    enabled = false,
                },
            },
        },
        keys = {
            { 's/', mode = { 'n', 'x', 'o' }, function() require('flash').jump({ search = { mode = 'exact', incremental = true } }) end, desc = 'Flash' },
            -- Search only start of word
            -- { 's', mode = { 'n', 'x', 'o' }, function() require('flash').jump({search = {
            --     mode = function(str)
            --         return '\\<' .. str
            --     end,
            -- },}) end, desc = 'Flash' },
            { 'S/', mode = { 'n', 'o', 'x' }, function() require('flash').treesitter() end, desc = 'Flash Treesitter' },
            -- { 'r', mode = 'o', function() require('flash').remote() end, desc = 'Remote Flash' },
            -- { 'R', mode = { 'o', 'x' }, function() require('flash').treesitter_search() end, desc = 'Treesitter Search' },
            -- { '<C-s>', mode = { 'c' }, function() require('flash').toggle() end, desc = 'Toggle Flash Search' },
        },
    },
    
    {
        'nvim-mini/mini.surround',
        version = '*',
        opts = {
            mappings = {
                add = 'sa', -- Add surrounding in Normal and Visual modes
                delete = 'sd', -- Delete surrounding
                find = 'sf', -- sf Find surrounding (to the right)
                find_left = 'sF', -- sF Find surrounding (to the left)
                highlight = 'sh', -- sh Highlight surrounding
                replace = 'sr', -- Replace surrounding

                suffix_last = 'l', -- Suffix to search with "prev" method
                suffix_next = 'n', -- Suffix to search with "next" method
            },
        },
    },
    {
        -- gS (split/join with treesitter)
        'nvim-mini/mini.splitjoin',
        version = '*',
        config = true,
    },

    -- Detect tabstop and shiftwidth automatically
    -- {'Darazaki/indent-o-matic', event = 'VeryLazy', config = true}
    -- {'tpope/vim-sleuth', event = 'VeryLazy'},

}
