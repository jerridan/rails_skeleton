#!/bin/bash

POSTGRESQL_HOST=localhost
POSTGRESQL_PORT=15432
POSTGRESQL_USER=jerridan
POSTGRESQL_PASSWORD=swanson
POSTGRESQL_DIR=/etc/postgresql/9.6/main

function run_setup {
  echo "Commencing setup"
  update_system
  install_development_tools
  install_postgresql
  configure_database
  restart_database
  echo "Setup is complete!"
}

function update_system {
  echo "Updating"
  echo "deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main" > /etc/apt/sources.list.d/pgdg.list
  wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
  apt-get -y update >/dev/null 2>&1
}

function install_development_tools {
  echo "Installing development tools"
  apt-get -y install build-essential openssl libssl-dev libqt4-dev libcurl3 libcurl3-gnutls libcurl4-openssl-dev imagemagick xvfb git
}

function install_postgresql {
  echo "Installing postgresql"
  apt-get -y install postgresql-9.6 postgresql-contrib-9.6 libpq-dev
}

function configure_database {
  echo "Configuring database"
  sudo -u postgres psql -c "CREATE USER $POSTGRESQL_USER WITH PASSWORD '$POSTGRESQL_PASSWORD' CREATEDB CREATEUSER;" >/dev/null 2>&1 &&\
  echo "listen_addresses = '*'" >> $POSTGRESQL_DIR/postgresql.conf
  perl -p -i -e "s/= 5432/= $POSTGRESQL_PORT/g" $POSTGRESQL_DIR/postgresql.conf
  echo -e "host\tall\tall\t0.0.0.0/0\tmd5" >> $POSTGRESQL_DIR/pg_hba.conf
}

function restart_database {
  echo "Restarting database"
  /etc/init.d/postgresql restart
}

run_setup