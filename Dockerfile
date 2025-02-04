FROM python:3-alpine3.9

ARG UID=33
ARG GID=33

RUN <<EOF
apk add --no-cache gphoto2
pip install --no-cache requests

mkdir -p /home/sony
chown -R ${UID}:${GID} /home/sony
EOF

WORKDIR /home/sony
USER ${UID}:${GID}

RUN mkdir .gphoto && mkdir data

ADD gphoto-settings .gphoto/settings
ADD sony-pm-alt.py .

VOLUME /home/sony/data

CMD exec python sony-pm-alt.py

