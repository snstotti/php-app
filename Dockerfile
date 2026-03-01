# Используем официальный образ PHP с FPM
FROM php:8.2-fpm

# Устанавливаем расширения для работы с MySQL
RUN docker-php-ext-install pdo pdo_mysql \
    && pecl install redis \
    && docker-php-ext-enable redis

# создаем системного пользователя для запуска команд PHP
RUN useradd -G www-data,root -u 1000 -d /home/dev dev
RUN mkdir -p /home/dev/.composer && \
    chown -R dev:dev /home/dev

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /var/www/html

# переключаемся на юзера
USER dev

# Копируем наш файл в контейнер
COPY index.php .

# Указываем, что контейнер будет слушать 9000 порт
EXPOSE 9000
