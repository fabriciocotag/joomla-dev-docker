build:
	@if [ ! -d "./app" ]; then \
		echo "Insira os arquivos do Joomla na pasta ./app"; \
		echo " "; \
		echo "O arquivo configuration.php deverá conter essas configurações de banco:"; \
		echo "Usuário: root"; \
		echo "Senha: examplepass"; \
		echo "Host: mysql"; \
		echo "Database: db"; \
		echo " "; \
		mkdir ./app; \
	else \
		if [ ! -f "./app/configuration.php" ]; then \
			echo " "; \
			echo "Insira os arquivos do Joomla na pasta ./app"; \
			echo " "; \
			echo "O arquivo configuration.php deverá conter essas configurações de banco:"; \
			echo "Usuário: root"; \
			echo "Senha: examplepass"; \
			echo "Host: mysql"; \
			echo "Database: db"; \
			echo " "; \
		else \
			echo " "; \
			echo "O arquivo configuration.php deverá conter essas configurações de banco:"; \
			echo "Usuário: root"; \
			echo "Senha: examplepass"; \
			echo "Host: mysql"; \
			echo "Database: db"; \
			echo " "; \
		fi \
	fi
	@if [ ! -d "./database" ]; then \
		echo " "; \
		echo "Insira o backup do banco na pasta ./database com o nome de database.sql"; \
		echo "Caso ocorra um erro de duplicatas, há um comando chamado: make fix-duplicates"; \
		mkdir ./database; \
		echo " "; \
	fi
	docker-compose build

start:
	docker-compose up -d

stop:
	docker-compose stop

restart:
	docker-compose restart

shell-php:
	docker exec -it exemplo-codigo-php-php-1 /bin/bash

shell-mysql:
	docker exec -it exemplo-codigo-php-mysql-1 /bin/bash

fix-duplicates:
	@echo "Corrigindo duplicatas no arquivo ./database/database.sql"
	sed -i 's/INSERT INTO/INSERT IGNORE INTO/g' ./database/database.sql

upload-database:
	@echo "Subindo banco de dados, digite a senha: examplepass"
	docker exec -i exemplo-codigo-php-mysql-1 mysql -u root -pexamplepass -e "create database if not exists db;use db;source /var/www/database/database.sql;show databases;"
