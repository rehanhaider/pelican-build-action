FROM python:3.9-slim

LABEL "com.github.actions.name"="Deploy Pelican Site to Firebase"
LABEL "com.github.actions.description"="Deploy Pelican Site to Firebase"
LABEL "com.github.actions.icon"="mic"
LABEL "com.github.actions.color"="yellow"

LABEL "repository"="https://github.com/justgoodin/pelican-to-firebase"
LABEL "homepage"="https://github.com/justgoodin/pelican-to-firebase"

ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN apt-get update \
    && apt-get install --no-install-recommends -qy git curl bash

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
