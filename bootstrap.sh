#!/bin/bash

set -e

# This script is originally borrowed from https://github.com/dpree/jenkins-box/blob/e3bafb4/bootstrap.sh
# Copyright (c) 2013 Jens Bissinger
# MIT LICENSE

echo ""
echo "Checking dependencies for vagrant-jenkins!"
echo ""

echo -n "[CHECK] vagrant: "
VAGRANT_BIN=$(which vagrant)
if [[ -z $VAGRANT_BIN ]]; then
  echo "not installed"
  echo "=> FAIL"
  echo "please install vagrant first"
  echo "Get it here http://www.vagrantup.com"
  exit 1
fi
if [[ "$VAGRANT_BIN" =~ 'gem' ]];  then
  echo "vagrant gem found"
  echo "=> FAIL"
  echo "vagrant must be installed from package"
  echo "Get it here http://www.vagrantup.com"
  exit 1
fi
echo $(vagrant -v)
echo '=> OK'

echo ""
echo "Installing ruby dependencies using bundler"
gem install bundler --no-ri --no-rdoc
bundle install

echo ""
echo "Installing cookbooks using berkshelf"
bundle exec berks install

echo ""
echo "Installing necessary vagrant plugins"
vagrant plugin install vagrant-berkshelf
vagrant plugin install vagrant-omnibus

echo ""
echo "If no errors try running 'vagrant up'"
echo ""
