# Використовуємо базовий образ Python
FROM python:3.10-slim

# Встановлюємо робочу директорію
WORKDIR /app

# Встановлюємо залежності для PostgreSQL і загальні системні залежності
RUN apt-get update && apt-get install -y \
    libpq-dev gcc && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Копіюємо файли проєкту
COPY . /app

# Встановлюємо Python-залежності
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Відкриваємо порт
EXPOSE 8000

# Запускаємо FastAPI-додаток
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
