#!/usr/bin/bash

WONDERBOOM2_MAC="EC:81:93:48:83:F6";

bluetooth_connect() {

	echo -n "Connecting";
	while true; do
		echo -n ".";
		# Try to connect to bluetooth device
		bluetoothctl connect $WONDERBOOM2_MAC > /dev/null;
		if [ $? -eq 0 ]; then
			break;
		fi
	done
	echo ""
	echo "Bluetooth connection successful"
}

# Main
echo "Bluetooth autoconnect starting";

while true; do
	if [ $(bluetoothctl info EC:81:93:48:83:F6 | grep "Connected:" | tr -d " \t\n\r") == "Connected:no" ]; then
		bluetooth_connect;
	else
		sleep 1;
	fi
done

exit 0
