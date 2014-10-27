#!/usr/bin/env bash

#variables
activatorVersion="1.2.10"
pgVersion="9.3"
pgPass="password"
pgDb="yourdbname"

echo "=========================================="
echo ".....Provision VM START"
echo "=========================================="

#install prerequisits
sudo apt-get update && apt-get install -y curl unzip openjdk-7-jdk
sudo apt-get install -y scala
sudo apt-get install -y postgresql-$pgVersion postgresql-contrib-$pgVersion postgresql-client
sudo apt-get update

#install typesafe activator
echo ""
echo "---> Installing Typesafe Activator <---"
cd /home/vagrant
wget http://downloads.typesafe.com/typesafe-activator/$activatorVersion/typesafe-activator-$activatorVersion-minimal.zip

unzip -d /home/vagrant typesafe-activator-$activatorVersion-minimal.zip
rm typesafe-activator-$activatorVersion-minimal.zip

#add activator to environment variables
echo "export PATH=/home/vagrant/activator-$activatorVersion-minimal:\$PATH" >> ~/.bashrc

#reset bash
source ~/.bashrc

#download dependencies and show activator help - so we don't need to wait later
/home/vagrant/activator-$activatorVersion-minimal/activator help

echo "~~~! Typesafe Activator Complete !~~~"
echo ""
echo "---> Setup PostgreSQL $pgVersion <---"

sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD '$pgPass';"
echo "user: postgres"
echo "pass: $pgPass"

sudo -u postgres createdb $pgDb
sudo -u postgres psql -c "CREATE EXTENSION adminpack;"

echo "~~~! PostgreSQL $pgVersion Complete !~~~"
echo ""

#init and shop activator help
echo "jdk version:"
javac -version
echo ""

echo "=========================================="
echo ".....Provision VM finished"
echo "=========================================="
