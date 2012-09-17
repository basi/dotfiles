if [ -x /usr/bin/uname ] || [ -x /bin/uname ]; then
    case "$(uname)" in
    Darwin*) source /Users/basi/Sites/git/dotfiles/bashrc_mac ;;
    Linux*)  source /home/user/git/dotfiles/bashrc_linux ;;
    *) echo "unknown";;
    esac
fi

if [ -f ~/.bashrc ] ; then
    . ~/.bashrc
fi

PATH=$PATH:$HOME/bin

if [ -x /usr/bin/uname ] || [ -x /bin/uname ]; then
    case "$(uname)" in
    Linux*) export PATH ;;
    *) echo "unknown";;
    esac
fi
