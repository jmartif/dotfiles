
function git-diff-meld() (
  git difftool --dir-diff --tool=meld "${1:-HEAD~}" "${2:-HEAD}"
)

function list-image-tags() {
  aws ecr --region=us-east-1 --profile=tm-prod-ReadOnly-Techops list-images --repository-name "$@" | jq -r '.imageIds[].imageTag' | grep -v null | sort
}
