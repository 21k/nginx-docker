#!/bin/bash
pwd=$PASSWORD
echo "root:${pwd}" | chpasswd
service shh start
while ((1)); do
sleep 1m
done
