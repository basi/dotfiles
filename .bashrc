# プロンプトの設定
PS1='[\u \W]\$ '

# MacVimの設定
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

# viのエイリアス設定
alias vi='/usr/bin/vim'

# コマンドのエイリアス設定
alias hg='history | grep'
alias gadd='git add'
alias gci='git commit -a'
alias gpush='git push -u origin master'

# コマンドのエクスポート設定
export SVN_EDITOR='vi'
