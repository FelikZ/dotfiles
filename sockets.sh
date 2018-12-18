#!/bin/bash

sysctl -w net.ipv4.tcp_keepalive_time=600
sysctl -w net.ipv4.tcp_tw_reuse=1
# sysctl -w net.ipv4.tcp_tw_recycle=1
sysctl -w "net.ipv4.ip_local_port_range=1025 61000"

# Investigate
# net.core.somaxconn = 128
# net.ipv4.tcp_max_syn_backlog = 512
