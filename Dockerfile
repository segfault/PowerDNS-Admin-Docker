FROM debian:jessie
MAINTAINER Derek Vance <dvance@cerb-tech.com>

VOLUME "/opt/PowerDNS-Admin"
WORKDIR "/opt/PowerDNS-Admin"

RUN apt-get update
RUN apt-get -y install git python python-pip
RUN git clone https://github.com/ngoduykhanh/PowerDNS-Admin.git .
COPY setup.py .

RUN ./setup.py ;\
    pip install -r requirements.txt
