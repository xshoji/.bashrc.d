
# > How to hide the 'default interactive shell is now zsh' message in Terminal on macOS  
# > https://www.addictivetips.com/mac-os/hide-default-interactive-shell-is-now-zsh-in-terminal-on-macos/
export BASH_SILENCE_DEPRECATION_WARNING=1

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

