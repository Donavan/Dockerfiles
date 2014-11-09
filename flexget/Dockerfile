FROM gfjardim/transmission
MAINTAINER jdonavan <donavan.stanley@gmail.com>
RUN ln -sf /config/.flexget /root/.flexget
ADD transmission.sh /etc/service/transmission/run
RUN chmod +x /etc/service/transmission/run
RUN apt-get update
RUN apt-get install -y python-pip
RUN pip install flexget
RUN pip install flexget[webui]
