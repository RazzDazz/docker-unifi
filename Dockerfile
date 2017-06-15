FROM ubuntu:17.04
MAINTAINER RazzDazz
# Using instructions from
# https://help.ubnt.com/hc/en-us/articles/220066768-UniFi-How-to-Install-Update-via-APT-on-Debian-or-Ubuntu

ENV DEBIAN_FRONTEND noninteractive

# Update packages to install dirmngr
RUN apt-get update
RUN apt-get upgrade

# Install java 8
RUN apt-get install -y openjdk-8-jre-headless

# apt-key needs dirmngr
RUN apt-get install -y dirmngr

# Add the GPG keys for Ubiquiti
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv 06E85760C0A52C50
# RUN apt-key adv --keyserver keyserver.ubuntu.com --recv C0A52C50

# Add sources for Ubiquiti
RUN echo "deb http://www.ubnt.com/downloads/unifi/debian stable ubiquiti" > /etc/apt/sources.list.d/ubiquiti.list

# Update packages for installation of unifi controller
RUN apt-get update
RUN apt-get upgrade

# Install/Upgrade unifi-controller
RUN apt-get install -y unifi
