# Created by newuser for 5.0.5
export LANG=ja_JP.UTF-8
 
## 重複パスを登録しない
typeset -U path cdpath fpath manpath

### sudo用のpathを設定
typeset -xT SUDO_PATH sudo_path
typeset -U sudo_path
sudo_path=({/usr/local,/usr,}/sbin(N-/))

### pathを設定
path=(~/bin(N-/) /usr/local/bin(N-/) ${path})
path=(/Applications/MacVim.app/Contents/MacOS ${path})

# zsh-completionsに収納されている補完情報を有効にする 
fpath=(/usr/local/share/zsh-completions $fpath)

########################################
# 補完
# 補完機能を有効にする
autoload -Uz compinit
compinit
 
# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
 
# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..
 
# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
 
# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'
 
########################################
# vcs_info
 
#autoload -Uz vcs_info
#zstyle ':vcs_info:*' formats '(%s)-[%b]'
#zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
#precmd () {
#    psvar=()
#    LANG=en_US.UTF-8 vcs_info
#    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
#}
#RPROMPT="%1(v|%F{green}%1v%f|)"
 
##################################
 
# チェンジディレクトリを簡単にする
# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups
# ディレクトリ名だけでcdする
setopt auto_cd
 
# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups
# 同時に起動したzshの間でヒストリを共有する
setopt share_history
# ヒストリファイルに保存するとき、すでに重複したコマンドがあったら古い方を削除する
setopt hist_save_nodups
# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space
# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks
# 補完候補が複数あるときに自動的に一覧表示する
setopt auto_menu
# 高機能なワイルドカード展開を使用する
setopt extended_glob
 
 
# 日本語ファイル名を表示可能にする
setopt print_eight_bit
 
# フローコントロールを無効にする
setopt no_flow_control
 
# '#' 以降をコメントとして扱う
setopt interactive_comments
 
# 色を使用出来るようにする
autoload -Uz colors
colors
 
# プロンプト
# 1行表示
# PROMPT="%~ %# "
# 2行表示
# PROMPT="%{${fg[red]}%}[%n@%m]%{${reset_color}%} %~
#%# "
local p_rhst=""
if [[ -n "${REMOTEHOST}${SSH_CONNECTION}" ]]; then
	local rhost=`who am i|sed 's/.*(\(.*\)).*/\1/'`
	rhost=${rhost#localhost:}
	rhost=${rhost%%.*}
	p_rhst="%B%F{yellow}($rhost)%f%b"
fi
local p_cdir="%B%F{blue}[%~]%f%b"$'\n'
local p_info="%n@%m${WINDOW:+"[$WINDOW]"}"
local p_mark="%B%(?,%F{green},%F{red})%(!,#,>)%f%b"
PROMPT=" $p_cdir$p_rhst$p_info $p_mark "
 
# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

# alias
alias wi="~/work/tool/iterm2Transparency.sh 0.0"
export TERM=xterm-color
alias ls='ls -G'
alias ll='ls -hl'
#vi ファイル名 で使用
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
#vi ファイル名 で使用。デフォルトのvimrcを読み込ませたくない場合
#alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim -u $HOME/.vimrc "$@"'
