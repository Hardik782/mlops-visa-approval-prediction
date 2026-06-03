FROM python:3.10-slim-bullseye
WORKDIR /app

COPY . /app

RUN pip install --no-cache-dir -r requirements-lock.txt

CMD ["python3", "app.py"]