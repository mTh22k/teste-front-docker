## Instalação do Docker

### Linux:

#### Ubuntu:

#### 1. Atualize o índice de pacotes:
   ```bash
    sudo apt update
   ```
#### 1. Instale os pacotes necessários para permitir que o apt utilize um repositório sobre HTTPS:
    sudo apt install apt-transport-https ca-certificates curl software-properties-common
#### 3. Baixe e importe a chave GPG oficial do Docker:
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
#### 4. Adicione o repositório do Docker às fontes do apt:
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

#### 5. Atualize o índice de pacotes novamente:
    sudo apt update
#### 6. Finalmente, instale o Docker
    sudo apt install docker-ce
#### 7. Para verificar se o Docker foi instalado corretamente, você pode executar:
    sudo docker --version
#### 8. Clonar o repo com o dockerfile e os scripts
    git clone git@github.com:mTh22k/teste-front-docker.git
#### 9. Entrar na pasta
    cd teste-front-docker
#### 10. Crie a imagem do docker com as dependencias do front-end
    sudo docker build -t teste-front-docker .
#### 11. Crie o container com a imagem criada
    sudo docker run -it -p 8000:8000 -p 9000:9000 -p 3000:3000 teste-front-docker

#### 12. Clone o projeto, configure o mariadb e mude o .env (vou testar com a nostrosole)
    git clone https://github.com/ecomp-co/nostrosole.git;
    cd nostrosole;
    git checkout develop;
    cd back-end;
    service mysql start;
    mariadb
##### Dentro do maria db agora : 
    create database nostrosole;
    create user 'user1'@localhost identified by '123mudar';
    grant all privileges on nostrosole.* to 'user1'@localhost;
    flush privileges;
    exit
    
##### Copie o .env :
    cp .env.example .env
##### sete a database e o usuario :
    vi .env

##### e mude as linhas do codigo com sua database, usuario e senha :

    DB_DATABASE=nostrosole
    DB_USERNAME=user1
    DB_PASSWORD=123mudar

    
#### 13. agora volte para a pasta html, e rode o script : 
    cd ../../
    ./start_services.sh 

#### 14. Acesse seu localhost 3000 no navegador e seu back estara rodando em localhost 8000 
![image](https://hackmd.io/_uploads/Sy97z2iVA.png)

# como usar: 

### 1. se você não parar a execução do seu container e simplesmente saiu dele ou desligou o pc, para voltar nele, que ainda esta ativo, basta rodar os comandos :

    sudo docker ps
    
#### para descobrir o id do seu container e logo após :

    sudo docker exec -it <ID_do_Contêiner> /bin/bash
    
#### para entrar nele e poder rodar o script novamente.

### 2. se você parar seu container para ele não ocupar mais as portas 8k e 3k com docker stop <id_do_container> e quer entrar nelen basta rodar esses comandos :


    sudo docker ps -a
    
#### para descobrir o id do seu container e logo após :

    docker start <ID_do_Contêiner>

#### para iniciar o container que tinha sido parado anteriormente e depois :

    sudo docker exec -it <ID_do_Contêiner> /bin/bash
    
#### para entrar nele e poder rodar o script novamente.

# Comandos uteis para mexer no docker

### 1. docker build 

#### Este comando é usado para construir uma imagem Docker a partir de um Dockerfile.
    
    docker build -t nome-da-imagem .
    
### 2. docker run

#### Este comando é usado para executar um contêiner Docker a partir de uma imagem.

    docker run -it nome-da-imagem

### 3. docker ps

#### Este comando é usado para listar os contêineres Docker em execução.

    docker ps

### 4. docker ps -a

#### Este comando é usado para listar todos os contêineres Docker, incluindo os que estão parados.
    
     docker ps -a
     
### 5. docker stop

#### Este comando é usado para parar um contêiner Docker em execução (o id pode ser visto com o docker ps e ps -a).

    docker stop <id_do_container>
    
### 6. docker start

#### Este comando é usado para iniciar um contêiner Docker parado.
     
     docker start <id_do_container>
     
### 7. docker rm

#### Este comando é usado para remover um contêiner Docker.

    docker rm <id_do_container>
    
### 8. docker rmi

#### Este comando é usado para remover uma imagem Docker.
     
     docker rmi <nome_da_imagem>
     
# observações

### e o vscode que é a masi complicada vou ver dps tambem, mas ja tenho uma ideia, tudo tem q ser melhorado ainda, é so um 1 rascunho.
