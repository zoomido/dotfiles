return {
    
    {
        -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects', -- recommended with nvim-surround
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
            local configs = require('nvim-treesitter.configs')
            configs.setup({
                -- ensure_installed = { 'lua', 'vim', 'vimdoc', 'javascript', 'html', 'less' },
                -- Automatically install missing parsers when entering buffer
                -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
                auto_install = true,
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
    },

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
        },
        keys = {
            { 's', mode = { 'n', 'x', 'o' }, function() require('flash').jump({ search = { mode = 'exact', incremental = true } }) end, desc = 'Flash' },
            -- Search only start of word
            -- { 's', mode = { 'n', 'x', 'o' }, function() require('flash').jump({search = {
            --     mode = function(str)
            --         return '\\<' .. str
            --     end,
            -- },}) end, desc = 'Flash' },
            { 'S', mode = { 'n', 'o', 'x' }, function() require('flash').treesitter() end, desc = 'Flash Treesitter' },
            { 'r', mode = 'o', function() require('flash').remote() end, desc = 'Remote Flash' },
            { 'R', mode = { 'o', 'x' }, function() require('flash').treesitter_search() end, desc = 'Treesitter Search' },
            { '<C-s>', mode = { 'c' }, function() require('flash').toggle() end, desc = 'Toggle Flash Search' },
        },
    },

    
    {
        -- Session management
        'jedrzejboczar/possession.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        -- event = 'VeryLazy',
        cmd = { 'SSave', 'SLoad', 'SDelete' },
        config = function()
            require('possession').setup {
                autosave = {
                    current = true,
                    tmp = true,
                },
                plugins = {
                    delete_hidden_buffers = false, -- Keep hidden buffers in session
                    delete_buffers = true,         -- Delete all buffers before loading another session
                },
                commands = {
                    save = 'SSave',
                    load = 'SLoad',
                    delete = 'SDelete',
                },
            }
            require('telescope').load_extension('possession')
        end
    },

    {
        -- Splitting/joining blocks of code like arrays, hashes, statements, objects, dictionaries, etc with tree-sitter
        'Wansmer/treesj',
        keys = {
            { '<Leader>j', '<Cmd>TSJToggle<cr>', desc = 'Join Toggle' },
        },
        opts = { use_default_keymaps = false, max_join_length = 150 },
    },

    -- Detect tabstop and shiftwidth automatically
    -- {'Darazaki/indent-o-matic', event = 'VeryLazy', config = true}
    -- {'tpope/vim-sleuth', event = 'VeryLazy'},

}
