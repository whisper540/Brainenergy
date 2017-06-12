FROM debian:latest
RUN apt-get update && apt-get install -y apt-utils && \
 apt-get install -y python3 python3-pip nginx zlib1g-dev libjpeg-dev
COPY requirements.txt /usr/local/
RUN pip3 install -r /usr/local/requirements.txt
CMD uwsgi --http :8001 --chdir /opt/Brainenergy --module Brainenergy.wsgi --static-map=/static=static