# Common aliases
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias ll='ls -la'
alias ~='cd ~'
alias ?='pwd'

# Terraform
alias tf='terraform'
alias tfd='TF_LOG=TRACE terraform'
alias tff='terraform fmt --recursive'

function workspace_fn() {
	if [ -d .terraform ]; then
		workspace="$(command terraform workspace show 2>/dev/null)"
		echo " [$workspace]"
	fi
}

if [ -f $HOME/.bashrc.local ]; then
    . $HOME/.bashrc.local
fi

# Prompt
export PS1='\[\033]0;$TITLEPREFIX:$PWD\007\]\n\[\033[32m\]\[\033[33m\]\w\[\033[34m\]$(workspace_fn)\[\033[36m\]$(__git_ps1)\[\033[0m\] '$'\n$ '
