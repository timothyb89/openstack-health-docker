#!/bin/bash
set -e
set -x

if [ -d openstack-health ]; then
    echo "--> Using existing copy of stackviz-deployer"
else
    echo "--> Checking out fresh copy of openstack-health"
    git clone https://github.com/openstack/openstack-health
    pushd openstack-health
    npm install
    popd
fi

echo "--> Running 'gulp build' on openstack-health"
pushd openstack-health
gulp prod
popd

echo "--> Building docker image: $1"

sudo docker build -t $1 .
