# GENERIC
draw_line() {
  echo "----------------------------------------------------------------------------------------------------"
}


# ZSH setup
setup_zsh() {
  update_apt
  install_zsh
  change_shell_to_zsh
  fetch_oh_my_zsh
  link_zsh_shortcuts
}

update_apt() {
  echo "UPDATING PACKAGES"
  draw_line
  sudo apt-get update
}

install_zsh() {
  echo "INSTALLING ZSH"
  draw_line
  sudo apt-get install -y zsh
}

change_shell_to_zsh() {
  echo "CHANGIN SHELL TO ZSH"
  draw_line
  chsh -s /bin/zsh
}

fetch_oh_my_zsh() {
  echo "FETCHING OH MY ZSH"
  draw_line
  verify_curl
  verify_git
  yes | sh -c "yes | $(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

verify_curl() {
  echo "VERIFYING CURL INSTALLATION"
  draw_line
  sudo apt-get install -y curl
}

verify_git() {
  echo "VERIFYING GIT INSTALLATION "
  draw_line
  sudo apt-get install -y git
}



link_zsh_shortcuts() {
  echo "LINKING SHORTCUTS FOR ZSH"
  draw_line
  echo "source ~/.config/nvim/configs/.zshrc" >> ~/.zshrc
}


#PYENV SETUP
setup_pyenv() {
  install_pyenv_dependencies
  clone_pyenv
  configure_environment
  init_pyenv
  reload_shell
  install_python3_8
}

install_pyenv_dependencies() {
  sudo apt install -y build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget bzip2 sqlite3
}

clone_pyenv() {
  echo "CLONING PYENV"
  draw_line
  git clone https://github.com/pyenv/pyenv.git ~/.pyenv
}

configure_environment() {
  echo "CONFIGURING ENV FOR PYENV"
  draw_line
  echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
  echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
}

init_pyenv() {
  echo "INITIALIZNG PYENV"
  draw_line
  echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc
}

reload_shell() {
  source ~/.zshrc
}

install_python3_8() {
  echo "INSTALLING PYTHON 3.8"
  draw_line
  pyenv install 3.8.1
  pyenv global 3.8.1
}


# NEOVIM SETUP
setup_neovim() {
  verify_fuse
  download_nvim_appimage
  make_nvim_executable
  moving_nvim_to_bin
  install_nodejs
  install_vim_plug
  install_vim_plugins
  install_coc_addons
}

verify_fuse() {
  echo "VERIFYING FUSE"
  draw_line
  sudo apt-get install -y fuse
  configure_pylintrc
}

download_nvim_appimage() {
  echo "DOWNLOADING NEOVIM"
  draw_line
  curl -L https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage --output nvim
}

make_nvim_executable() {
  echo "MAKING NEOVIM EXECUTABLE"
  draw_line
  sudo chmod a+x nvim
}


moving_nvim_to_bin() {
  echo "MOVING NVIM TO /USR/BIN"
  draw_line
  sudo mv nvim /usr/bin/nvim
}

install_nodejs() {
  echo "INSTALLING NODEJS AND NPM"
  draw_line
  sudo curl -sL https://deb.nodesource.com/setup_13.x | bash -
  sudo apt-get install -y nodejs npm
}

install_vim_plug() {
  echo "INSTALLING VIM PLUG"
  draw_line
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

install_vim_plugins() {
  echo "INSTALLING VIM PLUGINS"
  draw_line
  nvim -c 'PlugInstall | qa'
}

install_coc_addons() {
  echo "INSTALLING COC ADDONS"
  draw_line
  nvim -c 'CocInstall coc-yank | CocInstall coc-vimlsp | CocInstall coc-syntax | CocInstall coc-python | qa'
}

configure_pylintrc() {
  echo "LINKING PYLINTRC"
  draw_line
  ln -s ~/.config/nvim/configs/.pylintrc ~/.pylintrc
}


# KITTY SETUP
setup_kitty() {
  install_kitty
  make_kitty_executable
  link_kitty_to_bin
  configure_kitty
}

install_kitty() {
  echo "INSTALLING KITTY"
  draw_line
  sudo apt-get install -y libfontconfig
  sudo curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sudo sh /dev/stdin
}

make_kitty_executable() {
  echo "MAKING KITTY EXECUTBALE"
  draw_line
  sudo chmod a+x ~/.local/kitty.app/bin/kitty
}

link_kitty_to_bin() {
  echo "LINKING KITTY TO /USR/BIN"
  draw_line
  sudo ln -s ~/.local/kitty.app/bin/kitty /usr/bin
}

configure_kitty() {
  echo "CONFIGURING KITTY"
  draw_line
  rm -rf ~/.config/kitty
  mkdir ~/.config/kitty
  ln -s ~/.config/nvim/configs/kitty.conf ~/.config/kitty/kitty.conf
}


# i3 SETUP
setup_i3() {
  install_i3
  configure_i3
}

install_i3() {
  echo "INSTALLING i3"
  draw_line
  sudo apt-get install -y i3
}

configure_i3() {
  echo "CONFIGURING i3"
  draw_line
  rm -rf ~/.config/i3
  mkdir ~/.config/i3
  ln -s ~/.config/nvim/configs/i3config ~/.config/i3/config
  sudo ln -s ~/.config/nvim/configs/100-synaptics.conf /usr/share/X11/xorg.conf.d/100-synaptics.conf
}


# RUN ALL SCRIPTS
setup_zsh
setup_pyenv
setup_neovim
setup_kitty
setup_i3
