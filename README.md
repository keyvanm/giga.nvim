# giga.nvim

Opinionated Neovim distribution as a plugin. Pulls in LSP, fuzzy finder, treesitter, formatters, statusline, file manager, and a curated terminal-IDE stack — all wired up via Neovim 0.12+'s native `vim.pack` package manager.

Designed to install **alongside** your existing config — no fork, no `~/.config/nvim` takeover. Two lines in your `init.lua`.

## Requirements

- Neovim **0.12+** (uses native `vim.pack`)
- git
- Recommended: ripgrep, fd, lazygit, yazi for the full experience

## Install

```lua
-- ~/.config/nvim/init.lua
vim.pack.add({ "https://github.com/keyvanm/giga.nvim" })
require("giga").setup()
```

That's it. First launch downloads all dependencies via `vim.pack`.

## Configuration

```lua
require("giga").setup({
    colorscheme = "tokyonight-night",  -- default
    format_on_save = true,             -- default; toggle live with vim.g.giga_format_on_save
    langs = true,                      -- pull in treesitter / conform / LSPs
})
```

## What's included

**Base:**

- `nvim-lspconfig` — LSP scaffolding
- `fzf-lua` — fuzzy picker
- `mini.completion` — completion
- `gitsigns.nvim` — git markers in the gutter
- `lualine.nvim` — statusline
- `bufferline.nvim` — tabs
- `yazi.nvim` — file manager bridge
- `quicker.nvim` — improved quickfix
- `tokyonight.nvim` + `nvim-web-devicons` — theme + icons

**Language pack** (set `langs = false` to skip):

- treesitter parsers: python, rust, js/ts(x), json, yaml, toml, bash, markdown
- conform formatters: stylua, ruff, prettier(d), kdlfmt
- LSPs: marksman, jinja-lsp, ruff, ty
- `uv.nvim` — Python tooling
- jinja file-type detection

## Keymaps

Leader is `<space>`.

| Key                | Action                              |
| ------------------ | ----------------------------------- |
| `<leader>ff`       | Find files                          |
| `<leader>fg`       | Live grep                           |
| `<leader>fb`       | Buffers                             |
| `<leader>fh`       | Help tags                           |
| `<leader>f`        | Format file or visual range         |
| `<leader>y`        | Open yazi                           |
| `<A-h/j/k/l>`      | Window nav (normal/insert/terminal) |
| `<Esc>` (terminal) | Exit terminal mode                  |

## Pairing with `zyn`

giga.nvim is the editor end of the `zyn` workflow. Pair with [`zyn`](https://github.com/keyvanm/zyn) (the CLI) and [`zyn.nvim`](https://github.com/keyvanm/zyn.nvim) (the focus plugin) to get the yazi+nvim+multiplexer handoff out of the box.

---

Boilerplate provided by [🔌 Neovim plugin boilerplate](https://github.com/shortcuts/neovim-plugin-boilerplate)
