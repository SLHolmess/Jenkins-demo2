FROM python:3-alpine

WORKDIR /app

RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
  && tar xzvf docker-17.04.0-ce.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker-17.04.0-ce.tgz
RUN echo "Flask==1.1.1" > requirements.txt
RUN pip install -r requirements.txt
COPY bar.py .

EXPOSE 5000

CMD ["python", "bar.py"]
