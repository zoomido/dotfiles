local M = {}

-- Custom functions
M.grep = function()
    vim.ui.input({ prompt = "Directory: ", default = "./", completion = "dir" }, function(dir)
        dir = vim.trim(dir or "")
        if dir == "" then
            return
        end

        vim.ui.input({ prompt = "File pattern: ", default = "*" }, function(pattern)
            pattern = vim.trim(pattern or "")
            if pattern == "" or pattern == "*" then
                pattern = nil
            end

            require("telescope.builtin").live_grep({
                search_dirs = { dir },
                glob_pattern = pattern,
            })
        end)
    end)
end

return M
