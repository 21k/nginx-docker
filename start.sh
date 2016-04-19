#!/bin/bash
pwd=$PASSWORD
echo "root:${pwd}" | chpasswd
service ssh start
service nginx  start
while ((1)); do
sleep 1m
done
