This is my Neovim config repo. It's all written in Lua (for now)

## Requirements
I usually use Linux, so I had to make sure it also works in Windows. All requirements can be installed with [Chocolatey](https://chocolatey.org/install#individual) in Windows.

- ripgrep
- A C compiler like GCC, CLANG, etc. In Chocolatey, the 'zig' package is the easieast to install.
- Neovim 9+ (not sure which packages support older versions)


In the future I'll try to autodetect missing requirements like ripgrep and the C compiler and not use the packages that require them, so I can use the package in Termux without issues.
From what I remember, ripgrep is required by Telescope and the C compiler by Treesitter.

## Instructions
Clone this repo into the ~/.config/nvim directory on Linux or the ~\AppData\Local\nvim directory on Windows. Make sure the contents of the repo are directly in that folder, and not in a folder within that folder. 
After cloning run Neovim and everything should install automatically. To install any missing language servers you can use Mason, with commands like :MasonInstall <server> (e.g "MasonInstall pyright"). To install packages with Mason you may need to have npm and/or pip installed.
