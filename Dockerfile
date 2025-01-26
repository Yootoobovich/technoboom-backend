FROM python:3.9-slim

# Устанавливаем необходимые зависимости
RUN apt-get update && apt-get install -y \
    pkg-config \
    libmariadb-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip
# Устанавливаем зависимости Python
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r /app/requirements.txt

# Оставшиеся инструкции...
