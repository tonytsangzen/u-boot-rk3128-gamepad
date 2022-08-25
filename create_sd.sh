DISK_PART=`ls /dev/disk2s*`
echo ${DISK_PART}

function umount(){
	for part in $*
	do
		sudo diskutil umount ${part}
	done
}

sleep 1
umount ${DISK_PART} 
sleep 1
sudo sudo dd if=idbloader.img of=/dev/disk2 seek=64 bs=512
sync

sleep 1
umount ${DISK_PART} 
sleep 1
sudo sudo dd if=uboot.img of=/dev/disk2 seek=16384 bs=512
sync

#sleep 1
#umount ${DISK_PART} 
#sleep 1
#sudo sudo dd if=trust.img of=/dev/disk2 seek=24576 bs=512
#sync


umount ${DISK_PART} 
