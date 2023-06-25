FROM python:3.10-slim-bullseye

RUN apt-get update --fix-missing && apt-get install -y --fix-missing build-essential

RUN mkdir /chroma

WORKDIR /chroma

COPY ./requirements.txt requirements.txt

RUN pip install --no-cache-dir --upgrade -r requirements.txt

COPY ./bin/docker_entrypoint.sh /docker_entrypoint.sh

COPY ./ /chroma

EXPOSE 8000

CMD ["/docker_entrypoint.sh"]
