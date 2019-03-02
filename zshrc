function get_git_branch(){
  echo "$(git symbolic-ref --short -q HEAD)"
}
function ggpo(){
  git push origin "$(get_git_branch)"
}
function ggpof(){
  git push --force-with-lease origin "$(get_git_branch)"
}
function ggg(){
  git add --all && git commit --amend --no-edit && git push --force-with-lease origin "$(get_git_branch)"
}
function ggl(){
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
function ggrht(){
  echo "Soft reset of $1 commits"
  for i in {1.."$1"}
  do
    git reset --soft HEAD^
  done
}
function gggo(){
  git reset --hard HEAD@{"$1"}
}
function sshs(){
  cp ~/.zshrc /tmp/.zshrc &&
  echo "\n" >> /tmp/.zshrc &&
  cat ~/.config/nvim/zshrc >> /tmp/.zshrc &&
  echo "\n" >> /tmp/.zshrc &&
  echo "\nalias v=\"nvim -u /tmp/.dimonluk_vimrc || vim -u /tmp/.dimonluk_vimrc || vi -u /tmp/.dimonluk_vimrc\"" >> /tmp/.zshrc &&
  scp /tmp/.zshrc "$1":/tmp/.zshrc &&
  rm /tmp/.zshrc &&
  scp ~/.config/nvim/init.vim "$1":/tmp/.dimonluk_vimrc &&
  ssh -t "$@" "bash --rcfile /tmp/.zshrc ; rm /tmp/.zshrc"
}
function cpr(){
  g++ "$1.cpp" -o "$1.out" && ./"$1.out"
}
function cprd(){
  g++ "$1.cpp" -g -o "$1.out" && gdb "$1.out"
}
function get_build_command(){
  command_=""
  for file in $@
    do
      command_="$command_ $file.cpp"
    done
  echo $command_
}
function cprm(){
  command_="g++$(get_build_command $@) -o $1.out && ./$1.out" 
  zsh -c $command_
}
function cprmd(){
  command_="g++$(get_build_command $@) -g -o $1.out && gdb $1.out" 
  zsh -c $command_
}
function cmake_build_and_make(){
  name=""
  if [ -z "$1" ] && name="main"
  zsh -c "rm -rf build"
  zsh -c "mkdir build"
  current_dir="$(pwd)"
  echo $current_dir
  cd build
  cmake $current_dir && make
  cd "$current_dir"
}
function cmbr(){
  cmake_build_and_make
  ./build/"$name"
}
function cmbrd(){
  cmake_build_and_make
  gdb ./build/"$name"
}
function jbrd(){
  javac "$1.java"
  jdb
}
setopt correct
export EDITOR=nvim
hash -d v=~/.config/nvim
alias v=nvim
alias vz="nvim ~/.config/nvim/zshrc"
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
alias sz="source ~/.zshrc"
