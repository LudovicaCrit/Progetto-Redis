FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN useradd -m -u 1000 newsuser && chown -R newsuser:newsuser /app
USER newsuser

CMD ["python", "consumer.py"]
