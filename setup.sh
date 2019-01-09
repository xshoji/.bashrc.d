#!/bin/bash

function usage()
{
cat << _EOT_

   setup
  ---------- author: xshoji

  Usage:
    ./$(basename "$0")

  Description:
    Create symlinks.

  Optional parameters:
    --debug : Enable debug mode

_EOT_
exit 1
}




#------------------------------------------
# Preparation
#------------------------------------------
set -eu

# Parse parameters
for ARG in "$@"
do
    SHIFT="true"
    [ "${ARG}" == "--debug" ] && { shift 1; set -eux; SHIFT="false"; }
    ([ "${ARG}" == "--help" ] || [ "${ARG}" == "-h" ]) && { shift 1; HELP="true"; SHIFT="false"; }
    ([ "${SHIFT}" == "true" ] && [ "$#" -gt 0 ]) && { shift 1; }
done
[ ! -z "${HELP+x}" ] && { usage; exit 0; }
# Check invalid state and display usage
[ ! -z "${INVALID_STATE+x}" ] && { usage; exit 1; }



#------------------------------------------
# Main
#------------------------------------------

# Link target files
FILES=()
FILES+=( .bashrc )
FILES+=( .bash_profile )
FILES+=( .bashrc_common_global )
FILES+=( .bashrc_common )
FILES+=( .bashrc_local )
FILES+=( .fzf_local )
FILES+=( .gitconfig )
FILES+=( .gitconfig_local )
FILES+=( .vimrc )

# Create links
DIR_HOME="$(cd $(dirname ${BASH_SOURCE:-$0})/.. && pwd)"
DIR_BASHRCD="$(cd $(dirname ${BASH_SOURCE:-$0}) && pwd)"
for FILE in ${FILES[@]}; do
    # Skip if link target file not exists
    if [ ! -f ${DIR_BASHRCD}/${FILE} ]; then
        continue;
    fi

    rm -rf ${DIR_HOME}/${FILE}
    ln -s ${DIR_BASHRCD}/${FILE} ${DIR_HOME}/${FILE}

    if [ ${FILE} == ".bash_profile" ]; then
        ln -s ${DIR_BASHRCD}/${FILE} ${DIR_HOME}/.profile
    fi
done
