-- Sync clipboard with OS once UI is up (deferred to keep startup fast).
vim.api.nvim_create_autocmd("UIEnter", {
    callback = function()
        vim.o.clipboard = "unnamedplus"
    end,
})

-- Briefly highlight yanked region.
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight yanked text",
    callback = function()
        vim.hl.on_yank()
    end,
})

-- :GitBlameLine — print git blame for the current line.
vim.api.nvim_create_user_command("GitBlameLine", function()
    local line = vim.fn.line(".")
    local filename = vim.api.nvim_buf_get_name(0)
    print(vim.system({ "git", "blame", "-L", line .. ",+1", filename }):wait().stdout)
end, { desc = "Print git blame for the current line" })
