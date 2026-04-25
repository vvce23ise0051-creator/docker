FROM python:3.10

WORKDIR /app/myapp1

COPY . .

CMD ["python", "app.py"]