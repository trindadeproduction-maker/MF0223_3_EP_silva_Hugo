#!/bin/bash
yes > /dev/null &
yes > /dev/null &
yes > /dev/null &
cat /dev/zero | head -c 300M > /tmp/mem_test1 &
cat /dev/zero | head -c 300M > /tmp/mem_test2 &
mkdir -p /tmp/test_disk
for i in {1..30}
do
 dd if=/dev/zero of=/tmp/test_disk/file_$i bs=1M count=5
done