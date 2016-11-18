#!/bin/sh

set -e

if [ -f $APP_PATH/config.py ];
then
  python $APP_PATH/setup.py
  pip install -r $APP_PATH/requirements.txt
fi

cd $APP_PATH && python create_db.py

# Start PowerDNS Admin
exec "$@"
