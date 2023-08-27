#!/bin/sh

echo "%{T1}%{F#e5e5e5} %{u-}%{T6}$(/usr/sbin/ifconfig eth0 | grep "inet " | awk '{print $2}')"
