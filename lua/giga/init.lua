local M = {}

M.defaults = {
    colorscheme = "tokyonight-night",
    format_on_save = true,
    langs = true,
}

--- Initialize giga: load options/keymaps/autocmds, install plugins via
--- `vim.pack.add`, configure each, and apply colorscheme.
---@param opts table?
function M.setup(opts)
    opts = vim.tbl_deep_extend("force", M.defaults, opts or {})

    -- Seed runtime toggles. Users can flip these later via `vim.g.giga_*`.
    vim.g.giga_format_on_save = opts.format_on_save

    require("giga.options")
    require("giga.keymaps")
    require("giga.cmds")
    require("giga.plugins")
    if opts.langs then
        require("giga.langs")
    end

    if opts.colorscheme then
        vim.cmd.colorscheme(opts.colorscheme)
    end
end

_G.Giga = M

return M
