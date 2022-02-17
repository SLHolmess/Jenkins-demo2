FROM python:3-alpine

WORKDIR /app

ENV DOCKERVERSION=18.06.1-ce
RUN curl -fsSLO https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKERVERSION}.tgz \
  && tar xzvf docker-${DOCKERVERSION}.tgz --strip 1 \
                 -C /usr/local/bin docker/docker \
  && rm docker-${DOCKERVERSION}.tgz
RUN echo "Flask==1.1.1" > requirements.txt
RUN pip install -r requirements.txt
COPY bar.py .

EXPOSE 5000

CMD ["python", "bar.py"]
