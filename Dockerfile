FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y sudo vim && mkdir /root/.config && mkdir /root/.config/nvim

COPY configs /root/.config/nvim/configs
COPY dependencies /root/.config/nvim/dependencies
COPY hints /root/.config/nvim/hints
COPY vim /root/.config/nvim/vim
COPY init.vim install-debian.sh README.md /root/.config/nvim/

WORKDIR /root/.config/nvim

CMD "./install-debian.sh"
