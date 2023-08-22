setupGit() {
	read -p 'Adicione a URL remota do repositório: ' REPO
	echo "$REPO"

	git init && git remote add origin $REPO && git remote -v
}

updateFiles() {
  git add .
  git commit -m 'add files'
  git pull --rebase
  git push -u origin main
}

checkGit() {
  if [ -d '.git' ]; then
    updateFiles
  else
    setupGit
    updateFiles
  fi
}

checkGit
