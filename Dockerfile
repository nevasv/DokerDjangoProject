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
# Custom cache invalidation
ARG CACHEBUST=1
RUN pip install --upgrade pip
RUN pip install -r /temp/requirements.txt
# Создаём пользователя без пароля с именем DDJuser
RUN adduser --disabled-password DDJuser
# Команды в контейнере будут запускаться от имени  DDJuser
USER DDJuser
