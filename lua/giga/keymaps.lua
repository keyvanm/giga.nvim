-- Exit terminal mode with <Esc>.
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- <A-h/j/k/l> window navigation across normal/insert/terminal modes.
for k, dir in pairs({ h = "h", j = "j", k = "k", l = "l" }) do
    vim.keymap.set({ "t", "i" }, "<A-" .. k .. ">", "<C-\\><C-n><C-w>" .. dir)
    vim.keymap.set("n", "<A-" .. k .. ">", "<C-w>" .. dir)
end

-- Format file or visual range. Uses conform if loaded; otherwise LSP.
vim.keymap.set({ "n", "v" }, "<leader>f", function()
    local ok, conform = pcall(require, "conform")
    if ok then
        conform.format({ lsp_fallback = true, async = false, timeout_ms = 500 })
    else
        vim.lsp.buf.format()
    end
end, { desc = "Format file or range" })
