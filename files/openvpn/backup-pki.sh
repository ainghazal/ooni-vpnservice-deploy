#!/bin/sh
#
# Create a backup of the initial openvpn data volume.
# This should be kept safe, and used to re-create
# the OpenVPN pki
#
OVPN_DATA=ovpn_data
ENDPOINT=openvpn-server1.ooni.io
IMAGE=kylemanna/openvpn
ALPINE=alpine:latest
BACKUP=openvpn-pki.tar.gz

# launch a container with the volume attached
docker run --name=ovpn-cp -d -v $OVPN_DATA:/etc/openvpn alpine:latest
mkdir -p ~/backups
docker cp ovpn-cp:/etc/openvpn ~/backups
tar cvzf ~/backups/$BACKUP ~/backups/openvpn
rm -rf ~/backups/openvpn
docker stop ovpn-cp && docker rm ovpn-cp
echo "PKI Backup in $HOME/backups/$BACKUP"
