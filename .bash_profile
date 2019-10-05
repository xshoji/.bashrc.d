if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi


[[ -s "/Users/nshoji/.gvm/scripts/gvm" ]] && source "/Users/nshoji/.gvm/scripts/gvm"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/nshoji/.sdkman"
[[ -s "/Users/nshoji/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/nshoji/.sdkman/bin/sdkman-init.sh"
