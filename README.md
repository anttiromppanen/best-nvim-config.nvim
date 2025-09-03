# 💀 Best Nvim Config 💀

Personal nvim config, if you are looking for a starter kit there are better options available:

- [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)
- [LazyVim](https://github.com/LazyVim/LazyVim)
- [Astronvim](https://github.com/AstroNvim/AstroNvim)
- [NvChad](https://github.com/NvChad/NvChad)

To name a few popular ones.

## Installation

### External Dependencies

- ripgrep, fd-find
- A Nerd Font

#### 1. Remove (or backup) any previous nvim configs from:

| OS                   | PATH                                      |
| -------------------- | ----------------------------------------- |
| Linux, MacOS         | `$XDG_CONFIG_HOME/nvim`, `~/.config/nvim` |
| Windows (cmd)        | `%localappdata%\nvim\`                    |
| Windows (powershell) | `$env:LOCALAPPDATA\nvim\`                 |

#### 2. Clone the repo:

Linux and Mac

```bash
git clone https://github.com/anttiromppanen/best-nvim-config.nvim "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

Windows

For `cmd.exe`:

```bash
git clone https://github.com/anttiromppanen/best-nvim-config.nvim "%localappdata%\nvim"
```

For `powershell.exe`:

```bash
git clone https://github.com/anttiromppanen/best-nvim-config.nvim "${env:LOCALAPPDATA}\nvim"
```

3. Start Neovim

```bash
nvim
```

If everything went as expected you should see Lazy.nvim install all the packages contained in the config.

## Info

### Folder structure

📂 root: - init.lua: main file, inits the config - README.md - lazy-lock.json <br />
&nbsp;&nbsp;&nbsp;&nbsp;📂 /lua <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;📂 /config - directory for config <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;📂 /plugins - directory for lazy.nvim to install plugins from <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;📂 /playground - for testing out stuff without accidentally ruining configs

### Major keymaps

Most keymaps are shown with which-key

\<leader> = space

| Key     | Categories                     | Mode           |
| ------- | ------------------------------ | -------------- |
| `space` | LSP Buffer, Telescope, Trouble | normal, visual |
| `s`     | mini.surround                  | normal, visual |
| `d`     | Text delete                    | normal, visual |
| `g`     | Various stuff                  | normal, visual |
| `'`     | Marks                          | normal, visual |
| `<`     | Indent left                    | normal, visual |
| `z`     | Fold                           | normal, visual |
| `c`     | Text modification              | normal, visual |
| `v`     | Visual                         | normal, visual |
| `C-w`   | Window                         | normal, visual |
| `[`     | Previous                       | normal, visual |
| `]`     | Next                           | normal, visual |
| `y`     | Yank                           | normal, visual |
| `C-r`   | Redo / insert registers        | insert         |
