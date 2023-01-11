# Базовый image
FROM python:3.9-alpine3.16
# создаём копируем файлы и директории внутрь контейнера
COPY requirements.txt /temp/requirements.txt
COPY app /app
# Назначаем эту директорию корнем
WORKDIR /app
# Порт снружи
EXPOSE 8000
# Устанавливаем зависимости
# Можно обновить pip на всякий случай
RUN pip install --upgrade pip
# Custom cache invalidation
ARG CACHEBUST=1
# Дла работы базы данных будет нужно
RUN apk add postgresql-client build-base postgresql-dev
# Не забыть применить миграции docker-compose run --rm web-app sh -c "python manage.py migrate"
# Сами зависимости из файла
RUN pip install -r /temp/requirements.txt
# Создаём пользователя в контейнере без пароля с именем DDJuser
RUN adduser --disabled-password DDJuser
# Команды в контейнере будут запускаться от имени  DDJuser
USER DDJuser
