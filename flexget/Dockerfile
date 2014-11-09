FROM gfjardim/transmission
MAINTAINER jdonavan <donavan.stanley@gmail.com>

VOLUME /config

ADD sources.list /etc/apt/
RUN apt-get update -qq && \
    apt-get install -qq --force-yes python git python-transmissionrpc && \
    apt-get autoremove && \
    apt-get autoclean

RUN git clone https://github.com/Flexget/Flexget.git /opt/flexget
RUN apt-get update
RUN apt-get install -y python-pip


RUN ln -sf /config /root/.flexget

WORKDIR /opt/flexget
RUN python bootstrap.py
RUN bin/pip install -r jenkins-requirements.txt
RUN bin/pip install -r rtd-requirements.txt

# Add flexget to runit
#RUN mkdir /etc/service/flexget
#ADD flexget.sh /etc/service/flexget/run
#RUN chmod +x /etc/service/flexget/run

# Add flexget-webui to runit
RUN mkdir /etc/service/flexget-webui
ADD flexget-webui.sh /etc/service/flexget-webui/run
RUN chmod +x /etc/service/flexget-webui/run
