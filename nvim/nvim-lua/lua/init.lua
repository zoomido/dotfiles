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

    {
        -- LSP from Zero to Hero
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        lazy = true,
        init = function()
            -- Disable automatic setup, we are doing it manually
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end,
        dependencies = {
            {'folke/neodev.nvim', opts = {}}
        }
    },
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = true,
    },

    {
        -- Autocompletion
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            {'L3MON4D3/LuaSnip'},
        },
        config = function()
            -- Here is where you configure the autocompletion settings.
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_cmp()

            -- And you can configure cmp even more, if you want to.
            local cmp = require('cmp')
            local cmp_action = lsp_zero.cmp_action()

            cmp.setup({
                formatting = lsp_zero.cmp_format(),
                mapping = cmp.mapping.preset.insert({
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
                })
            })
        end
    },

    {
        -- LSP setup
        'neovim/nvim-lspconfig',
        cmd = {'LspInfo', 'LspInstall', 'LspStart'},
        event = {'BufReadPre', 'BufNewFile'},
        dependencies = {
            {'hrsh7th/cmp-nvim-lsp'},
            {'williamboman/mason-lspconfig.nvim'},
        },
        config = function()
            -- This is where all the LSP shenanigans will live
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()

            lsp_zero.on_attach(function(client, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                lsp_zero.default_keymaps({buffer = bufnr})
            end)

            require('mason-lspconfig').setup({
                ensure_installed = {},
                handlers = {
                    lsp_zero.default_setup,
                    lua_ls = function()
                        -- (Optional) Configure lua language server for neovim
                        local lua_opts = lsp_zero.nvim_lua_ls()
                        require('lspconfig').lua_ls.setup(lua_opts)
                    end,
                }
            })
        end
    },

    {
        -- lualine as statusline
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
            -- setting the commentstring option based on cursor location, via treesitter queries.
            'JoosepAlviste/nvim-ts-context-commentstring',
        },
        build = ':TSUpdate',
        opts = {
            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = true,
            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,

            context_commentstring = {
                enable = true,
            },
        },
    },

    {
        -- Fuzzy Finder (files, lsp, etc)
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
        -- event = 'VeryLazy', -- No lazy loading when starting with nvim -c "Telescope <cmd>"
        config = function()
            require('telescope').setup {
                defaults = {
                    -- layout_strategy = 'vertical',
                    sorting_strategy = "ascending", -- display results top->bottom
                    layout_config = {
                        -- height = 0.99,
                        -- width = 0.99,
                        width = { padding = 0 }, --set fullwidth
                        height = { padding = 0 },
                        horizontal = {
                            prompt_position = 'top',
                        },
                        vertical = {
                            prompt_position = 'top',
                            mirror = true,
                            preview_cutoff = 10,
                            preview_height = 0.4,
                        },
                    },
                    mappings = {
                        i = {
                            -- map actions.which_key to <C-h> (default: <C-/>)
                            -- actions.which_key shows the mappings for your picker,
                            -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                            ['<C-l>'] = 'select_default',
                            ['<C-->'] = 'which_key',
                            ['<C-a>'] = require('telescope.actions.layout').toggle_preview,
                            ['<C-s>'] = require('telescope.actions.layout').cycle_layout_next,
                            ['<C-j>'] = 'move_selection_next',
                            ['<C-k>'] = 'move_selection_previous',
                            ['<Esc>'] = 'close',
                        },
                    },
                },
                pickers = {
                    buffers = {
                        layout_strategy = 'vertical',
                        -- layout_config = { prompt_position = 'top', mirror = true, preview_height = 0.4 },
                        sort_lastused = true,
                        sort_mru = true,
                    },
                },
                extensions = {
                    file_browser = {
                        -- theme = 'ivy',
                        -- disables netrw and use telescope-file-browser in its place
                        hijack_netrw = true,
                        initial_mode = 'normal',
                        grouped = true,
                        depth = 2,
                        respect_gitignore = false,
                        hidden = { file_browser = true, folder_browser = true },
                        prompt_path = true,
                        mappings = {
                            ['i'] = {
                                -- your custom insert mode mappings
                            },
                            ['n'] = {
                                ['h'] = require('telescope._extensions.file_browser.actions').goto_parent_dir,
                                ['l'] = 'select_default',
                                -- ['l'] = require('telescope._extensions.file_browser.actions').open,
                            },
                        },
                    },
                },
            }

            -- See `:help telescope.builtin`
            vim.keymap.set('n', '<Leader>b', '<Cmd>Telescope buffers<Cr>', { silent = true, desc = 'List open [B]uffers' })
            vim.keymap.set('n', '<Leader>fb', '<Cmd>Telescope current_buffer_fuzzy_find<Cr>', { silent = true, desc = '[F]ind in current [b]uffer' })
            vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[F]ind [f]iles' })
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
            -- vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
            -- vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
            -- vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
            -- vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
            -- vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]resume' })

            require('telescope').load_extension('file_browser')
        end,
    },
    {
        'nvim-telescope/telescope-file-browser.nvim',
        lazy = true,
        dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
        keys = {
            { '<leader>e', '<CMD>Telescope file_browser<CR>', desc = 'Telescope file browser from root' },
            { '<leader>E', '<CMD>Telescope file_browser path=%:p:h select_buffer=true<CR>', desc = 'Telescope file browser from current file' },
        },
    },

    -- Illegal git plugin
    {'tpope/vim-fugitive', cmd = 'G'},
    -- Support bitbucket url for Gbrowse
    {'tommcdo/vim-fubitive', cmd = 'GBrowse'},
    -- Detect tabstop and shiftwidth automatically
    {'tpope/vim-sleuth', event = 'VeryLazy'},
    -- Add indent text object to vim. <count>ai ii aI iI
    {'michaeljsmith/vim-indent-object', event = 'VeryLazy'},
    -- Vim "inner line" text object. Ignore leading and trailing whitespace. v_ y_ d_
    {'bruno-/vim-line', event = 'VeryLazy'},
    -- "gc" to comment visual regions/lines
    {'numToStr/Comment.nvim', event = 'VeryLazy', opts = {}},
    -- Useful plugin to show you pending keybinds.
    {'folke/which-key.nvim', event = 'VeryLazy', opts = {}},

    {
        -- See :help nvim-surround.usage
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = true,
    },

    {
        -- Splitting/joining blocks of code like arrays, hashes, statements, objects, dictionaries, etc with tree-sitter
        'Wansmer/treesj',
        keys = {
            { 'J', '<cmd>TSJToggle<cr>', desc = 'Join Toggle' },
        },
        opts = { use_default_keymaps = false, max_join_length = 150 },
    },

    {
        -- Add indentation guides even on blank lines
        -- See `:help indent_blankline.txt`
        'lukas-reineke/indent-blankline.nvim',
        event = 'VeryLazy',
        main = 'ibl',
        opts = {
            indent = {
                char = '┊',
                tab_char = { 'a', 'b', 'c' },
                smart_indent_cap = false,
            },
            whitespace = {
                remove_blankline_trail = false,
            },
        },
    },

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
        -- Adds git related signs to the gutter, as well as utilities for managing changes
        -- See `:help gitsigns.txt`
        'lewis6991/gitsigns.nvim',
        event = 'VeryLazy',
        opts = {
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
            on_attach = function(bufnr)
                vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk, { buffer = bufnr, desc = 'Preview git hunk' })
                vim.keymap.set('n', '<leader>hbf', function() require('gitsigns').blame_line{full=true} end, { desc = 'Git blame full' })
                vim.keymap.set('n', '<leader>hbl', require('gitsigns').blame_line, { desc = 'Git blame line' })

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
        -- Session management
        "jedrzejboczar/possession.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        event = "VeryLazy",
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
                    delete = "SDelete",
                },
            }
            require("telescope").load_extension("possession")
        end
    },

    {
        -- navigate with search labels, enhanced character motions, and Treesitter integration
        "folke/flash.nvim",
        -- event = "VeryLazy",
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
    --     "catppuccin/nvim",
    --     name = "catppuccin",
    --     priority = 1000,
    --     config = function()
    --         -- vim.cmd.colorscheme 'onedark'
    --         vim.cmd[[colorscheme catppuccin]]
    --     end,
    -- },

})


--
-- LSP Zero setup
--
-- local lsp_zero = require('lsp-zero')
-- lsp_zero.on_attach(function(client, bufnr)
--     -- see :help lsp-zero-keybindings
--     -- to learn the available actions
--     lsp_zero.default_keymaps({buffer = bufnr})
-- end)

-- Setup default options for lua_ls. Used for fixing issue with neovim config
-- require('lspconfig').lua_ls.setup(lsp_zero.nvim_lua_ls())

-- Setup Mason with lspconfig integration
-- require('mason').setup({})
-- require('mason-lspconfig').setup({
--     handlers = {
--         lsp_zero.default_setup,
--     },
-- })

-- old copy
-- local lsp = require('lsp-zero').preset({})
-- lsp.on_attach(function(client, bufnr)
--    -- see :help lsp-zero-keybindings
--    -- to learn the available actions
--    lsp.default_keymaps({buffer = bufnr})
-- end)
-- (Optional) Configure lua language server for neovim
-- require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
-- lsp.setup()
-- end old copy




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

-- Restore cursor position
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
    pattern = { "*" },
    callback = function()
        vim.api.nvim_exec('silent! normal! g`"zv', false)
    end,
})

require('options')
require('remaps')
