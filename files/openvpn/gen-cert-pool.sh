#!/bin/sh
OVPN_DATA=ovpn_data
NUMCERTS=100

for i in $(seq 1 $NUMCERTS)
do
        docker run -v $OVPN_DATA:/etc/openvpn --rm -it kylemanna/openvpn easyrsa build-client-full client-cert-$(printf "%03d" $i) nopass;
done
