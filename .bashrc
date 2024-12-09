
####  ALIASES  ###########

function cd-dir {
    pushd "$@" 2>/dev/null && tree -dL 1 || echo "Directory doesn't exist..."
}

function jump-dir {
    dirs -v
    echo -e "Jump to which directory/line?"
    read input_var
    if [[ $input_var =~ ^-?[0-9]+$ ]]; then
        cd -"$input_var";
    else
        echo "Not a valid line number, staying put."
    fi
}

## File nav
alias ls='ls -G'
alias cd='cd-dir '
alias jd='jump-dir '
alias b='cd -1 > /dev/null'
alias f='cd +0 > /dev/null'
alias ..='cd ..'
alias ...="cd ../.."
alias ....="cd ../../.."
alias pgrep='pgrep -f'
alias pkill='pkill -f'
alias whereami='echo $HOST'
alias cat='ccat'

### Directories
alias drop="cd ~/Dropbox"
alias down="cd ~/Downloads"
alias torrents="cd ~/Downloads/Torrents"
alias dev.d="cd ~/Dev"
alias eth.d="cd ~/Dev/eth"
alias llm.d="cd ~/Dev/llm"
alias near.d="cd ~/Dev/near"
alias zk.d="cd ~/Dev/zk"
alias torrents.d="cd ~/Downloads/Torrents"

### Youtube DL
alias yt-dlp='yt-dlp --cookies-from-browser chrome'
alias yt-dlp2='yt-dlp -o "%(id)s.%(ext)s" --cookies-from-browser chrome'

#### System  ################
alias bashrc="vim ~/.bashrc"
alias bashid="vim ~/.bashID"
alias vimrc="vim ~/.vimrc"
alias zshrc="vim ~/.zshrc"

#### Terminal utilities
alias tree="tree -CQN"
alias safari='open -a safari '
alias dxdiag="sw_vers; system_profiler SPHardwareDataType | head -n 15; echo ""; system_profiler SPDisplaysDataType"
alias ip="curl -s http://checkip.amazonaws.com"

####### GIT
alias gb="git branch"
alias gc="git checkout"
alias gs="git status"
alias gcm='git commit --message'
alias gp='git pull'

###### Python configs
alias ipy="ipython -i --IPSompleter.greedy=True --no-banner"
alias ipy.init="vim ~/.ipython/profile_default/ipython_config.py"

###### alias vim as vim
alias vi='vim'
set editor='/usr/local/bin/vim'
 
