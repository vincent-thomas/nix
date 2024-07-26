if [ -z "$HOME_MNGR_DIR" ]; then
  echo "Error: $HOME_MNGR_DIR is not found" >&2
  exit 1  
fi

cd $HOME_MNGR_DIR
git add .
git commit
home-manager switch --flake .
git push
