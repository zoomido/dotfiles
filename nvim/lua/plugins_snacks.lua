return {

    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            bigfile = {
                -- Deal with big files
                enabled = true,
            },
            dim = {
                enabled = true,
            },
            explorer = {
                enabled = true,
                replace_netrw = true, -- Replace netrw with snacks explorer
                trash = true, -- Use system trash when deleting files
            },
            indent = { 
                enabled = true,
                char = "┊",
                only_scope = true, -- only show indent guides of the scope
                only_current = true, -- only show indent guides in the current window
                scope = {
                    enabled = true, -- enable highlighting the current scope
                    char = "┊",
                    -- underline = true, -- underline the start of the scope
                    only_current = true, -- only show scope in the current window
                },
                chunk = {
                    -- when enabled, scopes will be rendered as chunks, except for the
                    -- top-level scope which will be rendered as a scope.
                    -- enabled = true,
                },
            },
            picker = {
                enabled = true,
                win = {
                    -- input window
                    input = {
                        keys = {
                            ["<c-l>"] = { "confirm", mode = { "n", "i" } },
                            ["<c-p>"] = { "preview_scroll_up", mode = { "i", "n" } },
                            ["<c-n>"] = { "preview_scroll_down", mode = { "i", "n" } },
                        },
                    },
                    list = {
                        keys = {
                            ["<c-p>"] = { "preview_scroll_up" },
                            ["<c-n>"] = { "preview_scroll_down" },
                        },
                    },
                },
                sources = {
                    explorer = {
                        auto_close = true,
                        supports_live = false,
                        layout = {
                            preset = "default",
                            preview = false,
                            -- width = 0.6,
                            -- height = 1.0,
                        },
                        win = {
                            list = {
                                keys = {
                                    ["<c-h>"] = "explorer_up",
                                    ["<c-l>"] = "confirm",
                                    ["gx"] = "explorer_open", -- open with system application
                                },
                            },
                        },
                    },
                },
            },
            scope = {
                -- Scope detection, text objects and jumping based on treesitter or indent
                enabled = true
            },
            scroll = {
                -- Smooth scrolling
                enabled = true,
            },
            terminal = {
                -- Create and toggle floating/split terminals
                enabled = true,
                keys = {
                    -- ["<Esc>"] = { "hide", mode = { "t", "n" }, desc = "Close terminal" },
                },
            },
            -- Efficient animations including over 45 easing functions (library)
            -- animate = { enabled = true },
            -- Beautiful declarative dashboards
            -- dashboard = { enabled = true },
            -- Focus on the active scope by dimming the rest
            -- Git utilities
            -- git = { enabled = true },
            -- Open the current file, branch, commit, or repo in a browser (e.g. GitHub, GitLab, Bitbucket)
            -- gitbrowse = { enabled = true },
            -- Open LazyGit in a float, auto-configure colorscheme and integration with Neovim
            -- lazygit = { },
            -- notifier = { enabled = true },
            -- When doing nvim somefile.txt, it will render the file as quickly as possible, before loading your plugins.
            -- quickfile = { enabled = true },
            -- Auto-show LSP references and quickly navigate between them
            -- words = { enabled = true },
        },
        keys = {
            -- Pickers
            { "<leader>b", function() Snacks.picker.buffers() end, desc = "Buffers" },
            { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
            { '<leader>p', function() Snacks.picker.registers() end, desc = "Registers" },
            { "<leader>u", function() Snacks.picker.undo() end, desc = "Undo History" },
            { "<leader>fa", function() Snacks.picker() end, desc = "All pickers" },
            { "<leader>fj", function() Snacks.picker.jumps() end, desc = "Jumps" },
            { "<leader>fr", function() Snacks.picker.resume() end, desc = "Resume" },
            -- { "<leader>fp", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" },
            -- { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
            -- find
            { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
            -- { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
            -- { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
            { "<leader>ff", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
            { "<leader>fF", function()
                -- Use git_files if inside git repo or fallback to regular file search
                local git_dir = vim.fs.find(".git", { upward = true })[1]
                if git_dir then
                    local git_root = vim.fs.dirname(git_dir)
                    Snacks.picker.git_files({ untracked = true })
                else
                    Snacks.picker.files()
                end
            end, desc = "Find files in CWD (git_files if available)" },
            -- Grep
            { "<leader>fl", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
            { "<leader>fL", function() Snacks.picker.grep_buffers() end, desc = "Grep in Open Buffers" },
            { "<leader>fw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
            { "<leader>fg", function()
                -- Use git_grep if inside git repo or fallback to regular grep
                local git_dir = vim.fs.find(".git", { upward = true })[1]
                if git_dir then
                    local git_root = vim.fs.dirname(git_dir)
                    Snacks.picker.git_grep({ untracked = true })
                else
                    Snacks.picker.grep()
                end
            end, desc = "Grep in CWD (git_grep if available)" },
            -- search
            -- { "<leader>sl", function() Snacks.picker.loclist() end, desc = "Location List" },
            -- { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
            -- git
            { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
            { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
            { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
            { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
            { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
            { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
            { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
            -- gh
            -- { "<leader>gi", function() Snacks.picker.gh_issue() end, desc = "GitHub Issues (open)" },
            -- { "<leader>gI", function() Snacks.picker.gh_issue({ state = "all" }) end, desc = "GitHub Issues (all)" },
            -- { "<leader>gp", function() Snacks.picker.gh_pr() end, desc = "GitHub Pull Requests (open)" },
            -- { "<leader>gP", function() Snacks.picker.gh_pr({ state = "all" }) end, desc = "GitHub Pull Requests (all)" },
            -- LSP
            -- { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
            -- { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
            -- { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
            -- { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
            -- { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
            -- { "gai", function() Snacks.picker.lsp_incoming_calls() end, desc = "C[a]lls Incoming" },
            -- { "gao", function() Snacks.picker.lsp_outgoing_calls() end, desc = "C[a]lls Outgoing" },
            -- { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
            -- { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
            -- Terminal
            { "<leader>t", function() Snacks.terminal.toggle() end, desc = "Toggle terminal" },
        },
    }

}

