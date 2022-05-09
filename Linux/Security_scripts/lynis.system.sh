#!/bin/bash

# Run a full system audit and save results in '/tmp/lynis.system_scan.log'
lynis audit system > /tmp/lynis.system_scan.log
