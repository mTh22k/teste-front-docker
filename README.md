# 💚 GUIA DE INSTALAÇÃO DO PROJETO BASE WEB COM DOCKER (em construção) 💚
<br/>
<br/>

## 1. 💻 Instalação do Docker (testado apenas no mint ate agora)

### 1.1. 🛠 Atualize o índice de pacotes:
    
    sudo apt update
    
### 1.2. 🛠 Instale os pacotes necessários para permitir que o apt utilize um repositório sobre HTTPS:

    sudo apt install apt-transport-https ca-certificates curl software-properties-common
    
### 1.3. 🛠 Baixe e importe a chave GPG oficial do Docker:

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    
### 1.4. 🛠 Adicione o repositório do Docker às fontes do apt:

    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

### 1.5. 🛠 Atualize o índice de pacotes novamente:

    sudo apt update
    
### 1.6. 🛠 Finalmente, instale o Docker

    sudo apt install docker-ce
    
### 1.7. 🛠 Para verificar se o Docker foi instalado corretamente, você pode executar:

    sudo docker --version
    
<br/>
<br/>

## 2. 💻 Preparando o container
    
### 2.1. 🛠 Clonar o repo com o dockerfile e os scripts

    git clone git@github.com:mTh22k/teste-front-docker.git
    
### 2.2. 🛠 Entrar na pasta

    cd teste-front-docker
    
### 2.3. 🛠 Crie a imagem do docker com as dependencias do projeto

    sudo docker build -t teste-front-docker .
    
### 2.4. 🛠 Crie o container com a imagem criada

    sudo docker run -it -p 8000:8000 -p 9000:9000 -p 3000:3000 teste-front-docker
    
<br/>
<br/>
    
## 3. 💻 Preparando o ambiente de desenvolvimento

### 3.1. 🛠 Clone o projeto, e entre no mariab (vou testar com a nostrosole)

    git clone https://github.com/ecomp-co/nostrosole.git;
    cd nostrosole;
    git checkout develop;
    cd back-end;
    service mysql start;
    mariadb
    
### 3.2 🛠 Dentro do maria db agora 

    create database nostrosole;
    create user 'user1'@localhost identified by '123mudar';
    grant all privileges on nostrosole.* to 'user1'@localhost;
    flush privileges;
    exit
    
### 3.3 🛠 Copie o .env e edite ele

    cp .env.example .env
    vi .env

### 3.4 🛠 Mude as linhas do codigo com sua database, usuario e senha para essas

    DB_DATABASE=nostrosole
    DB_USERNAME=user1
    DB_PASSWORD=123mudar

### 3.5. 🛠 Agora volte para a pasta html, e rode o script para rodar o projeto

    cd ../../
    ./start_services.sh 

<br/>
<br/>

## 4. 💻 Acesse seu localhost 3000 no navegador e seu back estara rodando em localhost 8000, pronto para você usar 🥰

![image](https://hackmd.io/_uploads/Sy97z2iVA.png)

<br/>
<br/>

## 5. 💻 Como usar os containers: 

### 5.1. 🛠 De você não parar a execução do seu container e simplesmente saiu dele ou desligou o pc, para voltar nele, que ainda esta ativo, basta rodar os comandos

    sudo docker ps
    
#### 5.1.1 🔗 Para descobrir o id do seu container e logo após

    sudo docker exec -it <ID_do_Contêiner> /bin/bash
    
#### 5.1.2 🔗 Para entrar nele e poder rodar o script novamente.

### 5.2. 🛠 Se você parar seu container para ele não ocupar mais as portas 8k e 3k com docker stop <id_do_container> e quer entrar nelen basta rodar esses comandos :


    sudo docker ps -a
    
#### 5.2.1 🔗 Para descobrir o id do seu container e logo após :

    docker start <ID_do_Contêiner>

#### 5.2.2 🔗 Para iniciar o container que tinha sido parado anteriormente e depois :

    sudo docker exec -it <ID_do_Contêiner> /bin/bash
    
#### 5.2.3 🔗 Para entrar nele e poder rodar o script novamente.

<br/>
<br/>

## 6. 💻 Comandos uteis para mexer no docker

### 6.1. 🛠 Docker build 

#### 6.1.1 🔗 Este comando é usado para construir uma imagem Docker a partir de um Dockerfile.
    
    docker build -t nome-da-imagem .
    
### 6.2. 🛠 Docker run

#### 6.2.1 🔗 Este comando é usado para executar um contêiner Docker a partir de uma imagem.

    docker run -it nome-da-imagem

### 6.3. 🛠 Docker ps

#### 6.3.1 🔗 Este comando é usado para listar os contêineres Docker em execução.

    docker ps

### 6.4. 🛠 Docker ps -a

#### 6.4.1 🔗 Este comando é usado para listar todos os contêineres Docker, incluindo os que estão parados.
    
     docker ps -a
     
### 6.5. 🛠 Docker stop

#### 6.5.1 🔗 Este comando é usado para parar um contêiner Docker em execução (o id pode ser visto com o docker ps e ps -a).

    docker stop <id_do_container>
    
### 6.6. 🛠 Docker start

#### 6.6.1 🔗 Este comando é usado para iniciar um contêiner Docker parado.
     
     docker start <id_do_container>
     
### 6.7. 🛠 Docker rm

#### 6.7.1 🔗 Este comando é usado para remover um contêiner Docker.

    docker rm <id_do_container>
    
### 6.8. 🛠 Docker rmi

#### 6.8.1 🔗 Este comando é usado para remover uma imagem Docker.
     
     docker rmi <nome_da_imagem>
     
<br/>
<br/>
  
## 7. 💻 Integração com o VSCode

Caso você ainda não tenha o Visual Studio Code em sua máquina, é possível obtê-lo a partir da sua [página de download](https://code.visualstudio.com/download). Se já o tiver, basta acompanhar o restante dos passos!

### 7.1 🛠 Instalar as extensões "Docker" e "Dev Containers"

#### 7.1.1 🔗 Vá para a aba de extensões (ou pressione `Ctrl+Shift+X`)

#### 7.1.2 🔗 Procure por [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker) e instale a extensão

#### 7.1.3 🔗 Faça o mesmo com a extensão [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

### 7.2 🛠 Iniciar o container

#### 7.2.1 🔗 No menu lateral do VSCode, clique no ícone do Docker

#### 7.2.2 🔗 Na aba "Containers", você verá o container criado anteriormente

#### 7.2.3 🔗 Caso ele esteja "desligado", clique com o botão direito do mouse sobre ele e escolha a opção **"Start"**:

![Iniciando o container pelo VSCode](https://i.imgur.com/OcGnkWA.png)

### 7.3 🛠 Abrir o projeto dentro do container

#### 7.3.1 🔗 No menu lateral do Docker, clique em "Remote Explorer"

#### 7.3.2 🔗 Em "Dev Container", você encontrará o nosso container

#### 7.3.3 🔗 Passe o mouse sobre o container e clique no botão "Attach in New Window":

![Abrindo o container do projeto em uma nova janela](https://i.imgur.com/uxRrOsT.png)

#### 7.3.4 🔗 Possivelmente, nenhum projeto estará aberto, então clique no ícone de "Explorer" e no botão "New Folder"

#### 7.3.5 🔗 Na barra de pesquisa, digite o caminho da pasta do projeto. Exemplo:

```
/var/www/html/nostrosole
```
    
#### 7.3.6 🔗 Clique em "Ok" para abri-lo

<br/>
<br/>

###### by Marquesini e Andrieli 💚 #quaqua
