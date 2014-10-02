FROM ubuntu
MAINTAINER jmiller@adops.com

RUN sudo apt-get update

RUN apt-get install -y git python

ADD . /hellolib

WORKDIR /hellolib

EXPOSE 9418

CMD git daemon --verbose \
               --export-all \
               --base-path=.git \
               --reuseaddr \
               --strict-paths \
                   .git/
