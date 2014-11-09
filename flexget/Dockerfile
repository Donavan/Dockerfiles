FROM gfjardim/transmission
MAINTAINER jdonavan <donavan.stanley@gmail.com>

RUN apt-get update
RUN apt-get install -y python-pip
RUN pip install flexget
RUN pip install flexget[webui]
