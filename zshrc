function get_git_branch(){
  echo "$(git symbolic-ref --short -q HEAD)"
}
function gpo(){
  git push origin "$(get_git_branch)"
}
function gpof(){
  git push --force-with-lease origin "$(get_git_branch)"
}
function gl(){
  git pull origin "$(get_git_branch)"
}
function ggbd(){
  branch="$(get_git_branch)"
  git checkout master
  git branch -d "$branch"
}
function ggbD(){
  branch="$(get_git_branch)"
  git checkout master
  git branch -D "$branch"
}
export EDITOR=nvim
hash -d v=~/.config/nvim
hash -d z=~/.zshrc
alias v=nvim
alias vz="nvim ~/.zshrc"
alias vv="nvim ~/.config/nvim/init.vim"
alias djr="python manage.py runserver"
alias djmm="python manage.py makemigrations"
alias djm="python manage.py migrate"
alias djs="python manage.py show_urls"
alias dj="python manage.py"
alias f="flask"
alias fr="flask run"
alias p="python"
alias pp="python2.7"
alias pt="pytest"
alias ptns="pytest -m 'not(selenium)'"
alias pv="pipenv"
alias pvs="pipenv shell"
alias pvi="pipenv install"
alias pvid="pipenv install --dev"
alias pvl="pipenv lock"
alias pi="pip"
alias pii="pip install"
alias pif="pip freeze"
alias nrd="npm run dev"
alias ns="npm start"
alias yrd="npm run dev"
alias ys="yarn start"
alias ni="npm install"
alias yi="yarn" 
alias y="yarn"
alias n="npm"
alias c="clear"
