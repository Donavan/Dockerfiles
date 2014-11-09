FROM gfjardim/transmission
MAINTAINER jdonavan <donavan.stanley@gmail.com>

# Replace the transmission startup script from gfjardim.
ADD transmission.sh /etc/service/transmission/run
RUN chmod +x /etc/service/transmission/run

# Replace the config script from gfjardim.
ADD config.sh /etc/my_init.d/config.sh
RUN chmod +x /etc/my_init.d/config.sh

# Add pip so we can use it to install later
RUN apt-get update
RUN apt-get install -y python-pip

# Upgrade six since the version python-six installs is too old
RUN pip install six --upgrade

# Map the flexget config to our volume.
RUN ln -sf /config/.flexget /root/.flexget

# Install flexget 
RUN pip install flexget
RUN pip install flexget[webui]

# Volume for long-term storage
VOLUME ["/content"]