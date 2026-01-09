return {

    {
        'supermaven-inc/supermaven-nvim',
        -- config = function()
        --     require('supermaven-nvim').setup({})
        -- end,
        opts = {
            keymaps = {
                accept_suggestion = "<C-l>",
                -- clear_suggestion = "<C-]>",
                -- accept_word = "<C-j>",
            },
            -- disable_inline_completion = false, -- disables inline completion for use with cmp
        },
    },

    -- {
    --     'olimorris/codecompanion.nvim',
    --     dependencies = {
    --         'nvim-lua/plenary.nvim',
    --         'nvim-treesitter/nvim-treesitter',
    --         'hrsh7th/nvim-cmp', -- Optional: For using slash commands and variables in the chat buffer
    --         'nvim-telescope/telescope.nvim', -- Optional: For using slash commands
    --         { 'MeanderingProgrammer/render-markdown.nvim', ft = { 'markdown', 'codecompanion' } }, -- Optional: For prettier markdown rendering
    --         { 'stevearc/dressing.nvim', opts = {} }, -- Optional: Improves `vim.ui.select`
    --     },
    --     config = true
    -- }

    -- {
    --     'james1236/backseat.nvim',
    --     opts = {
    --         openai_api_key = os.getenv 'OPENAI_API_KEY',
    --         openai_model_id = 'gpt-4', --gpt-4 (If you do not have access to a model, it says "The model does not exist")
    --         -- split_threshold = 100,
    --     },
    -- },

}
