vim.pack.add({
    "https://github.com/nvim-treesitter/nvim-treesitter",
    "https://github.com/stevearc/conform.nvim",
    "https://github.com/benomahony/uv.nvim",
    "https://github.com/mrcjkb/rustaceanvim",
})

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- Web/markup languages use 2-space indent.
vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "css",
        "html",
        "markdown",
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
    },
    callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
    end,
})

local treesitter = require("nvim-treesitter")
treesitter.setup({})
treesitter.install({
    "json",
    "yaml",
    "toml",
    "bash",
    "python",
    "rust",
    "javascript",
    "typescript",
    "markdown",
    "markdown_inline",
})

require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_fix", "ruff_organize_imports", "ruff_format" },
        markdown = { "prettier", "injected" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        toml = { "prettier" },
        jinja = { "prettier" },
        kdl = { "kdlfmt" },
        rust = { "rustfmt" },
    },
    format_on_save = function(_bufnr)
        if vim.g.giga_format_on_save == false then
            return
        end
        return { timeout_ms = 2500, lsp_format = "fallback" }
    end,
})

require("uv").setup()

vim.filetype.add({
    extension = {
        jinja = "jinja",
        jinja2 = "jinja",
        j2 = "jinja",
    },
})

vim.lsp.enable("marksman")
vim.lsp.enable("jinja-lsp")
vim.lsp.enable("ruff")
vim.lsp.enable("ty")
