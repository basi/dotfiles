# viのエイリアス設定
alias vi='/usr/bin/vim'

# MacVimの設定
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

# プロンプトの設定
PS1='[\u \W]\$ '

# lsのカラー設定
#export LSCOLORS=exfxcxdxbxegedabagacad
alias ls='ls -G'

alias hg='history | grep'
alias gadd='git add'
alias gci='git commit -a'
alias gpush='git push -u origin master'

export SVN_EDITOR="vi"
