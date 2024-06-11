# Use uma imagem base do Ubuntu 20.04
FROM ubuntu:20.04

# Definir o fuso horário sem interação do usuário
ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Atualizar e instalar dependências necessárias
RUN apt-get update && apt-get install -y \
    g++ \
    build-essential \
    python3 \
    curl \
    git \
    nano \
    vim \
    mariadb-server \
    mariadb-client \
    expect \
    nodejs \
    npm \
    php \
    php-fpm \
    php7.4-mysql \
    php7.4-curl \
    php-xml

# Instalar o Node Version Manager (NVM)
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash \
    && export NVM_DIR="$HOME/.nvm" \
    && [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" \
    && [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" \
    && nvm install 16 \
    && nvm use 16

# Instalar Composer
RUN apt-get install -y composer

# Copiar o script de inicialização
COPY start_services.sh /var/www/html/start_services.sh
RUN chmod +x /var/www/html/start_services.sh

# Definir o diretório de trabalho padrão
WORKDIR /var/www/html


