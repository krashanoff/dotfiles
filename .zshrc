# l
# basically a stripped-down version of the manjaro
# zshrc to the stuff I actually use

## Options section
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt autocd                                                   # if only directory path is entered, cd there.

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path 
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=2000
WORDCHARS=${WORDCHARS//\/[&.;]}                                 # Don't consider certain characters part of the word

## Keybindings
bindkey -e
bindkey '^[[8~' end-of-line                                     # End key
bindkey '^[[F' end-of-line                                      # End key
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}" end-of-line                       # [End] - Go to end of line
fi
bindkey '^[[2~' overwrite-mode                                  # Insert key
bindkey '^[[3~' delete-char                                     # Delete key
bindkey '^[[C'  forward-char                                    # Right key
bindkey '^[[D'  backward-char                                   # Left key
bindkey '^[[5~' history-beginning-search-backward               # Page up key
bindkey '^[[6~' history-beginning-search-forward                # Page down key

# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word                                     #
bindkey '^[Od' backward-word                                    #
bindkey '^[[1;5D' backward-word                                 #
bindkey '^[[1;5C' forward-word                                  #
bindkey '^H' backward-kill-word                                 # delete previous word with ctrl+backspace
bindkey '^Z' undo                                               # C-z undo last action

# Theming section  
autoload -U compinit colors zcalc
compinit -d
colors

# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-r

## history and highlighting
source $HOME/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source $HOME/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# bind UP and DOWN arrow keys to history substring search
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# aliases
alias ls="exa"            # better ls
alias cat="bat"           # better cat
alias cp="cp -i"          # confirm before overwriting something
alias vim="nvim"

# file associations
alias -s txt=$EDITOR
alias -s md=$EDITOR
alias -s html=$EDITOR
alias -s js=$EDITOR
alias -s c=$EDITOR
alias -s h=$EDITOR
alias -s cpp=$EDITOR
alias -s hpp=$EDITOR
alias -s go=$EDITOR
alias -s mp3=$MEDIA
alias -s mp4=$MEDIA
alias -s mkv=$MEDIA
alias -s m4v=$MEDIA
alias -s jpg=$PHOTO

# firefox alias since I refuse to compile a web browser
alias firefox=firefox-bin

# pip to path
# unnecessary on most systems
export PATH="${PATH}:${HOME}/.local/bin/"

# nvm
export NVM_DIR="${HOME}/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# go
export GOPATH="/data/repos/go"
export PATH="${PATH}:/usr/local/go/bin"
export PATH="${PATH}:${GOPATH}/bin"

# rust
export PATH="${PATH}:${HOME}/.cargo/bin"

# z
eval "$(zoxide init zsh)"

# portage aliases
alias depclean="sudo emerge --depclean -a"
alias ewrs="sudo emerge-webrsync"
alias eudnw="sudo emerge --update --deep --newuse @world"
alias eav="sudo emerge -av"

# pure prompt
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure
