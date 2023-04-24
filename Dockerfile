# Указывает Docker использовать официальный образ python 3 с dockerhub в качестве базового образа
FROM python:3.8
# Устанавливает переменную окружения, которая гарантирует, что вывод из python будет отправлен прямо в терминал без предварительной буферизации
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
# Устанавливает рабочий каталог контейнера — "app"
WORKDIR /app
# Запускает команду pip install для всех библиотек, перечисленных в requirements.txt
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 8000

# Копирует все файлы из нашего локального проекта в контейнер для автоперезагрузки изменений
COPY . .

CMD ["daphne", "test_django_channels.asgi:application", "-b", "testdjangochannels-1997pom.b4a.run", "-p", "8000"]