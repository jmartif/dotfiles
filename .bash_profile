if [ -n "$TMUX" ]; then 
    export TERM="xterm"; 
fi

export VISUAL=vim
export EDITOR="$VISUAL"

terraformer() {
    docker run --rm -it -v $(pwd):/cfg -v ~/.aws:/.aws tmhub.io/ticketmaster/terraformer:0.11.8 "$@";
}

terraformer_12_15() {
    docker run --rm -it -v $(pwd):/cfg -v ~/.aws:/.aws tmhub.io/ticketmaster/terraformer:0.12.15 "$@";
}

terraformer_11_14() {
    docker run --rm -it -v $(pwd):/cfg -v ~/.aws:/.aws tmhub.io/ticketmaster/terraformer:0.11.14 "$@";
}

terraformer_11_7() {
    docker run --rm -it -v $(pwd):/cfg -v ~/.aws:/.aws tmhub.io/ticketmaster/terraformer:0.11.7 "$@";
}

terraformer_10_8() {
    docker run --rm -it -v $(pwd):/cfg -v ~/.aws:/.aws tmhub.io/ticketmaster/terraformer:0.10.8 "$@";
}

mvn_set_version() {
    mvn versions:set -DnewVersion="$1" versions:commit
}

credtool() {
    docker run -it --rm -v ~/.aws:/root/.aws tmhub.io/cet/credtool:latest "$@"
}

git-diff-meld() (
  git difftool --dir-diff --tool=meld "${1:-HEAD~}" "${2:-HEAD}"
)

function list-image-tags() {
    aws ecr --region=us-east-1 --profile=tm-prod-ReadOnly-Techops list-images --repository-name "$@" | jq -r '.imageIds[].imageTag' | grep -v null | sort
}

#aws-grep() {
#    docker run --rm -it -v $(pwd):/cfg -v ~/.aws:/.aws -e AWS_PROFILE=$1 tmhub.io/ticketmaster/aws-grep "${@:2}"; 
#}

alias aws_login='~/repos/awscreds/awscreds.py'

. ~/.local/lib/z/z.sh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/jaume/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
