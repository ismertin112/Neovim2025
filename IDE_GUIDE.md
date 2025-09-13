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
| `<leader>dp` | normal | Run `terraform plan` |
| `<leader>da` | normal | Run `terraform apply` |
| `<leader>db` | normal | Run `ansible-playbook` on current file |
| `<leader>xx` | normal | Toggle diagnostics with Trouble |
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
- `copilot.lua` provides AI-powered code suggestions.

## Tips & Tricks

- Use `jk` in insert mode to quickly exit to normal mode.
- `;` in normal mode enters command mode.
- Remember that many NvChad defaults (file explorer, fuzzy finder, statusline) are available out of the box.

Happy hacking!
