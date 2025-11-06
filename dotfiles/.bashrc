#/usr/bin/bash

#Local file to configure settings

# Source network defined .bashrc file
source /pkg/qct/software/lteswint/BuildFactory_linux/.bashrc
export P4PORT=ssl:qctp401:1443

# NEOVIM
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

# IU LLVM Tools
#export PATH=/prj/qct/software/hexagon/releases/tools/iu/2.0/Tools/bin:$PATH
#export PATH=/pkg/qct/software/hexagon/earlyaccess/volume2/8.3.alpha2:$PATH

# Set IU_SOURCE env variable to enable iu source sync
#export IU_SOURCE=1
# Set LIBRARY_PATH for VP compilation
#export LIBRARY_PATH=/usr/lib/x86_64-linux-gnu

#######################
#Codewise
#######################
export CODEWISE_URL=https://qpilot-api.qualcomm.com/inference
export CHATWISE_URL=https://chatwise.qualcomm.com/chatwise_api
export CWISE_API_KEY=383f799a-4f75-4d08-9dbc-285d70d73dd8

#######################
#Local scripts
#######################
export PATH=/usr2/dboiko/bin:/usr2/dboiko/bin/bin:$PATH
export PATH=/usr2/dboiko/usr/local:/usr2/dboiko/usr/local/bin:$PATH
export PATH=$PATH:/usr/local/bin/
export PATH=/usr/bin:$PATH
#######################
#Keybinds
#######################
# Disable XON/XOFF so that bash keybind ( C-s ) for forward search is not overriden
stty -ixon
#######################
#ALIASI
#######################
alias cpuus='_cpu_usage'
alias f='find_ext.sh'
alias g='_grep'
#alias tmux="tmux -2"
alias vscode='LD_LIBRARY_PATH=/pkg/qct/software/lteswint/linux_qtf/vscode/lib /pkg/qct/software/lteswint/linux_qtf/vscode/VSCode-linux-x64-1.34.0/bin/code'
#######################
#FUNCTIONS
#######################
_cpu_usage ()
{
  command mpstat | awk '$13 ~ /[0-9.]+/ { print 100 - $13"%" }'
}

_grep ()
{
  grep -rni $1 | less
}

tmx ()
{
  tmux new-session "tmux source-file $HOME/.tmux/$1"
}
