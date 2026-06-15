FROM python:3.11-slim-buster
WORKDIR /app
COPY . /app

RUN apt update -y && apt install awscli -y

RUN pip install -r requirements.txt

EXPOSE 5000

CMD ["sh", "-c", "gunicorn -b 0.0.0.0:${PORT:-5000} application:app"]