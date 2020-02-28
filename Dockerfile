#Firefox via RDP
FROM lsiobase/ubuntu-gui:amd64-latest

#########################################
##        ENVIRONMENTAL CONFIG         ##
#########################################
# Set correct environment variables
ENV TERM="xterm" APPNAME="firefox"
ARG DEBIAN_FRONTEND=noninteractive

#########################################
##         INSTALL DEPENDENCIES        ##
#########################################
RUN apt-get update \
&& apt-get -y upgrade \
&& apt-get install -qy --no-install-recommends \
   firefox \
&& apt-get clean -y \
&& apt-get autoremove -y \
&& rm -rf /tmp/* /var/tmp/* \
&& rm -rf /var/lib/apt/lists/*

COPY root /
