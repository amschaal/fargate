# Dockerfile

# The first instruction is what image we want to base our container on
# We Use an official Python runtime as a parent image
FROM ubuntu:latest

# Allows docker to cache installed dependencies between builds
COPY requirements.txt requirements.txt

#ARG DEBIAN_FRONTEND=noninteractive

ENV TZ=America/Los_Angeles

RUN apt-get update && \
    apt-get install -y nginx  && \
    apt-get install -y libssl-dev && \
    apt-get install -y python3-pip

RUN pip install --no-cache-dir -r requirements.txt

# Mounts the application code to the image
COPY . code
WORKDIR /code

EXPOSE 8000

# runs the production server
ENTRYPOINT ["python3", "mysite/manage.py"]
CMD ["runserver", "0.0.0.0:80"]
