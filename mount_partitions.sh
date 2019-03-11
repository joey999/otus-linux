#!/bin/bash

mkdir -p /raid/part{1,2,3,4,5}
for i in $(seq 1 5)
 do
  mount /dev/md0p$i /raid/part$i
 done

for i in $(seq 1 5)
 do
  echo "UUID=$(blkid | grep /dev/md0p$i | grep -oE '\bUUID=.{38}' | grep -oE '[a-z0-9]{8}(\-[a-z0-9]{4}){3}\-[a-z0-9]{12}') /raid/part$i ext4 defaults 0 0" >> /etc/fstab
 done
exit 0

