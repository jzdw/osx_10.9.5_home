
alias ls='ls -G'
alias ll='ls -lhG'
alias lla='ls -lahG'

export CLICOLOR=1
export PS1="\u$ "

export GREP_OPTIONS="--color=auto"
######################### git 
if [ -f ~/.git-completion.bash ]; then
	source ~/.git-completion.bash
fi

if [ -f ~/.git-prompt.sh ]; then
	source ~/.git-prompt.sh
	export PS1='\W$(__git_ps1 "(%s)") > '
fi
######################### matlab
export PATH=$PATH:/tools/matlab/MATLAB_R2014a.app/bin
######################### python
# added by Anaconda 2.1.0 installer
export PATH="/tools/python/anaconda/bin:$PATH"

