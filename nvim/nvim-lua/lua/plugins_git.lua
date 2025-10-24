return {

    {
        -- Illegal git plugin
        'tpope/vim-fugitive',
        cmd = 'G',
    },

    -- 2 way git merge conflicts
    -- {'whiteinge/diffconflicts', cmd = 'DiffConflicts'},
    { 'samoshkin/vim-mergetool', cmd = 'MergetoolStart' },

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
                vim.keymap.set('n', '<Leader>hbf', function() require('gitsigns').blame_line { full = true } end, { desc = 'Git blame full' })
                vim.keymap.set('n', '<Leader>hbl', require('gitsigns').blame_line, { desc = 'Git blame line' })

                -- don't override the built-in and fugitive keymaps
                local gs = package.loaded.gitsigns
                vim.keymap.set({ 'n', 'v' }, ']c', function()
                    if vim.wo.diff then return ']c' end
                    vim.schedule(function() gs.next_hunk() end)
                    return '<Ignore>'
                end, { expr = true, buffer = bufnr, desc = 'Jump to next hunk' })
                vim.keymap.set({ 'n', 'v' }, '[c', function()
                    if vim.wo.diff then return '[c' end
                    vim.schedule(function() gs.prev_hunk() end)
                    return '<Ignore>'
                end, { expr = true, buffer = bufnr, desc = 'Jump to previous hunk' })
            end,
        },
    },

}
