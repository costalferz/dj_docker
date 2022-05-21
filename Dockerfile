FROM python:3.8.10-alpine
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN mkdir /code

COPY . /code/

WORKDIR /code

RUN apk add -u gcc musl-dev
RUN /usr/local/bin/python -m pip install --upgrade pip
RUN pip install -r requirements.txt
RUN python manage.py migrate

EXPOSE 8000
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
#CMD gunicorn dj_docker.wsgi:application --bind 0.0.0.0:8000
