
t () { mkdir -p "$(dirname "$1")" && touch "$1" ; }

# Aliases
alias l='ls -lah'
alias oa="open -a"
alias osa="osascript -e"

# Git
alias gcl="git clone"
alias gst="git status"
alias gl="git pull"
alias gp="git push"
alias gd="git diff | mate"
alias gc="git commit -v"
alias gca="git commit -v -a"
alias gb="git branch"
alias gba="git branch -a"
alias gcam="git commit -am"
alias gbb="git branch -b"
alias gcm="git commit -m"
alias gco="git checkout"
alias gclean="git branch --merged master | grep -v '^\*\|  master' | xargs -n 1 git branch -d"
alias gmend="git commit --amend --no-edit"
alias gmendf="git commit --amend --no-edit; git push -f"

# Functions
function dvt {
  if [ -z "$1" ]; then
    echo "No template specified"
    exit 1
  fi

  TEMPLATE=$1

  SHA="225aa6e82f33661e8c495f06814c26780efb709f"

  nix \
    --experimental-features 'nix-command flakes' \
    flake init \
    --template \
    "github:lalilul3lo/dev/${SHA}#${TEMPLATE}"

  direnv allow
}
