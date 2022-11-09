#!/usr/bin/bash

# Add official postgresql repo
echo "Adding official postgresql repo ..."
apt install wget ca-certificates

# add certificate to apt-key management utility and create a new configuration file with an official PostgreSQL repository address inside.
echo "adding certificate to apt-key management utility and creating a new configuration file ..."
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'

# update apt 
echo "Updating apt ..."
apt update

# install postgresql
echo "Installing postgresql ..."
apt install -y postgresql postgresql-contrib
