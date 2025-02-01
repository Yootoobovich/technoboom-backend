FROM python:3.9-slim

# Устанавливаем необходимые зависимости, ВКЛЮЧАЯ GCC
RUN apt-get update && apt-get install -y \
    pkg-config \
    libmariadb-dev \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Копируем requirements.txt *перед* его использованием,
# чтобы использовать кэширование слоев Docker
COPY . /app

# Устанавливаем зависимости Python
RUN pip install -v --no-cache-dir -r /app/requirements.txt

# Устанавливаем npm (ОБЯЗАТЕЛЬНО!)
RUN apt-get update && \
    apt-get install -y --no-install-recommends npm && \
    rm -rf /var/lib/apt/lists/*

# Оставшиеся инструкции вашего Dockerfile...
