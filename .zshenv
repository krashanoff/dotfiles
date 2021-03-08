export XDG_CONFIG_HOME="${HOME}/.config"
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"

export STARSHIP_CONFIG="${XDG_CONFIG_HOME}/starship/starship.toml"

# go
export GOPATH="/data/repos/go"
export PATH="${PATH}:/usr/local/go/bin"
export PATH="${PATH}:${GOPATH}/bin"

# nvm
export NVM_DIR="${HOME}/.nvm"
[ -s "${NVM_DIR}/nvm.sh" ] && \. "${NVM_DIR}/nvm.sh"

# rust
export PATH="${PATH}:${HOME}/.cargo/bin"

export EDITOR="micro"
export BROWSER="firefox"
