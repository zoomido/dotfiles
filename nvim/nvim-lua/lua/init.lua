-- init.lua

-- Set <space> as the leader key. See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--
-- Lazy.nvim plugin manager
--
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
local uv = vim.uv or vim.loop
-- Auto-install lazy.nvim if not present
if not uv.fs_stat(lazypath) then
    print('Installing lazy.nvim....')
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


--
-- Plugins
--
require('lazy').setup({

    -- Git related
    {'tpope/vim-fugitive', cmd = 'G'},
    -- Detect tabstop and shiftwidth automatically
    {'tpope/vim-sleuth', event = 'VeryLazy'},
    -- Add indent text object to vim. <count>ai ii aI iI
    {'michaeljsmith/vim-indent-object', event = 'VeryLazy'},

    -- Vim "inner line" text object. Ignore leading and trailing whitespace. v_ y_ d_
    {'bruno-/vim-line', event = 'VeryLazy'},

    -- Useful plugin to show you pending keybinds.
    { 'folke/which-key.nvim', event = 'VeryLazy', opts = {} },
    -- "gc" to comment visual regions/lines
    { 'numToStr/Comment.nvim', event = 'VeryLazy', opts = {} },

    {
        -- Smooth scrolling
        'declancm/cinnamon.nvim',
	event = 'VeryLazy',
        opts = {
            extra_keymaps = true,
            max_length = 500,
        },
    },

    {
        -- Add indentation guides even on blank lines
        -- Enable `lukas-reineke/indent-blankline.nvim`
        -- See `:help indent_blankline.txt`
        'lukas-reineke/indent-blankline.nvim',
        event = 'VeryLazy',
        opts = {
            char = '┊',
            show_trailing_blankline_indent = false,
        },
    },

    {
        -- LSP from zero to hero
        'VonHeikemen/lsp-zero.nvim',
        -- branch = 'v2.x',
	event = 'VeryLazy',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required

            -- Additional lua configuration, makes nvim stuff amazing!
            'folke/neodev.nvim',
        },
    },

    {
        -- Adds git related signs to the gutter, as well as utilities for managing changes
        'lewis6991/gitsigns.nvim',
	event = 'VeryLazy',
        opts = {
            -- See `:help gitsigns.txt`
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
            on_attach = function(bufnr)
                vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk, { buffer = bufnr, desc = 'Preview git hunk' })

                -- don't override the built-in and fugitive keymaps
                local gs = package.loaded.gitsigns
                vim.keymap.set({'n', 'v'}, ']c', function()
                    if vim.wo.diff then return ']c' end
                    vim.schedule(function() gs.next_hunk() end)
                    return '<Ignore>'
                end, {expr=true, buffer = bufnr, desc = "Jump to next hunk"})
                vim.keymap.set({'n', 'v'}, '[c', function()
                    if vim.wo.diff then return '[c' end
                    vim.schedule(function() gs.prev_hunk() end)
                    return '<Ignore>'
                end, {expr=true, buffer = bufnr, desc = "Jump to previous hunk"})
            end,
        },
    },

    {
        -- Set lualine as statusline
        -- See `:help lualine.txt`
        'nvim-lualine/lualine.nvim',
	event = 'VeryLazy',
        opts = {
            options = {
                icons_enabled = false,
                -- theme = 'tokyonight',
                theme = 'auto',
                component_separators = { left = '', right = ''},
                section_separators = { left = '', right = ''},
                -- component_separators = '|',
                -- section_separators = '',
            },
        },
    },

    {
        -- tabline plugin
        'romgrk/barbar.nvim',
	event = 'VeryLazy',
        dependencies = {
            'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
            'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {},
        config = function()
            require('barbar').setup {
                on_attach = function(bufnr)
                    -- add your plugin keybindings in plugin setup (1)
                    -- preferably here, if your keybindings need to be buffer-specific
                end
            }
            -- OR add them here after setup (2)
            local opts = { noremap = true, silent = true }
            -- Move to previous/next
            -- vim.keymap.set('n', '<tab>', '<Cmd>BufferNext<Cr>', opts)
            vim.keymap.set('n', '<C-p>', '<Cmd>BufferPrevious<Cr>', opts)
            vim.keymap.set('n', '<C-n>', '<Cmd>BufferNext<Cr>', opts)
            -- Re-order to previous/next
            vim.keymap.set('n', '<Leader>>', '<Cmd>BufferMovePrevious<Cr>', opts)
            vim.keymap.set('n', '<Leader><', '<Cmd>BufferMoveNext<Cr>', opts)
            -- Close buffer
            vim.keymap.set('n', '<C-x>', '<Cmd>BufferClose<Cr>', opts)
            -- Magic buffer-picking mode
            vim.keymap.set('n', '<C-b>', '<Cmd>BufferPick<Cr>', opts)
        end,
    },

    {
        -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
            'nvim-treesitter/nvim-treesitter-context',
        },
        build = ':TSUpdate',
        opts = {
            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = true,
            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,
        },
    },

    -- Fuzzy Finder (files, lsp, etc)
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            -- Fuzzy Finder Algorithm which requires local dependencies to be built.
            -- Only load if `make` is available. Make sure you have the system
            -- requirements installed.
            -- {
            --   'nvim-telescope/telescope-fzf-native.nvim',
            --   -- NOTE: If you are having trouble with this installation,
            --   --       refer to the README for telescope-fzf-native for more instructions.
            --   build = 'make',
            --   cond = function()
            --     return vim.fn.executable 'make' == 1
            --   end,
            -- },
        },
        event = 'VeryLazy',
        config = function()
            require('telescope').setup {
            }
            -- See `:help telescope.builtin`
            vim.keymap.set('n', '<Leader>b', "<Cmd>Telescope buffers<Cr>", { silent = true, desc = 'List open [B]uffers' })
            vim.keymap.set('n', '<Leader>fb', "<Cmd>Telescope current_buffer_fuzzy_find<Cr>", { silent = true, desc = 'Find in current buffer' })
            -- vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
            -- vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
            -- vim.keymap.set('n', '<leader>/', function()
            --  -- You can pass additional configuration to telescope to change theme, layout, etc.
            --  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
            --   winblend = 10,
            --   previewer = false,
            --  })
            -- end, { desc = '[/] Fuzzily search in current buffer' })

            -- vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
            -- vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
            -- vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
            -- vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
            -- vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
            -- vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
            -- vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]resume' })
        end,
    },

    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            -- vim.cmd.colorscheme 'onedark'
            vim.cmd[[colorscheme tokyonight]]
        end,
    },
    -- {
    --   'rose-pine/neovim',
    --   name = 'rose-pine',
    --   lazy = false,
    --   priority = 1000,
    --   config = function()
    --     vim.cmd[[colorscheme rose-pine]]
    --   end,
    -- },

})


--
-- LSP Zero setup
--
local lsp = require('lsp-zero').preset({})
lsp.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp.default_keymaps({buffer = bufnr})
end)
-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
lsp.setup()




-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
-- require('telescope').setup {
--   defaults = {
--     mappings = {
--       i = {
--         ['<C-u>'] = false,
--         ['<C-d>'] = false,
--       },
--     },
--   },
-- }
-- Enable telescope fzf native, if installed
-- pcall(require('telescope').load_extension, 'fzf')


-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

require('options')
require('remaps')
