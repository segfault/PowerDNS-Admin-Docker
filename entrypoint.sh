#!/bin/sh

set -e

cd $APP_PATH && python create_db.py

# Start PowerDNS Admin
exec "$@"
