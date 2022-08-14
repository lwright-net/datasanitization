#!/bin/bash
printf "===============\n"
printf "This script is potentially dangerous! \nIt WILL destroy data and make said data unrecoverable! \n"
printf "===============\n"
finddisktokill() {
printf "Please choose disk to sanitize.\nBe mindful of which disk the OS is written to! \n"
lsblk
read -p "Enter the disk name *EXACTLY* as shown in the chart above: " disktokill
}
finddisktokill()

while true; do
read -p "You selected $disktokill. Is this correct? (y/n)" yn
    if [-f "/dev/$disktokill"]; then
     case $yn in
         [Yy]* ) sudo dd if=/dev/zero of=/dev/$disktokill bs=64K status=progress ;
                break;;
         [Nn]* ) printf "Aborting sanitization!\n" ;
                 break;;
         * ) printf "Please answer yes or no." ;
     esac
    else
     printf "$disktokill does not exist in /dev/ \n"
    fi
break;;
done
