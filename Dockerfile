# Указывает Docker использовать официальный образ python 3 с dockerhub в качестве базового образа
FROM python:3.8
# Устанавливает переменную окружения, которая гарантирует, что вывод из python будет отправлен прямо в терминал без предварительной буферизации
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
# Устанавливает рабочий каталог контейнера — "app"
WORKDIR /app
# Запускает команду pip install для всех библиотек, перечисленных в requirements.txt
COPY requirements.txt requirements.txt
RUN apt update &&  \
    apt install redis-server -y  && \
#    apt install net-tools -y && \
    pip install --no-cache-dir -r requirements.txt
EXPOSE 8080

# Копирует все файлы из нашего локального проекта в контейнер для автоперезагрузки изменений
COPY . .

CMD ["/bin/bash","-c","./startup.sh"]

#  docker run -p 8080:8080 -it $(docker build -q .)