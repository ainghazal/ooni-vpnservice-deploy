#!/bin/sh
OVPN_DATA=ovpn_data
ENDPOINT=openvpn-server1.ooni.io
IMAGE=kylemanna/openvpn

#
# This script will fail if the volume is already initialized!
#
# generate configuration boilerplate. udp:// does not matter because we'll override the config file
docker run -v $OVPN_DATA:/etc/openvpn --rm $IMAGE ovpn_genconfig -u udp://$ENDPOINT
# generate the password-less PKI
docker run -v $OVPN_DATA:/etc/openvpn --rm -i $IMAGE ovpn_initpki nopass  < /home/vpnadmin/files/openvpn/input
