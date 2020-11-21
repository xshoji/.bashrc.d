#----------------------------
# Imported files depend each environment
#----------------------------

# Load global common setting
if [ -f ~/.bashrc_common_global ]; then
     source ~/.bashrc_common_global
fi

# Load common setting
if [ -f ~/.bashrc_common ]; then
     source ~/.bashrc_common
fi

# Load local setting
if [ -f ~/.bashrc_local ]; then
     source ~/.bashrc_local
fi

# load fzf local setting
if [ -f ~/.fzf_local ]; then
     source ~/.fzf_local
fi

