FROM ubuntu:14.04
MAINTAINER Jeff Hohenstein <jeffrey.hohenstein@gmail.com>
LABEL "com.saltatory.vendor" 		= "Saltatory"
LABEL "com.saltatory.version" 		= "1.0"
LABEL "com.saltatory.description" 	= "R Development with R Studio"
LABEL "com.saltatory.version" 		= "1.0"

# Install desirable OS packages
RUN sudo apt-get update 
RUN sudo apt-get install -y python-software-properties software-properties-common
RUN sudo apt-get -y install htop wget unzip

# Install R and R Studio
RUN sudo apt-get install -y r-base-dev libjpeg62 libedit2 libxslt-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev
RUN cd /tmp && \
	wget http://download1.rstudio.org/rstudio-0.99.447-amd64.deb && \
	sudo dpkg -i rstudio-0.99.447-amd64.deb && \
	rm rstudio-0.99.447-amd64.deb

# Create the R user and group
# Doing this in a way similar to a web server
RUN sudo mkdir /var/lib/R && \
	sudo groupadd R && \
	sudo useradd R -g R -s /bin/nologin -M -b /var/lib/R && \
	chown R /var/lib/R && \
	chmod -R 777 /var/lib/R

# Configure networking and mounts
USER R
VOLUME /var/lib/R
WORKDIR /var/lib/R