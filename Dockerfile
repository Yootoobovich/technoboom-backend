# Используем официальный образ Python
FROM python:3.9-slim

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем все файлы в рабочую директорию
COPY . /app

# Устанавливаем зависимости
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Запускаем сервер через gunicorn
CMD ["gunicorn", "backend.wsgi", "--bind", "0.0.0.0:$PORT"]
