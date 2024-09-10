
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
function shell { # Convenience method for quickly installing a binary
  if [ -z "$1" ]; then
    echo "Binary not provided"
    return 1
  fi
  nix shell nixpkgs#$1
}

function dev { # Convenience method for quickly creating a flake
  if [ -z "$1" ]; then
    echo "No template specified"
    return 1
  fi

  TEMPLATE=$1
  SHA="fbb24917839d62463505176d3bdaba86419243c9"

  nix \
    --experimental-features 'nix-command flakes' \
    flake init \
    --template \
    "github:lalilul3lo/dev/${SHA}#${TEMPLATE}"

  local function template_replace() {
      echo -n "Enter the replacement (e.g., baouncer): "
      read REPLACEMENT

      # Check if inputs are empty
      if [ -z "$REPLACEMENT" ]; then
          echo "Invalid input. Both target and replacement are required."
          return 1
      fi

      # Format the inputs
      local TARGET="{{%= $TEMPLATE =%}}"

      # Loop through each file in the current directory
      for file in *; do
          # Skip directories
          if [ -f "$file" ]; then
              # Replace the target template string with the replacement value
              sed -i '' "s/$TARGET/$REPLACEMENT/g" "$file"
          fi
      done

      echo "Replacement complete."
  }

  template_replace

  direnv allow
}

