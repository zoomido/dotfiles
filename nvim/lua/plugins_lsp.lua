return {

    {
        -- LSP from Zero to Hero
        -- https://lsp-zero.netlify.app/docs/guide/lazy-loading-with-lazy-nvim
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v4.x',
        lazy = true,
        config = false,
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
            { 'L3MON4D3/LuaSnip' },
            { 'hrsh7th/cmp-buffer' },
            { 'kbwo/cmp-yank' },
        },
        config = function()
            local cmp = require('cmp')

            cmp.setup({
                -- REQUIRED - you must specify a snippet engine
                snippet = {
                    expand = function(args)
                        vim.snippet.expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    -- confirm completion item
                    -- ['<C-l>'] = cmp.mapping.confirm({ select = true }),
                    ['<Enter>'] = cmp.mapping.confirm({ select = true }),
                    -- trigger completion menu
                    -- ['<C-l>'] = cmp.mapping.complete(),
                    -- scroll up and down the documentation window
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                    -- navigate between snippet placeholders
                    -- probably need to import cmp_action further up
                    -- ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                    -- ['<C-b>'] = cmp_action.luasnip_jump_backward(),
                }),
                sources = {
                    { name = 'yank' },
                    { name = 'nvim_lsp' },
                    { name = 'luasnip',   keyword_length = 2 },
                    { name = 'buffer',    keyword_length = 3 },
                    { name = 'supermaven' },
                },
            })
        end
    },

    {
        -- LSP setup
        'neovim/nvim-lspconfig',
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
        },
        config = function()
            local lsp_zero = require('lsp-zero')

            local lsp_attach = function(client, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions

                vim.keymap.set('n', '<Leader>lsi', function() vim.lsp.buf.hover() end, { buffer = bufnr, desc = 'LSP [s]ymbol floating [i]nfo' })
                vim.keymap.set('n', '<Leader>lsr', function() vim.lsp.buf.rename() end, { buffer = bufnr, desc = 'LSP [s]ymbol [r]ename all references' })
                vim.keymap.set('n', '<Leader>lca', function() vim.lsp.buf.code_action() end, { buffer = bufnr, desc = 'LSP list [c]ode [a]ctions' })
                vim.keymap.set('i', '<C-s>', function() vim.lsp.buf.signature_help() end, { buffer = bufnr, desc = 'LSP Signature Help' })
                vim.keymap.set('n', '<Leader>lgd', function() vim.lsp.buf.definition() end, { buffer = bufnr, desc = 'LSP [g]o to [d]efinition of symbol' })
                vim.keymap.set('n', '<Leader>lgD', function() vim.lsp.buf.declaration() end, { buffer = bufnr, desc = 'LSP [g]o to [D]eclaration of symbol' })
                vim.keymap.set('n', '<Leader>lgt', function() vim.lsp.buf.type_definition() end, { buffer = bufnr, desc = 'LSP [g]o to definition for [t]ype' })
                vim.keymap.set('n', '<Leader>lli', function() vim.lsp.buf.implementation() end, { buffer = bufnr, desc = 'LSP [l]ist all [i]mplementations in quickfix' })
                vim.keymap.set('n', '<Leader>llr', function() vim.lsp.buf.references() end, { buffer = bufnr, desc = 'LSP [l]ist all [r]eferences in quickfix' })
                -- -- vim.keymap.set('n', '<Leader>lws', function() vim.lsp.buf.workspace_symbol() end, {buffer = bufnr, desc = 'LSP Workspace Symbol'})
                vim.keymap.set('n', '<Leader>ld', function() vim.diagnostic.open_float() end, { buffer = bufnr, desc = 'LSP [d]agnostics' })
                vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, { buffer = bufnr, desc = 'LSP Previous diagnostics' })
                vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, { buffer = bufnr, desc = 'LSP Next diagnostics' })
                vim.keymap.set({'n', 'v'}, '<Leader>lfc', function() vim.lsp.buf.format() end, { buffer = bufnr, desc = 'LSP Format [c]ode in buffer' })
            end

            lsp_zero.extend_lspconfig({
                sign_text = true,
                lsp_attach = lsp_attach,
                capabilities = require('cmp_nvim_lsp').default_capabilities()
            })

            require('mason-lspconfig').setup({
                ensure_installed = {},
                handlers = {
                    -- this first function is the "default handler"
                    -- it applies to every language server without a "custom handler"
                    function(server_name)
                        require('lspconfig')[server_name].setup({})
                    end,
                }
            })
        end
    },

    -- {
    --     -- Neovim setup for init.lua and plugin development
    --     'folke/neodev.nvim',
    --     ft = 'lua',
    --     opts = {},
    -- },

    -- {
    --     -- LSP helper: Show diagnostics, references, telescope results, quickfix and location lists
    --     "folke/trouble.nvim",
    --     dependencies = { "nvim-tree/nvim-web-devicons" },
    --     cmd = { 'Trouble' },
    --     keys = {
    --         { '<Leader>lt', function() require('trouble').toggle('') end, desc = 'Toggle [l]sp [t]rouble' },
    --     },
    --     opts = {
    --     },
    -- },

}
