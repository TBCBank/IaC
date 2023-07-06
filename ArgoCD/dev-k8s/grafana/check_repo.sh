REPO_NAME="grafana"

if helm repo list | grep -q "^$REPO_NAME\s"; then
  helm repo remove $REPO_NAME && echo "Repo named $REPO_NAME is removed"
else
  echo "There is no repo named $REPO_NAME"
fi