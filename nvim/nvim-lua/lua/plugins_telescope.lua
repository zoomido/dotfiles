return {

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
                    vimgrep_arguments = {
                        -- This will trim indentation: https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#ripgrep-remove-indentation
                        'rg',
                        '--color=never',
                        '--no-heading',
                        '--with-filename',
                        '--line-number',
                        '--column',
                        '--smart-case',
                        '--trim' -- The secret sauce
                    },
                    mappings = {
                        i = {
                            -- map actions.which_key to <C-h> (default: <C-/>)
                            -- actions.which_key shows the mappings for your picker,
                            -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                            ['<C-->'] = 'which_key',
                            ['<C-l>'] = 'select_default',
                            ['<C-a>'] = require('telescope.actions.layout').toggle_preview,
                            ['<C-s>'] = require('telescope.actions.layout').cycle_layout_next,
                            ['<C-j>'] = 'move_selection_next',
                            ['<C-k>'] = 'move_selection_previous',
                            ['<S-Tab>'] = require('telescope.actions').toggle_selection + require('telescope.actions').move_selection_next,
                            ['<C-ö>'] = function(p_bufnr) require('telescope.actions').send_selected_to_qflist(p_bufnr) vim.cmd.cfdo('edit') end, -- Open all selected entries
                            ['<C-n>'] = require('telescope.actions').cycle_history_next,
                            ['<C-p>'] = require('telescope.actions').cycle_history_prev,
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
                    find_files = {
                        mappings = {
                            i = {
                                ['<C-h>'] = function(prompt_bufnr)
                                    local current_picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
                                    -- cwd is only set if passed as telescope option
                                    local cwd = current_picker.cwd and tostring(current_picker.cwd)
                                    or vim.loop.cwd()
                                    local parent_dir = vim.fs.dirname(cwd)

                                    require('telescope.actions').close(prompt_bufnr)
                                    require('telescope.builtin').find_files {
                                        prompt_title = vim.fs.basename(parent_dir),
                                        cwd = parent_dir,
                                    }
                                end,
                            },
                            n = {
                                ['cc'] = function(prompt_bufnr)
                                    local current_picker = action_state.get_current_picker(prompt_bufnr)
                                    local finder = current_picker.finder
                                    finder.path = vim.loop.os_homedir()

                                    fb_utils.redraw_border_title(current_picker)
                                    current_picker:refresh(
                                        finder,
                                        { new_prefix = fb_utils.relative_path_prefix(finder), reset_prompt = true, multi = current_picker._multi }
                                    )
                                end,
                                ['cd'] = function(prompt_bufnr)
                                    local selection = require('telescope.actions.state').get_selected_entry()
                                    local dir = vim.fn.fnamemodify(selection.path, ':p:h')
                                    require('telescope.actions').close(prompt_bufnr)
                                    -- Depending on what you want put `cd`, `lcd`, `tcd`
                                    vim.cmd(string.format('silent lcd %s', dir))
                                end
                            }
                        }
                    },
                },
                extensions = {
                    -- file_browser = {
                    --     -- theme = 'ivy',
                    --     -- disables netrw and use telescope-file-browser in its place
                    --     hijack_netrw = true,
                    --     -- initial_mode = 'normal',
                    --     grouped = true,
                    --     depth = 1,
                    --     respect_gitignore = false,
                    --     hidden = { file_browser = true, folder_browser = true },
                    --     prompt_path = true,
                    --     mappings = {
                    --         ['i'] = {
                    --             -- your custom insert mode mappings
                    --             ['<C-h>'] = require('telescope._extensions.file_browser.actions').goto_parent_dir,
                    --             ['<Esc>'] = { '<Esc>', type = 'command' },
                    --         },
                    --         ['n'] = {
                    --             ['h'] = require('telescope._extensions.file_browser.actions').goto_parent_dir,
                    --             ['l'] = 'select_default',
                    --         },
                    --     },
                    -- },
                    live_grep_args = {
                        -- auto_quoting = true, -- enable/disable auto-quoting
                        mappings = {
                            i = {
                                ['<C-t>'] = require('telescope-live-grep-args.actions').quote_prompt({ postfix = ' -t' }),
                            },
                        },
                    },
                    undo = {
                        side_by_side = true,
                        layout_strategy = "vertical",
                        layout_config = {
                            preview_height = 0.6,
                        },
                        mappings = {
                            i = {
                                ['<Cr>'] = require('telescope-undo.actions').restore,
                                ['<C-l>'] = require('telescope-undo.actions').restore,
                                -- alternative defaults, for users whose terminals do questionable things with modified <cr>
                                ['<C-y>'] = require('telescope-undo.actions').yank_deletions,
                            },
                            n = {
                                ['y'] = require('telescope-undo.actions').yank_deletions,
                                ['Y'] = require('telescope-undo.actions').yank_additions,
                                ['<Cr>'] = require('telescope-undo.actions').restore,
                            },
                        },
                    },
                    smart_open = {
                        match_algorithm = 'fzf',
                    },
                },
            }
        end,
        keys = {
            -- Builtin keybindings
            { '<Leader>b', '<Cmd>Telescope buffers<Cr>', desc = 'List open [B]uffers' },
            { '<Leader>fb', function() require('telescope.builtin').current_buffer_fuzzy_find() end, desc = 'Fuzzy [f]ind in current [b]uffer' },
            { '<Leader>fB', function() require('telescope.builtin').live_grep({ grep_open_files = true }) end, desc = '[f]ind in all open [B]uffers' },
            -- { '<leader>ff', function() require('telescope.builtin').find_files() end, desc = '[f]ind [f]iles' },
            { '<leader>fG', function() require('telescope.builtin').live_grep() end, desc = '[f]ind with builtin [G]rep' },
            -- { '<leader>fz', function() require('telescope.builtin').grep_string() end, mode = 'x', desc = '[f]ind with live [g]rep args' },
            -- { '<leader>fz', function() require('telescope.builtin').grep_string({ shorten_path = true, word_match = "-w", only_sort_text = true, search = '' }) end, desc = '[f]ind with live [g]rep args' }, -- WAY TOO SLOW, must wait for all results before searching
            { '<leader>fj', function() require('telescope.builtin').jumplist() end, desc = '[f]ind in [j]umplist' },
            { '<leader>gb', function() require('telescope.builtin').git_branches() end, desc = '[g]it [b]ranches' },

            -- Extension keybindings
            { '<leader>fg', function() require('telescope-live-grep-args.shortcuts').grep_visual_selection() end, mode = 'x', desc = '[f]ind word under cursor with live [g]rep args' },
            { '<leader>u', function() require('telescope').extensions.undo.undo() end, desc = 'Fuzzy search [u]ndo list' },
            { '<leader>fg', function() require('telescope').extensions.live_grep_args.live_grep_args() end, desc = '[f]ind with live [g]rep args' },
            { '<leader>ff', function() require('telescope').extensions.smart_open.smart_open({ filename_first = false }) end, desc = '[f]ind [f]iles with smart open' },
            -- { '<leader>ff', function() require('telescope').extensions.frecency.frecency() end, desc = '[f]ind [f]iles with frecency' },
        },
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
    },

    --
    -- Telescope plugins
    --

    {
        'renerocksai/telekasten.nvim',
        dependencies = { 'nvim-telescope/telescope.nvim' },
        cmd = 'Telekasten',
        opts = {
            home = vim.fn.expand('$HOME/private-notes'), -- Name of notes directory
        },
    },

    {
        'debugloop/telescope-undo.nvim',
        dependencies = { 'nvim-telescope/telescope.nvim' },
        config = function()
            require('telescope').load_extension('undo')
        end,
    },

    {
        'AckslD/nvim-neoclip.lua',
        config = function()
            require('telescope').load_extension('neoclip')
        end,
        opts = {
            content_spec_column = true,
            keys = {
                telescope = {
                    i = {
                        -- select = '<cr>', // Select to a register
                        paste = '<c-l>',
                        paste_behind = '<c-ö>',
                    },
                },
            },
        },
        keys = {
            { '<leader>p', function() require('telescope').extensions.neoclip.default() end, mode = {'n', 'v'}, desc = 'Fuzzy search yank history' },
        }
    },

    -- {
    --     "Sharonex/edit-list.nvim",
    --     config = true,
    --     keys = {
    --         { '<Leader>ll', '<Cmd>EditList<Cr>', desc = 'Telescope file browser from root' },
    --     }
    -- },

    {
        'nvim-telescope/telescope-live-grep-args.nvim',
        -- This will not install any breaking changes.
        -- For major updates, this must be adjusted manually.
        -- version = "^1.0.0",
        dependencies = { 'nvim-telescope/telescope.nvim' },
        config = function()
            require('telescope').load_extension('live_grep_args')
        end,
    },

    -- {
    --     'nvim-telescope/telescope-file-browser.nvim',
    --     config = function()
    --         require('telescope').load_extension('file_browser')
    --     end,
    --     lazy = true,
    --     dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
    --     keys = {
    --         -- { '<Leader>E', '<Cmd>Telescope file_browser<Cr>', desc = 'Telescope file browser from root' },
    --         -- { '<Leader>e', '<Cmd>Telescope file_browser path=%:p:h select_buffer=true<Cr>', desc = 'Telescope file browser from current file' },
    --     },
    -- },

    {
        "danielfalk/smart-open.nvim",
        -- branch = "0.2.x",
        config = function()
            require('telescope').load_extension('smart_open')
        end,
        dependencies = {
            'kkharji/sqlite.lua',
            -- Only required if using match_algorithm fzf
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
            -- Optional, to use devicons
            { "nvim-tree/nvim-web-devicons" },
        },
    },

    -- {
    --     'nvim-telescope/telescope-frecency.nvim',
    --     config = function()
    --         require('telescope').load_extension('frecency')
    --     end,
    -- },

}
