#!/bin/bash

function usage()
{
cat << _EOT_

   setup
  ----------- author: xshoji

  Usage:
    ./$(basename "$0") --mode CREATE

  Description:
    Symlinks management tool.

  Required parameters:
    --mode,-m CREATE : Mode [ CREATE | DELETE ]

  Optional parameters:
    --debug : Enable debug mode

_EOT_
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
    ([ "${ARG}" == "--mode" ] || [ "${ARG}" == "-m" ]) && { shift 1; MODE="${1}"; SHIFT="false"; }
    ([ "${SHIFT}" == "true" ] && [ "$#" -gt 0 ]) && { shift 1; }
done
[ ! -z "${HELP+x}" ] && { usage; exit 0; }
# Check required parameters
[ -z "${MODE+x}" ] && { echo "[!] --mode is required. "; INVALID_STATE="true"; }
# Check invalid state and display usage
[ ! -z "${INVALID_STATE+x}" ] && { usage; exit 1; }



#------------------------------------------
# Main
#------------------------------------------

# Link target files
FILES=()
# Common files
FILES+=( .bashrc )
FILES+=( .bash_profile )
FILES+=( .bashrc_common )
FILES+=( .gitconfig )
FILES+=( .gitignore_global )
FILES+=( .vimrc )
# Local files
FILES+=( .gitconfig_local )
FILES+=( .bashrc_local )
FILES+=( .bashrc_common_global )
FILES+=( .fzf_local )

DIR_HOME="$(cd $(dirname ${BASH_SOURCE:-$0})/.. && pwd)"
DIR_BASHRCD="$(cd $(dirname ${BASH_SOURCE:-$0}) && pwd)"
if [ "${MODE}" == "CREATE" ]; then
    # Create links
    for FILE in ${FILES[@]}; do
        # Skip if link target file not exists
        if [ ! -f ${DIR_BASHRCD}/${FILE} ]; then
            continue;
        fi

        rm -rf ${DIR_HOME}/${FILE}
        ln -s ${DIR_BASHRCD}/${FILE} ${DIR_HOME}/${FILE}

        if [ ${FILE} == ".bash_profile" ]; then
            rm -rf ${DIR_HOME}/.profile
            ln -s ${DIR_BASHRCD}/${FILE} ${DIR_HOME}/.profile
        fi
    done
elif [ "${MODE}" == "DELETE" ]; then
    # Delete links
    for FILE in ${FILES[@]}; do
        rm -rf ${DIR_HOME}/${FILE}
        if [ ${FILE} == ".bash_profile" ]; then
            rm -rf ${DIR_HOME}/.profile
        fi
    done
else
  echo "${MODE} is Undefined."
  exit 1
fi
