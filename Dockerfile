FROM ubuntu:17.04
MAINTAINER RazzDazz
# Using instructions from
# https://help.ubnt.com/hc/en-us/articles/220066768-UniFi-How-to-Install-Update-via-APT-on-Debian-or-Ubuntu

ENV REFRESHED_AT 2017-06-20
ENV DEBIAN_FRONTEND noninteractive

# Ports used by unfi controller
# https://help.ubnt.com/hc/en-us/articles/218506997-UniFi-Ports-Used
# port for UAP to inform controller unifi.http.port=8080
EXPOSE 8080
# port for controller GUI / API, as seen in web browser unifi.https.port=8443 
EXPOSE 8443
# port for HTTP portal redirect portal.http.port=8880 
EXPOSE 8880
# port for HTTPS portal redirect portal.https.port=8843 
EXPOSE 8843
# port used for throughput measurement, including UniFi mobile speedtest unifi.throughput.port=6789 
# EXPOSE 6789
#  local-bound port for DB server unifi.db.port=27117
# EXPOSE 27117
# UDP port used for STUN. v4.5.2+ unifi.stun.port=3478 
# EXPOSE 3478
# port 8881 for redirector port for wireless clients (reserved for for device redirector. 
#   No need to open firewall on controller, but avoid using these ports (v3.2.9+ and v4.6.0+))
# EXPOSE 8881
# port 8882 for redirector port for wired clients (reserved for for device redirector. 
#   No need to open firewall on controller, but avoid using these ports (v3.2.9+ and v4.6.0+))
# EXPOSE 8882
# UDP ports 5656-5699 for AP-EDU Broadcasts
# EXPOSE 5656-5699

# Update packages to install dirmngr
RUN apt-get update -yqq
RUN apt-get upgrade -yqq

# Install java 8
RUN apt-get install -yqq openjdk-8-jre-headless

# apt-key needs dirmngr
RUN apt-get install -yqq dirmngr

# Add the GPG keys for Ubiquiti
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv 06E85760C0A52C50

# Add sources for Ubiquiti
RUN echo "deb http://www.ubnt.com/downloads/unifi/debian stable ubiquiti" > /etc/apt/sources.list.d/ubiquiti.list

# Update packages for installation of unifi controller
RUN apt-get update -yqq
RUN apt-get upgrade -yqq

# Install/Upgrade unifi-controller
RUN apt-get install -yqq unifi

# Preparation for publishing directories
# Symlink unifi controller server.log, so only /usr/lib/unifi/logs needs to be published
# Before controller starts server.log und target directory are not created. Do it manually.
RUN mkdir /logs
RUN touch /logs/server.log
RUN mkdir p /usr/lib/unifi/logs/
RUN ln -s /logs/server.log /usr/lib/unifi/logs/server.log
# Publish directories of controller
# VOLUME /usr/lib/unifi/data
# VOLUME /usr/lib/unifi/logs

# Run unifi-controller
CMD java -jar /usr/lib/unifi/lib/ace.jar start
# CMD /etc/init.d/unifi start
