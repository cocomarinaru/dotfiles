
export PATH="$HOME/.local/bin:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"

export EDITOR=nvim
export VISUAL=nvim

alias vrc="nvim ~/.zshrc"
alias so="source ~/.zshrc"

alias ls="eza --icons "
alias ll="eza -l --group-directories-first --icons --git-ignore "
alias lla="eza -la --group-directories-first --git --icons "
alias llg="eza -l --group-directories-first --git --icons "

#git aliasses
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
alias lg="lazygit"

alias fzv="fzf "$@" | xargs -o  -r nvim"
alias n="nvim"

#fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

#zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(starship init zsh)"
eval "$(zoxide init zsh --cmd cd)"
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
