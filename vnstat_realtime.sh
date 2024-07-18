#!/bin/bash

interface="wlp0s20f3"

vnstat_data=$(vnstat -tr -i "$interface" | tail -n 3)

rx_kbps=$(echo "$vnstat_data" | awk '/rx/ {print $2}')
tx_kbps=$(echo "$vnstat_data" | awk '/tx/ {print $2}')

#rx_mbps=$(echo "scale=2; $rx_kbps / 1000" | bc)
#tx_mbps=$(echo "scale=2; $tx_kbps / 1000" | bc)

#echo "⬇️ $rx_mbps ⬆️ $tx_mbps"
echo "⬇️ $rx_kbps ⬆️ $tx_kbps"
