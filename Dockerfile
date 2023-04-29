# Указывает Docker использовать официальный образ python 3 с dockerhub в качестве базового образа
FROM python:3.8

# Устанавливает переменную окружения, которая гарантирует, что вывод из python будет отправлен прямо в терминал без предварительной буферизации
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Устанавливает рабочий каталог контейнера — "app"
WORKDIR /app

# Запускает команду pip install для всех библиотек, перечисленных в requirements.txt
#COPY supervisor/conf.d/* /etc/supervisor/conf.d/
COPY requirements.txt requirements.txt

RUN pip install --no-cache-dir -r requirements.txt

#RUN apt update &&\
#    apt -y install nginx supervisor redis-server &&\
#    apt -y install net-tools lsof mc &&\
#    pip install --no-cache-dir -r requirements.txt &&\
#    rm -rf /etc/nginx/sites-enabled/default &&\
#    mkdir /run/daphne/

EXPOSE 8000

# Копирует все файлы из нашего локального проекта в контейнер для автоперезагрузки изменений
COPY . .

#CMD ["/usr/bin/supervisord","-n"]

CMD ["uvicorn", "test_django_channels.asgi:application", "--host", "0.0.0.0", "--port", "8000"]

#ENTRYPOINT ["./startup_without_supervisor.sh"]
#CMD ["/bin/bash","-c","./startup_without_supervisor.sh"]
#CMD [uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80]

# docker run -p 8080:80 -it $( docker build  -q . -t test)
# docker build . -t test
# docker run --name test-container -p 8080:80 -it test
# docker rm --force test-container