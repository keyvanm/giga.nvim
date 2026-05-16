# giga.nvim

An opinionated Neovim setup that installs **alongside** your existing config — not on top of it. No fork. No `~/.config/nvim` takeover. Two lines in your `init.lua` and you've got LSP, fuzzy finder, treesitter, formatters, a statusline, a file manager, and a curated terminal-IDE stack wired up. Disable any piece, or rip the whole thing out by commenting one line.

<!-- TODO: screenshot — tokyonight + lualine + bufferline + a fzf-lua picker open over a real file. -->

## Why this and not NVChad / LazyVim / AstroNvim?

The famous distros are *configurations you adopt instead of yours*. They live in `~/.config/nvim`, and your old setup goes away — or has to be reverse-engineered into the new structure if you want to keep parts of it.

giga.nvim is a *plugin*. It loads via `vim.pack` from inside your existing `init.lua`. Your config stays yours; giga.nvim is a layer on top. Set `langs = false` to skip the language pack; comment out the `vim.pack.add` line to remove the layer entirely.

The other angle worth knowing: giga.nvim is the editor end of the [`zyn`](https://github.com/keyvanm/zyn) workflow. Pair it with `zyn` (the CLI) and [`zyn.nvim`](https://github.com/keyvanm/zyn.nvim) (the focus companion) and file-opens from yazi, lazygit, ripgrep, and Claude Code all route into the same nvim session, with focus following the routing. No other distribution wires this.

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

**Base** (always loaded):

- `nvim-lspconfig` — LSP scaffolding
- `fzf-lua` — fuzzy picker
- `mini.completion` — completion
- `gitsigns.nvim` — git markers in the gutter
- `lualine.nvim` — statusline
- `bufferline.nvim` — tabs
- `yazi.nvim` — file manager bridge
- `quicker.nvim` — improved quickfix
- `tokyonight.nvim` + `nvim-web-devicons` — theme + icons

**Language pack** (opt-out with `langs = false`):

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

---

Boilerplate provided by [🔌 Neovim plugin boilerplate](https://github.com/shortcuts/neovim-plugin-boilerplate)
