#!/bin/bash
printf "---------------"
printf "This script is potentially dangerous! \nIt WILL destroy data and make said data unrecoverable! \n \n"
printf "Please choose disk to sanitize.\nBe mindful of which disk the OS is written to! \n"
printf "---------------"
lsblk
read -p "Enter the disk name *EXACTLY* as shown in the chart above: " disktokill

while true; do
read -p "You selected $disktokill. Is this correct? (y/n)" yn
    case $yn in
        [Yy]* ) sudo dd if=/dev/zero of=/dev/$disktokill bs=64K status=progress ;
               break;;
        [Nn]* ) printf "Aborting sanitization!\n" ;
                break;;
        * ) printf "Please answer yes or no." ;
    esac
done
