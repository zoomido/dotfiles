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
            { 'JoosepAlviste/nvim-ts-context-commentstring', config = true },
        },
        build = ':TSUpdate',
        config = function ()
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
                -- Remove this when tree-sitter >1.0
                -- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
                context_commentstring = {
                    enable = true,
                },
            })
        end,
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
            require('barbar').setup {}
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
        -- Fuzzy Finder (files, lsp, etc)
        'nvim-telescope/telescope.nvim',
        -- event = 'VeryLazy', -- Use nvim +"lua require('telescope.builtin').find_files()"
        cmd = 'Telescope',
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
                            -- ['<Esc>'] = 'close',
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
                    git_branches = {
                        use_file_path = true,
                    },
                    git_status = {
                        use_file_path = true,
                    },
                },
                extensions = {
                    file_browser = {
                        -- theme = 'ivy',
                        -- disables netrw and use telescope-file-browser in its place
                        hijack_netrw = true,
                        -- initial_mode = 'normal',
                        grouped = true,
                        depth = 2,
                        respect_gitignore = false,
                        hidden = { file_browser = true, folder_browser = true },
                        prompt_path = true,
                        mappings = {
                            ['i'] = {
                                -- your custom insert mode mappings
                                ['<C-h>'] = require('telescope._extensions.file_browser.actions').goto_parent_dir,
                                ['<Esc>'] = { '<Esc>', type = 'command' },
                            },
                            ['n'] = {
                                ['h'] = require('telescope._extensions.file_browser.actions').goto_parent_dir,
                                ['l'] = 'select_default',
                            },
                        },
                    },
                    live_grep_args = {
                        -- auto_quoting = true, -- enable/disable auto-quoting
                        mappings = {
                            i = {
                                ['<C-t>'] = require('telescope-live-grep-args.actions').quote_prompt({ postfix = ' -t' }),
                            },
                        },
                    },
                },
            }

            -- vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
            -- vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
            -- vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
            -- vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
            -- vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]resume' })
            -- vim.keymap.set('n', '<leader>/', function()
            --  -- You can pass additional configuration to telescope to change theme, layout, etc.
            --  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
            --   winblend = 10,
            --   previewer = false,
            --  })
            -- end, { desc = '[/] Fuzzily search in current buffer' })

            require('telescope').load_extension('undo')
            require('telescope').load_extension('live_grep_args')
            require('telescope').load_extension('file_browser')
            require('telescope').load_extension('zf-native')
            -- require('telescope').load_extension('fzf')
        end,
        keys = {
            { '<Leader>b', '<Cmd>Telescope buffers<Cr>', desc = 'List open [B]uffers'},
            { '<Leader>fb', function() require('telescope.builtin').current_buffer_fuzzy_find() end, desc = 'Fuzzy [f]ind in current [b]uffer' },
            { '<Leader>fB', function() require('telescope.builtin').live_grep({grep_open_files=true}) end, desc = '[F]ind in all open [B]uffers' },
            { '<leader>ff', function() require('telescope.builtin').find_files() end, desc = '[F]ind [f]iles' },
            { '<leader>fG', function() require('telescope.builtin').live_grep() end, desc = '[F]ind with builtin [G]rep' },
            { '<leader>fg', function() require('telescope').extensions.live_grep_args.live_grep_args() end, desc = '[F]ind with live [g]rep args' },
            -- { '<leader>fz', function() require('telescope.builtin').grep_string() end, mode = 'x', desc = '[F]ind with live [g]rep args' },
            -- { '<leader>fz', function() require('telescope.builtin').grep_string({ shorten_path = true, word_match = "-w", only_sort_text = true, search = '' }) end, desc = '[F]ind with live [g]rep args' }, -- WAY TOO SLOW, must wait for all results before searching
            { '<leader>fg', function() require("telescope-live-grep-args.shortcuts").grep_visual_selection() end, mode = 'x', desc = '[F]ind word under cursor with live [g]rep args' },
            { '<leader>gb', function() require('telescope.builtin').git_branches() end, desc = '[g]it [b]ranches' },
            { '<leader>u', function() require('telescope').extensions.undo.undo() end, desc = 'Fuzzy search [u]ndo list' },

        },
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'renerocksai/telekasten.nvim',
                cmd = 'Telekasten',
                opts = {
                    home = vim.fn.expand('$HOME/notes/zettelkasten'), -- Name of notes directory
                },
            },
            {
                'debugloop/telescope-undo.nvim',
            },
            -- {
            --     "Sharonex/edit-list.nvim",
            --     config = true,
            --     keys = {
            --         { '<Leader>ll', '<Cmd>EditList<Cr>', desc = 'Telescope file browser from root' },
            --     }
            -- },
            {
                "nvim-telescope/telescope-live-grep-args.nvim" ,
                -- This will not install any breaking changes.
                -- For major updates, this must be adjusted manually.
                -- version = "^1.0.0",
            },
            {
                'nvim-telescope/telescope-file-browser.nvim',
                lazy = true,
                -- dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
                keys = {
                    { '<Leader>E', '<Cmd>Telescope file_browser<Cr>', desc = 'Telescope file browser from root' },
                    { '<Leader>e', '<Cmd>Telescope file_browser path=%:p:h select_buffer=true<Cr>', desc = 'Telescope file browser from current file' },
                },
            },
            {
                -- Match on filename prioritized over match on full path
                -- Search including path separators enables "strict path matching" (eg: src/)
                -- Search query is space-separated to make narrowing down results easier
                'natecraddock/telescope-zf-native.nvim',
            },
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }, -- zf-native is used for all sorting 
        },
    },

    -- Illegal git plugin
    {'tpope/vim-fugitive', cmd = 'G'},
    -- Support bitbucket url for Gbrowse
    {
        'tommcdo/vim-fubitive',
        cmd = 'GBrowse',
        dependencies = { 'tpope/vim-fugitive' },
    },
    -- 2 way git merge conflicts
    {'whiteinge/diffconflicts', cmd = 'DiffConflicts'},

    {
        -- List diff for current repo
        -- The current branch: :DiffviewFileHistory
        -- The current file: :DiffviewFileHistory %
        'sindrets/diffview.nvim',
        cmd = 'DiffviewOpen',
        keys = {
            { '<leader>gs', '<Cmd>DiffviewOpen<Cr>', desc = 'Open Diffview for [g]it [s]tatus' },
        },
        opts = {
            enhanced_diff_hl = true,
            view = {
                default = {
                    layout = 'diff2_vertical',
                    winbar = true,
                },
            },
            file_panel = {
                listing_style = 'list',
            },
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
                vim.keymap.set('n', '<Leader>hp', require('gitsigns').preview_hunk, { buffer = bufnr, desc = 'Preview git hunk' })
                vim.keymap.set('n', '<Leader>hbf', function() require('gitsigns').blame_line{full=true} end, { desc = 'Git blame full' })
                vim.keymap.set('n', '<Leader>hbl', require('gitsigns').blame_line, { desc = 'Git blame line' })

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
        -- Wrapper for neovim terminal
        'akinsho/toggleterm.nvim',
        version = "*",
        cmd = { 'ToggleTerm' , 'Lg' },
        keys = {
            { '<leader>t', '<Cmd>ToggleTerm size=50 direction=vertical<Cr>', desc = 'Open new vertical terminal' },
            { '<leader>T', '<Cmd>ToggleTerm direction=horizontal<Cr>', desc = 'Open new horizontal terminal' },
        },
        config = function()
            require('toggleterm').setup {
                -- open_mapping = '<leader>t',
                insert_mappings = false,
            }
            function _G.set_terminal_keymaps()
                local opts = {buffer = 0}
                vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], opts)
                vim.keymap.set('t', '<Leader>t', [[<Cmd>ToggleTerm<Cr>]], opts)
                vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
                vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
                vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
                vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
                vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
            end
            vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

            local Terminal  = require('toggleterm.terminal').Terminal
            local lazygit = Terminal:new({
                cmd = 'lazygit',
                -- dir = 'git_dir',
                -- dir = vim.fn.expand('%:p'),
                -- TODO open the git root of the current file
                -- not the git root of the pwd of nvim
                direction = 'tab',
                -- float_opts = {
                --     border = 'double',
                -- },
                -- function to run on opening the terminal
                on_open = function(term)
                    vim.cmd('startinsert!')
                    vim.keymap.set('n', 'q', '<cmd>close<CR>', {buffer = term.bufnr, noremap = true, silent = true})
                end,
                -- function to run on closing the terminal
                on_close = function(term)
                    vim.cmd('startinsert!')
                end,
            })
            function _lazygit_toggle()
                lazygit.dir = vim.fn.expand("%:p:h") -- current working directory for the active buffer
                lazygit:toggle()
            end
            -- vim.keymap.set('n', '<leader>g', '<cmd>lua _lazygit_toggle()<CR>', {noremap = true, silent = true})
            vim.api.nvim_create_user_command('Lg', 'lua _lazygit_toggle()', {})
        end,
    },

    {
        -- Session management
        'jedrzejboczar/possession.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        -- event = 'VeryLazy',
        cmd = {'SSave', 'SLoad', 'SDelete'},
        config = function ()
            require('possession').setup {
                autosave = {
                    current = true,
                    tmp = true,
                },
                plugins = {
                    delete_hidden_buffers = false, -- Keep hidden buffers in session
                    delete_buffers = true, -- Delete all buffers before loading another session
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
            { 's', mode = { 'n', 'x', 'o' }, function() require('flash').jump({search = {
                mode = 'fuzzy'
            },}) end, desc = 'Flash' },
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
        -- See :help nvim-surround.usage
        'kylechui/nvim-surround',
        version = '*', -- Use for stability; omit to use `main` branch for the latest features
        event = 'VeryLazy',
        config = true,
    },

    {
        -- Help for working with paired characters "" () {} etc
        'echasnovski/mini.pairs',
        event = 'VeryLazy',
        version = false, -- Use main branch (latest)
        config = true,
    },

    {
        -- When pressing tab and the line to the left of the cursor isn't all whitespace, the cursor will jump to the end of the syntax tree's parent node.
        -- This is awesome with mini.pairs above
        'boltlessengineer/smart-tab.nvim',
        event = 'VeryLazy',
        config = true,
    },

    {
        -- Splitting/joining blocks of code like arrays, hashes, statements, objects, dictionaries, etc with tree-sitter
        'Wansmer/treesj',
        keys = {
            { '<Leader>j', '<Cmd>TSJToggle<cr>', desc = 'Join Toggle' },
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
            override_keymaps = true,
            -- scroll_limit = 150, -- default setting
        },
    },

    -- Detect tabstop and shiftwidth automatically
    -- {'Darazaki/indent-o-matic', event = 'VeryLazy', config = true}
    -- {'tpope/vim-sleuth', event = 'VeryLazy'},
    -- Add indent text object to vim. <count>ai ii aI iI
    {'michaeljsmith/vim-indent-object', event = 'VeryLazy'},
    -- Vim "inner line" text object. Ignore leading and trailing whitespace. v_ y_ d_
    {'bruno-/vim-line', event = 'VeryLazy'},
    -- "gc" to comment visual regions/lines
    {'numToStr/Comment.nvim', event = 'VeryLazy', opts = {}},
    -- Useful plugin to show you pending keybinds.
    {'folke/which-key.nvim', event = 'VeryLazy', opts = {}},

    {
        -- Highlight active parts of the code
        "folke/twilight.nvim",
        cmd = 'Twilight',
        opts = {},
    },

    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                -- transparent = true, -- Enable this to disable setting the background color
                day_brightness = 0.4, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
            })
            -- vim.cmd[[colorscheme tokyonight]]
            vim.cmd('colorscheme tokyonight')
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
-- Customization
--

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


-- 
-- Load more configs
--

require('options')
require('remaps')
