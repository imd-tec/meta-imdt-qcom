#!/bin/sh

if [ $# -lt 1 ]; then
	exit 0;
fi

if [ $1 == "postinst" ]; then
	update_zip=/data/update_ext4.zip
	if [ -e ${update_zip} ]; then
		echo "Start updating the software using ${update_zip}."
		recovery --update_package=${update_zip}
		rm -f ${update_zip}
		echo "Rebooting."
		reboot 
		exit $?
	fi
	exit 1
fi
exit 0 
