#!/usr/bin/env bash

sudo bash -c 'printf "p *(char*)(void(*)())AudioDeviceDuck=0xc3\nq" | lldb -n avconferenced'
