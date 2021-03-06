#!/bin/bash

echo "Installing volsimpleequal dependencies"
echo "unload Loopback module if exists"
sudo rmmod snd_aloop

sudo apt-get update
sudo apt-get -y install libasound2-plugin-equal

echo "Checking if volsimpleequal services exist"
if [ ! -f "/etc/systemd/system/volsimpleequal.service" ];
	then
		echo "file volsimpleequal.service doesn't exist, creating"
		cp /data/plugins/miscellanea/volsimpleequal/volsimpleequal.tar.gz /
		cd /
		sudo tar -xvf volsimpleequal.tar.gz
		rm /volsimpleequal.tar.gz
	else
		echo "volsimpleequalt.service removing to install new version !"
		sudo rm /etc/systemd/system/volsimpleequal.service
		cp /data/plugins/miscellanea/volsimpleequal/volsimpleequal.tar.gz /
		cd /
		sudo tar -xvf volsimpleequal.tar.gz
		rm /volsimpleequal.tar.gz
fi

#required to end the plugin install
echo "plugininstallend"
