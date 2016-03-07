FROM debian:jessie



ENV DEBIAN_FRONTEND noninteractive
ENV ZSH_DEP_PACKAGE  "software-properties-common build-essential"
RUN apt-get update && apt-get install -y $ZSH_DEP_PACKAGE
RUN apt-get install -y zsh git
RUN git clone git://github.com/robbyrussell/oh-my-zsh.git /root/.oh-my-zsh \
    && chsh -s /bin/zsh


RUN apt-get install -y vim curl wget curl lsof sudo
RUN mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
RUN git clone https://github.com/atyenoria/vim-pathogen.git ~/.vim.tmp && \
    ln -sf ~/.vim.tmp/autoload/pathogen.vim ~/.vim/autoload/pathogen.vim && \
    git clone https://github.com/atyenoria/nerdcommenter.git ~/.vim/bundle/nerdcommenter && \
    git clone https://github.com/atyenoria/delimitMate.git ~/.vim/bundle/delimitMate && \
    git clone https://github.com/atyenoria/PDV--phpDocumentor-for-Vim.git ~/.vim/bundle/phpDocumentor && \
    git clone https://github.com/atyenoria/vim-colorschemes.git ~/.vim/bundle/colorschemes && \
    git clone https://github.com/atyenoria/vim-misc.git ~/.vim/bundle/vim-misc && \
    git clone https://github.com/atyenoria/vim-colorscheme-switcher.git ~/.vim/bundle/colorscheme-switcher
ADD .vimrc /root/.vimrc



RUN EXT_PACKAGES="cron man git mysql-client jq dnsutils unzip zip s3cmd" && \
    apt-get update && \
    apt-get -y install $EXT_PACKAGES




#backup user setting
RUN useradd laravel -d /laravel
RUN mkdir -p /laravel/.ssh
RUN chmod 700 /laravel/.ssh
RUN ln -sf /usr/share/zoneinfo/Japan /etc/localtime
