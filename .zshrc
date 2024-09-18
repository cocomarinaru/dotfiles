 export LANG=en_US.UTF-8

 [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

function fnvim() {
 fzf "$@" | xargs -o  -r nvim
}

function fzed() {
 fzf "$@" | xargs -o  -r zed
}

function switch-py2() {
  rm ~/google-cloud-sdk
  ln -s ~/google-cloud-sdk-py2 ~/google-cloud-sdk
}

function switch-py3() {
  rm ~/google-cloud-sdk
  ln -s ~/google-cloud-sdk-py3 ~/google-cloud-sdk
}

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

alias startapp="dev_appserver.py --port=8090 --host="0.0.0.0"  --enable_host_checking=false app.yaml"
alias gitmaster='git pull origin master;git submodule update --init --recursive; git submodule foreach git pull origin master;'
alias gitmastersubmodules='git submodule update --init --recursive; git submodule foreach git pull origin master;'
export PATH="/opt/homebrew/opt/jpeg/bin:$PATH"

# git aliasses
alias sw="git switch"
alias cb="git checkout"
alias gs="git status"
alias gp="git pull"
alias gpu="git push"
alias gpuf="git push --force-with-lease"
alias gup="git push --set-upstream origin"
alias cbm="git checkout master && git pull"
alias gca="git commit -am"
alias gc="git commit -m"
alias cbb="git checkout -b"
alias gsu="git submodule update"
alias gol="git log --oneline"
alias gold="git log --pretty=format:\"%C(auto)%h -%ad-%d %an - %s\" --decorate --color=auto --date=short"

# cd aliasses
alias fr="cd ~/work/airconsole-appengine/airconsole-platform-frontend"
alias core="cd ~/work/airconsole-appengine/airconsole-platform-core"
alias ae="cd /Users/ovidiu/work/airconsole-appengine"
alias store="cd /Users/ovidiu/work/airconsole-store-v3"
alias mig="cd /Users/ovidiu/migration/airconsole-appengine"
alias news="cd /Users/ovidiu/work/airconsole-news"

alias vrc="nvim ~/.zshrc"
alias so="source ~/.zshrc"
alias gtail="gcloud app logs tail -s default"
alias lg="lazygit"
alias vim="nvim"
alias fzv="fzf "$@" | xargs -o  -r nvim"

alias ls="eza --icons"
alias ll="eza -l --group-directories-first --icons"
alias la="eza -la --group-directories-first --icons"

alias cd="z"

#used by migration run dev app server
# pyenv shell 3.9 2.7

export ANDROID_HOME=/Users/ovidiu/Library/Android/sdk
export ANDROID_SDK_ROOT=/Users/ovidiu/Library/Android/sdk
export JAVA_HOME=/Users/ovidiu/.sdkman/candidates/java/17.0.11-tem
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export PATH="$PATH:$ANDROID_HOME/build-tools"
export PATH="$PATH:$ANDROID_HOME/emulator"


alias devpy2="/Users/ovidiu/google-cloud-sdk-py2/bin/dev_appserver.py --port=8090 --host=0.0.0.0 --automatic_restart=yes --enable_host_checking=false --storage_path=/Users/ovidiu/datastore-py2  app.yaml"

alias startpy2="/Users/ovidiu/google-cloud-sdk-py2/bin/dev_appserver.py --port=8090 --host=0.0.0.0 --automatic_restart=yes --enable_host_checking=false --storage_path=/Users/ovidiu/datastore-py2 "

export XDG_CONFIG_HOME=$HOME/.config

# export FZF_DEFAULT_OPTS=" \
# --color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
# --color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
# --color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"
export PATH="$HOME/google-cloud-sdk/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ovidiu/migration/dev-setup/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ovidiu/migration/dev-setup/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ovidiu/migration/dev-setup/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ovidiu/migration/dev-setup/google-cloud-sdk/completion.zsh.inc'; fi

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(starship init zsh)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
#### end

eval "$(zoxide init zsh)"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
