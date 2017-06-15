FROM ubuntu:17.04
MAINTAINER RazzDazz
# Using instructions from
# https://help.ubnt.com/hc/en-us/articles/220066768-UniFi-How-to-Install-Update-via-APT-on-Debian-or-Ubuntu

RUN apt-get update
RUN apt-get upgrade

# Add the GPG keys for Ubiquiti
apt-key adv --keyserver keyserver.ubuntu.com --recv 06E85760C0A52C50
