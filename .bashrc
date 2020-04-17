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


PATH="/Users/user/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/user/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/user/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/user/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/user/perl5"; export PERL_MM_OPT;
