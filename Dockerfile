FROM python:3.11-slim

WORKDIR /app

# تثبيت المكاتب الأساسية
RUN apt-get update && apt-get install -y \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# نسخ الملفات
COPY requirements.txt* ./
RUN pip install --no-cache-dir pyTelegramBotAPI psutil 2>/dev/null || true
RUN if [ -f requirements.txt ]; then pip install --no-cache-dir -r requirements.txt; fi

COPY . .

# تشغيل البوت
CMD ["python", "host2.py"]
