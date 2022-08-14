#!/bin/bash
printf "This script is potentially dangerous! \n It WILL destroy data and make said data unrecoverable! \n \n"
printf "Please choose disk to sanitize.\nBe mindful of which disk the OS is written to! \n"
lsblk
read -p "Enter the disk name as shown in the chart above: " disktokill
printf "You entered $disktokill. Is this the correct disk? \n:"
