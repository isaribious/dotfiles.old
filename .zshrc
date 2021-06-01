# .zshrc
#=============================
# Global environment variable
#=============================
export LANG=C
#export LANG=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8
export XDG_CONFIG_HOME=~/.config
export NVIM_PYTHON_LOG_FILE=/tmp
export NVIM_PYTHON_LOG_LEVEL=DEBUG
#export PYTHONPATH=/Applications/Xcode.app/Contents/SharedFrameworks/LLDB.framework/Resources/Python
export GTAGSLABEL=pygments
export GOPATH=~/go
#export GOROOT=/usr/local/go
export GREP_COLOR="1;33"
export RIPGREP_CONFIG_PATH=~/.ripgreprc
export FZF_DEFAULT_COMMAND='rg --hidden -l ""'
export FZF_DEFAULT_OPTS="--height 50% --layout=reverse --border --inline-info --preview 'head -100 {}'"
#export FZF_DEFAULT_OPTS="--height 50% --layout=reverse --border"

#PATH= .:$PATH
#PATH=/usr/local/go/bin:$PATH
PATH=$GOPATH/bin:$PATH
export PATH
#set path=($path /usr/local/bin /opt/local/bin /opt/local/sbin ~/bin)

#=============================
# Global alias
#=============================
#alias ls='ls -GFv'
alias ls='ls -Fv'
alias la='ls -a'
alias ll='ls -l'
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'
alias dirs='dirs -v'
alias md='mkdir'
alias grep='grep --color=auto'
alias vi='nvim'
alias py='python3'
alias h='history'
alias tree='tree -nF --charset=C'
alias color='echo; for c in {000..255}; do echo -n "\e[38;5;${c}m $c" ; [ $(($c%16)) -eq 15 ] && echo;done;echo;'

#alias x='xterm -geometry 100x30'
#alias ag='ag --nocolor' 
#alias s="cd $GOPATH/src" 
#alias d="cd $GOPATH/src/devel" 
#alias nw='/Applications/nwjs.app/Contents/MacOS/nwjs'

#=============================
# Prompt
#=============================
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    SESSION_TYPE=ssh
else
    SESSION_TYPE=local
fi

myprompt(){
    # Set prompt and iTerm2 tab and window titles. Label is truncated
    # cwd or name of running process. Hostname is indicated for remote
    # sessions.
    # %m is $HOST, \e]1 sets the window titlebar, \e]2 sets the tab
    if [ $SESSION_TYPE = "local" ]; then
        # sets the title to cwd
        precmd () { print -Pn "\e]1;%~\a" ; print -Pn "\e]2;%n@%m %~\a" }
        # sets title to running process
        preexec () { print -Pn "\e]1;$1\a" ; print -Pn "\e]2;%n@%m %~ : $1\a" }
        # set prompt
        PROMPT='
%B%F{144}%n@%m%f %F{246}(%*) %~%f%b
%(!.#.>) '
    else
        # sets the title to cwd
        precmd () { print -Pn "\e]1;%m%~\a" ; print -Pn "\e]2;%~\a" }
        # sets title to running process
        preexec () { print -Pn "\e]1;%m$1\a" ; print -Pn "\e]2;%~[$1]\a" }
        # set prompt
        PROMPT='
%B%F{254}%n@%m%f %F{246}(%*) %~%f%b
%(!.#.>) '
    fi
}
myprompt

# git ブランチ名を色付きで表示させるメソッド
function rprompt-git-current-branch {
  local branch_name st branch_status

  local green="156"
  local red="210"
  local yellow="222"
  local blue="038"
 
  if [ ! -e  ".git" ]; then
    # git 管理されていないディレクトリは何も返さない
    return
  fi
  branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    # 全て commit されてクリーンな状態
    branch_status="%F{${green}}"
  elif [[ -n `echo "$st" | grep "^Untracked files"` ]]; then
    # git 管理されていないファイルがある状態
    branch_status="%F{${red}}?"
  elif [[ -n `echo "$st" | grep "^Changes not staged for commit"` ]]; then
    # git add されていないファイルがある状態
    branch_status="%F{${red}}+"
  elif [[ -n `echo "$st" | grep "^Changes to be committed"` ]]; then
    # git commit されていないファイルがある状態
    branch_status="%F{${yellow}}!"
  elif [[ -n `echo "$st" | grep "^rebase in progress"` ]]; then
    # コンフリクトが起こった状態
    echo "%F{${red}}!(no branch)"
    return
  else
    # 上記以外の状態の場合
    branch_status="%F{${blue}}"
  fi
  # ブランチ名を色付きで表示する
  echo "${branch_status}[$branch_name]"
}
 
# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst
 
# プロンプトの右側にメソッドの結果を表示させる
RPROMPT='`rprompt-git-current-branch`'

#=============================
# History
#=============================
export HISTFILE=~/.histfile
export HISTSIZE=1000
export SAVEHIST=1000

#=============================
# Completion
#=============================
autoload -Uz compinit
compinit -u -d ~/.cache/zsh/zcompdump-$ZSH_VERSION
zstyle ':completion:*:default' menu select=3

#=============================
# Keybind
#=============================
#bindkey -r '^W' # backward-kill-word

#bindkey '^B' backward-delete-char
#bindkey '^W^D' backward-kill-word
#bindkey '^W^B' backward-word
#bindkey '^W^F' forward-word
bindkey '^B' backward-word
bindkey '^F' forward-word
bindkey '^Y' kill-word
bindkey '^G' kill-line 
bindkey '^O' reverse-menu-complete

#=============================
# Misc
#=============================
# Prevent auto-logout by Ctrl+D
setopt IGNOREEOF

# Auto 'pushd' command
setopt auto_pushd

# User file-creation mask
umask 027

# Fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
