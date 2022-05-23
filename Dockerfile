# Python and Linux Version
FROM python:3.10.0a1-alpine3.12
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN mkdir /code

COPY . /code/

WORKDIR /code
# Configure server
# RUN apk add -u gcc musl-dev

RUN set -ex \
    && pip install --upgrade pip \  
    && pip install --no-cache-dir -r /code/requirements.txt 


EXPOSE 8000
#CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
CMD gunicorn dj_docker.wsgi:application --bind 0.0.0.0:$PORT
