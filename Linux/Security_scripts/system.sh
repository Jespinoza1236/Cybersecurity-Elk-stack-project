#!/bin/bash

# Grouped all the individual tasks into one command.
grep MemTotal /proc/meminfo > ~/backups/freemem/free_mem.txt; du -h > ~/backups/diskuse/disk_usage.txt; lsof | awk '{print $1}' > ~/backups/openlist/open_list.txt; df -h > ~/backups/freedisk/free_disk.txt
