writezeros() {
printf "\nWriting zeros\n"
sudo dd if=/dev/zero of=/dev/$1 bs=64K status=progress
}

writeones() {
printf "\nWriting ones\n"
tr '\0' '\377' < /dev/zero | sudo dd of=/dev/$1 bs=64K status=progress
}

writerandom() {
printf "\nWriting random data\n"
sudo dd if=/dev/urandom of=/dev/$1 bs=64K status=progress
}

#!/bin/bash
printf "===============\n"
printf "This script is potentially dangerous! \nIt WILL destroy data and make said data unrecoverable! \n"
printf "===============\n"
finddisktokill() {
printf "Please choose disk to sanitize.\nBe mindful of which disk the OS is written to! \n\n"
lsblk
read -p "\nEnter the disk name *EXACTLY* as shown in the chart above: " disktokill
}

finddisktokill

while true; do
    if [ -b "/dev/$disktokill" ]; then
     read -p "You selected $disktokill. Is this correct? (y/n)" yn
     case $yn in
         [Yy]* ) read -p "Are you sure $disktokill is correct? (y/n)" yn2
                 case $yn2 in
                     [Yy]* ) writezeros $disktokill;
                             writeones $disktokill;
                             writerandom $disktokill;
                             printf "\nSanitization completed!\n"
                             break;;
                     * ) printf "\nAborting sanitization!\n";
                          break;;
                 esac
                 break;;
         * ) printf "\nAborting sanitization!\n";
              break;;
     esac
    else
     printf "\n $disktokill does not exist in /dev/ \n"
     finddisktokill
    fi
done
