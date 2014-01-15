#export PATH=:$PATH
#export LD_LIBRARY_PATH=/lsc/opt/boost-1.48.0-precise/lib:/lsc/opt/hdf5-1.8.7/lib:$LD_LIBRARY_PATH
export PATH=/usr/local/visit/bin/visit:$PATH
export LD_LIBRARY_PATH=/usr/local/visit/2.6.2/linux-x86_64/lib/:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/lib/:$LD_LIBRARY_PATH

#set colours in directories
export MPIRUN="mpirun -mca btl ^sm"
alias ls='ls --color'
export TERM="xterm-256color"
#auto-completion script for git
source ~/git-completion.bash
#source ~/Solarized.bash

