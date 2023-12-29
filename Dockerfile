FROM php:7.4-apache

# Instalação do módulo mysqli
RUN docker-php-ext-install mysqli
RUN a2enmod rewrite

# Definir o proprietário da pasta html para o usuário 'www-data' (ou outro usuário apropriado)
RUN chown -R www-data:www-data /var/www/html

# Definir permissões da pasta html para 777 (não recomendado para ambientes de produção)
RUN chmod -R 777 /var/www/html