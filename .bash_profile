
# > How to hide the 'default interactive shell is now zsh' message in Terminal on macOS  
# > https://www.addictivetips.com/mac-os/hide-default-interactive-shell-is-now-zsh-in-terminal-on-macos/
export BASH_SILENCE_DEPRECATION_WARNING=1

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

[[ -s "/Users/user/.gvm/scripts/gvm" ]] && source "/Users/user/.gvm/scripts/gvm"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/user/.sdkman"
[[ -s "/Users/user/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/user/.sdkman/bin/sdkman-init.sh"
