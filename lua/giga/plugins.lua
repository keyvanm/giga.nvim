vim.pack.add({
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/ibhagwan/fzf-lua",
    "https://github.com/nvim-mini/mini.completion",
    "https://github.com/stevearc/quicker.nvim",
    "https://github.com/lewis6991/gitsigns.nvim",
    "https://github.com/nvim-lualine/lualine.nvim",
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/folke/tokyonight.nvim",
    "https://github.com/mikavilpas/yazi.nvim",
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/akinsho/bufferline.nvim",
})

local fzf = require("fzf-lua")
fzf.setup({ fzf_colors = true })
vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "fzf find files" })
vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = "fzf live grep" })
vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "fzf buffers" })
vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "fzf help tags" })

require("mini.completion").setup({})
require("quicker").setup({})
require("gitsigns").setup({})
require("bufferline").setup({})
require("lualine").setup({})

local yazi = require("yazi")
vim.keymap.set("n", "<leader>y", function()
    yazi.yazi()
end, { desc = "Open yazi" })
