if [ -n "$TMUX" ]; then 
    export TERM="xterm"; 
fi

export VISUAL=vim
export EDITOR="$VISUAL"


git-diff-meld() (
  git difftool --dir-diff --tool=meld "${1:-HEAD~}" "${2:-HEAD}"
)

function list-image-tags() {
    aws ecr --region=us-east-1 --profile=tm-prod-ReadOnly-Techops list-images --repository-name "$@" | jq -r '.imageIds[].imageTag' | grep -v null | sort
}

[[ -s "~/.bash_functions" ]] && source "~/.bash_functions"
[[ -s "~/.local_bash_profile" ]] && source "~/.local_bash_profile"

. ~/.local/lib/z/z.sh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR=~/.sdkman
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
