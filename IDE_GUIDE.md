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

## Tips & Tricks

- Use `jk` in insert mode to quickly exit to normal mode.
- `;` in normal mode enters command mode.
- Remember that many NvChad defaults (file explorer, fuzzy finder, statusline) are available out of the box.

Happy hacking!
