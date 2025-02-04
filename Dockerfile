FROM python:3-alpine3.9

RUN addgroup --gid=33 sony && adduser --uid=33 -h /home/sony -g '' -G sony -D sony && \
        apk add --no-cache gphoto2 && \
        pip install --no-cache requests

WORKDIR /home/sony
USER sony

RUN mkdir .gphoto && mkdir data

ADD gphoto-settings .gphoto/settings
ADD sony-pm-alt.py .

VOLUME /home/sony/data

CMD exec python sony-pm-alt.py

