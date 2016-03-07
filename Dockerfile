<<<<<<< HEAD
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



ENV EXT_PACKAGES "cron man git mysql-client jq dnsutils unzip zip"
RUN apt-get update && \
    apt-get -y install $EXT_PACKAGES



#backup user setting
RUN useradd laravel -d /laravel
RUN mkdir -p /laravel/.ssh
RUN chmod 700 /laravel/.ssh
RUN ln -sf /usr/share/zoneinfo/Japan /etc/localtime
=======
FROM alpine:3.2

ENV CONSUL_VERSION 0.6.3
ENV CONSUL_SHA256 b0532c61fec4a4f6d130c893fd8954ec007a6ad93effbe283a39224ed237e250

RUN apk --update add curl ca-certificates && \
    curl -Ls https://circle-artifacts.com/gh/andyshinn/alpine-pkg-glibc/6/artifacts/0/home/ubuntu/alpine-pkg-glibc/packages/x86_64/glibc-2.21-r2.apk > /tmp/glibc-2.21-r2.apk && \
    apk add --allow-untrusted /tmp/glibc-2.21-r2.apk && \
    rm -rf /tmp/glibc-2.21-r2.apk /var/cache/apk/*
ADD https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip /tmp/consul.zip
RUN echo "${CONSUL_SHA256}  /tmp/consul.zip" > /tmp/consul.sha256 \
  && sha256sum -c /tmp/consul.sha256 \
  && cd /bin \
  && unzip /tmp/consul.zip \
  && chmod +x /bin/consul \
  && rm /tmp/consul.zip

RUN apk add --update mysql-client && rm -rf /var/cache/apk/*
>>>>>>> a6cb8164c2d0dd15f487926d8f0a503eb96d9be1
