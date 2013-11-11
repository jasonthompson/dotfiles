# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jason/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
export TERM='xterm-256color'
path=(/usr/local/sbin /usr/local/bin /usr/bin /usr/bin/core_per ~/bin)

#add aliases to commandline autocomletion
setopt completealiases

#Add packages files to command not found
[ -r /etc/profile.d/cnf.sh ] && . /etc/profile.d/cnf.sh

#create zkbd compatible hash
typeset -A key

key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

#key bindings
[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       up-line-or-history
[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     down-line-or-history
[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-buffer-or-history

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        printf '%s' "${terminfo[smkx]}"
    }
    function zle-line-finish () {
        printf '%s' "${terminfo[rmkx]}"
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi

source ~/.zsh-addons/git-prompt.sh

autoload -U promptinit
promptinit

autoload -U colors && colors
PROMPT="%n@%m %{$fg[red]%}%~%{$reset_color%} $GIT_PROMPT %{$fg[yellow]%}⚡%{$reset_color%} "

export GRACENOTE_CLIENT_ID="866304-041D60B0569FFCEC7A61A11C9AA2ECA7"
export GRACENOTE_USER_ID="259610607523201749-4CD6C170BF8D1B1EFBF53C2B3CCDA8F5"
export GRACENOTE_CLIENT_TAG="041D60B0569FFCEC7A61A11C9AA2ECA7"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

alias copy="xsel -ib"
