#!/bin/sh
#==========================================================
# 概要
#  .bashrc等のファイルのシンボリックリンクを作成してくれます
#
# 引数
#  sh this_shell.sh
#
#==========================================================

#------------------------------------------
# 設定
set -ux

# リンク対象のファイル群
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

#------------------------------------------
# メイン処理

# 設定されているリンク対象のファイルが存在していればリンクを貼る
DIR_HOME="$(cd $(dirname ${BASH_SOURCE:-$0})/.. && pwd)"
DIR_BASHRCD="$(cd $(dirname ${BASH_SOURCE:-$0}) && pwd)"

for FILE in ${FILES[@]}; do
    if [ ! -f ${DIR_BASHRCD}/${FILE} ]; then
        continue;
    fi

    rm -rf ${DIR_HOME}/${FILE}
    ln -s ${DIR_BASHRCD}/${FILE} ${DIR_HOME}/${FILE}

    if [ ${FILE} == ".bash_profile" ]; then
        ln -s ${DIR_BASHRCD}/${FILE} ${DIR_HOME}/.profile
    fi
done

