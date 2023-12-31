# pull official base image
FROM python:3.12.0b4-alpine3.18

# set work directory
WORKDIR /app

# set environment variables

# prevent python from writing out pyc files
ENV PYTHONDONTWRITEBYTECODE 1

# prevent python from buffering stdin/stdout
ENV PYTHONUNBUFFERED 1

# install psycopg3 dependencies
RUN apk update \
    && apk add postgresql-dev gcc python3-dev musl-dev jpeg-dev zlib-dev

# install python dependencies
COPY requirements.txt /app/requirements.txt
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# copy project
COPY . .

CMD ["/src/docker-entrypoint.sh", "-n"]