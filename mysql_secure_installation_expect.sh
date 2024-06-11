#!/usr/bin/expect -f

# Iniciar o serviço MySQL
spawn service mysql start

# Esperar até que o MySQL esteja disponível
expect {
    "Starting MariaDB database server" { sleep 10 }
}

# Executar mysql_secure_installation
spawn mysql_secure_installation

# Responder às perguntas interativas
expect "Enter current password for root (enter for none):"
send "\r"
expect "Set root password? \[Y/n\]"
send "Y\r"
expect "New password:"
send "yourpassword\r"
expect "Re-enter new password:"
send "yourpassword\r"
expect "Remove anonymous users? \[Y/n\]"
send "Y\r"
expect "Disallow root login remotely? \[Y/n\]"
send "Y\r"
expect "Remove test database and access to it? \[Y/n\]"
send "Y\r"
expect "Reload privilege tables now? \[Y/n\]"
send "Y\r"

# Esperar até o final da execução do comando
expect eof
