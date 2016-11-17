FROM debian:jessie
MAINTAINER Derek Vance <dvance@cerb-tech.com>

VOLUME "/opt/PowerDNS-Admin"

RUN apt-get update
RUN apt-get -y install git python python-pip
