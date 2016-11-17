FROM debian:jessie
MAINTAINER Derek Vance <dvance@cerb-tech.com>

ENV APP_USER=web
ENV APP_PATH=/opt/PowerDNS-Admin

RUN useradd -s /bin/bash -d $APP_PATH -M $APP_USER

RUN apt-get update && \
    apt-get install -y sudo curl git python libpython2.7 python-dev libsasl2-dev \
        build-essential libmysqlclient18 libmysqlclient-dev libssl-dev \
        libldap2-dev && \
    curl https://bootstrap.pypa.io/get-pip.py | python 

RUN git clone https://github.com/ngoduykhanh/PowerDNS-Admin.git $APP_PATH

VOLUME $APP_PATH
WORKDIR $APP_PATH

COPY setup.py $APP_PATH
RUN chmod +x $APP_PATH/setup.py

RUN python setup.py
RUN pip install -r requirements.txt

RUN chown -R $APP_USER:$APP_USER $APP_PATH

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

RUN ls -lah $APP_PATH

USER $APP_USER
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 9393

CMD ["./run.py"]
