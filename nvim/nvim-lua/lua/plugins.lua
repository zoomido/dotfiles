-- plugins.lua

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
local common_plugins = {

    {
        -- See :help nvim-surround.usage
        'kylechui/nvim-surround',
        version = '*', -- Use for stability; omit to use `main` branch for the latest features
        event = 'VeryLazy',
        config = true,
    },

    {
        -- "gc" to comment visual regions/lines
        'numToStr/Comment.nvim',
        event = 'VeryLazy',
        opts = {},
        keys = {
            { 'gcc', mode = {'n', 'v'}, desc = 'Toggle line comment' },
            { 'gcb', mode = {'n', 'v'}, desc = 'Toggle block comment' },
        },
    },


    ----
    -- Integration with terminal applications
    ----

    {
        -- Wrapper for neovim terminal
        'akinsho/toggleterm.nvim',
        version = "*",
        cmd = { 'ToggleTerm', 'Lg' },
        keys = {
            { '<leader>t', '<Cmd>ToggleTerm size=50 direction=vertical<Cr>', desc = 'Open new vertical terminal' },
            { '<leader>T', '<Cmd>ToggleTerm direction=horizontal<Cr>',       desc = 'Open new horizontal terminal' },
            { '<leader>mc', '<Cmd>TermExec size=50 cmd="mm"<Cr>', desc = 'Run alias mm (usually inside container)' },
        },
        config = function()
            require('toggleterm').setup {
                -- open_mapping = '<leader>t',
                insert_mappings = false,
                direction = 'vertical',
            }
            function _G.set_terminal_keymaps()
                local opts = { buffer = 0 }
                vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], opts)
                vim.keymap.set('t', '<Leader>t', [[<Cmd>ToggleTerm<Cr>]], opts)
                vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
                vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
                vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
                vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
                vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
            end

            vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

            local Terminal = require('toggleterm.terminal').Terminal
            local lazygit  = Terminal:new({
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
                    vim.keymap.set('n', 'q', '<cmd>close<CR>', { buffer = term.bufnr, noremap = true, silent = true })
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

}

--
-- Load plugins from .nvim_plugins file in home directory
--
-- example .nvim_plugins file:
-- plugins_ai
-- plugins_git
-- plugins_helper
-- plugins_lsp
-- plugins_telescope
-- plugins_ui
-- plugins_yazi
--

local cfg = vim.loop.os_homedir() .. "/.nvim_plugins"
if vim.loop.fs_stat(cfg) then
    for _, line in ipairs(vim.fn.readfile(cfg)) do
        local name = vim.trim(line)
        -- Skip empty lines or lines starting with #
        if name ~= "" and not name:match("^#") then
            local ok, extra = pcall(require, name)
            if ok and type(extra) == "table" then
                vim.list_extend(common_plugins, extra)
                -- vim.notify("Loaded plugin spec: " .. name, vim.log.levels.INFO)
            else
                vim.notify("⚠️ Failed to load plugin spec: " .. name, vim.log.levels.WARN)
            end
        end
    end
else
    vim.notify("No ~/.nvim_plugins file found", vim.log.levels.INFO)
end

require("lazy").setup(common_plugins)
