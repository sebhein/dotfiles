# Dev Environment Config

## Setting up VirtualBox
  
  - Add guest box to host ssh config, add an entry to `~/.ssh/config`

```
Host <name>
  Hostname 127.0.0.x
  Port 2222
  User <user>
```

  - Add port forwarding rules to the virtual machine, navigate to `settings -> Network -> Advanced -> Port Forwarding`

| Name | Protocol | Host IP | Host Port | Guest IP | Guest Port |
--- | --- | --- | --- | --- | ---
| SSH | TCP | 127.0.0.x | 2222 | | 22 |
| server | TCP | | 8000 | | 8000 |

  - Add virutal box ssh keys to repo-manager, see [Github with SSH](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh)
  
  - (OPTIONAL) Start virtual box on startup
    1. Go to `C:\Users\username\AppData\Roaming\Windows\Start Menu\Programs\Startup`
    2. Create new `*.bat` file
    3. Edit file with VM info i.e. `"C:\Program Files\Oracle\VirtualBox\VBoxmanage.exe" startvm "<VM Name>" --type "headless"`

## VIM
  - clone Vundle
  - install nodejs on machine, `sudo apt install nodejs npm`
  - within VIM; `:PluginInstall`
  - move `coc-settings.json` to `~/.vim/`

## NVIM
  - move `.config/nvim/init.vim` to home directory
  - setup [vim-plug](https://github.com/junegunn/vim-plug)
