if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi


[[ -s "/Users/user/.gvm/scripts/gvm" ]] && source "/Users/user/.gvm/scripts/gvm"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/user/.sdkman"
[[ -s "/Users/user/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/user/.sdkman/bin/sdkman-init.sh"
