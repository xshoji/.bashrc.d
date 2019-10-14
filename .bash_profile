
# > How to hide the 'default interactive shell is now zsh' message in Terminal on macOS  
# > https://www.addictivetips.com/mac-os/hide-default-interactive-shell-is-now-zsh-in-terminal-on-macos/
export BASH_SILENCE_DEPRECATION_WARNING=1

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi


[[ -s "/Users/nshoji/.gvm/scripts/gvm" ]] && source "/Users/nshoji/.gvm/scripts/gvm"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/nshoji/.sdkman"
[[ -s "/Users/nshoji/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/nshoji/.sdkman/bin/sdkman-init.sh"
