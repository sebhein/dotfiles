source ~/.bashrc

# sources this file in new tmux window
# changes the loading requirement of .bashrc as interactive only
if [ -n "$BASH_VERSION" -a -n "$PS1" ]; then
  # include .bashrc if it exists
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
