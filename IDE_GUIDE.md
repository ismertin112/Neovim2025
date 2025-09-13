# Neovim IDE Guide

This configuration turns Neovim into a full-featured IDE with a focus on Go, DevOps tools, and modern front-end languages.

## Key Shortcuts

| Mapping | Mode | Description |
| --- | --- | --- |
| `<C-s>` / `<D-s>` | normal/insert/visual | Save current file |
| `<leader>tt` | normal | Toggle floating terminal |
| `<leader>tn` | normal | Run nearest test |
| `<leader>tf` | normal | Run all tests in file |
| `<leader>ts` | normal | Run full test suite |
| `<leader>gg` | normal | Open LazyGit interface |
| `<leader>dp` | normal | Run `terraform plan` in file's directory |
| `<leader>da` | normal | Run `terraform apply` in file's directory |
| `<leader>db` | normal | Run `ansible-playbook` on current file |
| `<leader>xx` | normal | Toggle diagnostics with Trouble |
| `<leader>e` | normal | Toggle Neo-tree file explorer |
| `<leader>gd` | normal | Open Git diff view |
| `<leader>zz` | normal | Toggle Zen mode |
| `<leader>lh` | normal | LSP hover via Lspsaga |
| `<leader>la` | normal | LSP code actions |
| `<leader>lr` | normal | Rename symbol |
| `<leader>ld` | normal | Line diagnostics |
| `<leader>ff` | normal | Fuzzy find files |
| `<leader>fg` | normal | Live grep through project |
| `<leader>ao` | normal | Toggle code outline with Aerial |
| `<leader>td` | normal | List TODO/FIXME in Trouble |
| `<leader>tm` | normal | Search TODO/FIXME via Telescope |
| `<leader>ha` | normal | Harpoon add file mark |
| `<leader>hh` | normal | Toggle Harpoon quick menu |
| `<leader>dd` | normal | Start/continue debug session |
| `<leader>dt` | normal | Toggle breakpoint |
| `<leader>du` | normal | Toggle DAP UI |
| `<leader>sl` | normal | Load saved session |
| `<leader>ss` | normal | Save current session |
| `<leader>nm` | normal | Show message history with Noice |

## Language Support

- Go via `gopls` and `go.nvim`
- Terraform (`terraformls`)
- Ansible (`ansiblels`)
- JSON & YAML
- JavaScript/TypeScript, HTML, CSS

## DevOps Helpers

- `toggleterm.nvim` provides a floating terminal for running tools like Terraform and Ansible directly inside Neovim.
- `vim-test` integrates with the terminal to run tests.
- `nvim-lint` runs linters on save for Go, Terraform, YAML, Ansible, and JSON.
- `lazygit.nvim` opens a Git TUI with `<leader>gg`.
- Shortcuts exist to trigger Terraform and Ansible commands in-place.
- `todo-comments.nvim` highlights TODO/FIXME annotations and surfaces them via Trouble or Telescope.
- `aerial.nvim` provides a code outline for quick navigation (`<leader>ao`).
- `nvim-dap` with `dap-ui` and `dap-go` brings first-class debugging to Go (`<leader>dd`).
- `harpoon` offers fast file marking and hopping around large codebases.
- `neovim-session-manager` can persist and restore editing sessions.
- `noice.nvim` and `nvim-notify` present messages and notifications in a modern UI.
- `codeium.nvim` provides AI-powered code suggestions.
- `lualine.nvim` and `bufferline.nvim` supply a polished status line and tab bar.
- `neo-tree.nvim` offers a file explorer with icons and git status.
- `lspsaga.nvim` wraps LSP actions in a slick UI.
- `gitsigns.nvim` and `diffview.nvim` improve git integration.
- `which-key.nvim` reveals keymaps as you type.
- `indent-blankline.nvim` draws indentation guides.
- `alpha-nvim` renders a start screen on launch with a "Happy Hacking" hacker motif.
- `neoscroll.nvim` enables smooth scrolling; `zen-mode.nvim` and `twilight.nvim` provide distraction-free writing.
- `nvim-ufo` adds folding previews without auto-collapsing code.

## Tips & Tricks

- Use `jk` in insert mode to quickly exit to normal mode.
- `;` in normal mode enters command mode.
- Remember that many NvChad defaults (file explorer, fuzzy finder, statusline) are available out of the box.
- Press `<leader>` and wait to trigger `which-key` for discoverable shortcuts.
- `gf` opens the file under the cursor; `gqap` formats a paragraph.
- `Ctrl-d`/`Ctrl-u` scroll half a page down/up; with `neoscroll` it's silky smooth.

Happy hacking!
