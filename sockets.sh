#!/bin/bash

sysctl -w net.ipv4.tcp_keepalive_time=600
sysctl -w net.ipv4.tcp_tw_reuse=1
sysctl -w net.ipv4.tcp_tw_recycle=1
