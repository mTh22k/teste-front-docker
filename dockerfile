# Use uma imagem base do Ubuntu 20.04
FROM ubuntu:20.04

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
    mariadb-client

# Instalar o Node Version Manager (NVM)
# Instalação do nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash \
    && export NVM_DIR="$HOME/.nvm" \
    && [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" \
    && [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" \
    && nvm install 16 \
    && nvm use 16

# Instalar Composer
#RUN apt-get install -y composer

# Instalar PHP e extensões necessárias
#RUN apt-get install -y \
#    php-fpm \
#    php7.4-mysql \
#    php7.4-curl \
#    php-xml

# Iniciar o serviço MySQL
#RUN /etc/init.d/mysql start \
#    && mysql_secure_installation

# Definir o diretório de trabalho padrão
WORKDIR /var/www/html

# Comando padrão para iniciar o shell bash
CMD ["bash"]
