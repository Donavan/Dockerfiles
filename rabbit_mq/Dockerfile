FROM ubuntu:trusty
MAINTAINER Donavan Stanley <donavan.stanley@gmail.com>

# Later apt commands will fail without an update first
RUN apt-get update -qqy 


# Install stuff we need temporarily
RUN apt-get install -qqy  wget python-software-properties software-properties-common

# Install RabbitMQ
RUN add-apt-repository "deb http://www.rabbitmq.com/debian/ testing main"
RUN wget -q http://www.rabbitmq.com/rabbitmq-signing-key-public.asc
RUN apt-key add rabbitmq-signing-key-public.asc
RUN apt-get update -qqy 
RUN apt-get install -qqy  rabbitmq-server=3.3.4-1
RUN rabbitmq-plugins enable rabbitmq_management

# Add scripts
ADD run.sh /run.sh
ADD set_rabbitmq_password.sh /set_rabbitmq_password.sh
RUN chmod 755 ./*.sh

# Clean up
RUN rm rabbitmq-signing-key-public.asc
RUN apt-get remove -qqy wget python-software-properties software-properties-common 
RUN apt-get autoremove -qqy
 
EXPOSE 5672 15672
CMD ["/run.sh"]