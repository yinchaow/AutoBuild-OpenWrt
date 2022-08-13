#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: eSirPlayground
# Youtube Channel: https://goo.gl/fvkdwm 
#=================================================
#1. Modify default IP
sed -i 's/192.168.1.1/192.168.7.6/g' openwrt/package/base-files/files/bin/config_generate

#2. Clear the login password
sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' openwrt/package/lean/default-settings/files/zzz-default-settings

#3. Add luci-app-poweroff
git clone https://github.com/esirplayground/luci-app-poweroff.git openwrt/package/luci-app-poweroff

#4. Add CloudflareSpeedtest's language
#echo 'CONFIG_PACKAGE_luci-i18n-cloudflarespeedtest-zh-cn=y' >> openwrt/.config
#echo 'CONFIG_PACKAGE_luci-i18n-cloudflarespeedtest-zh_Hans=y' >> openwrt/.config

#5. Modify hostname
sed -i '$ised -i '"'"'s/OpenWrt/WYC/g'"'"' /etc/config/system' openwrt/package/lean/default-settings/files/zzz-default-settings

#6. 
#sed -i '$ised -i \x27$i\\ \\ \\ \\ \\ \\ \\ \\ option gateway \\x27192.168.7.2\\x27\x27 /etc/config/network' openwrt/package/lean/default-settings/files/zzz-default-settings
#sed -i '$ised -i \x27$i\\ \\ \\ \\ \\ \\ \\ \\ option broadcast \\x27192.168.7.255\\x27\x27 /etc/config/network' openwrt/package/lean/default-settings/files/zzz-default-settings
#sed -i '$ised -i \x27$i\\ \\ \\ \\ \\ \\ \\ \\ option dns \\x27223.6.6.6\\ 223.5.5.5\\ 119.29.29.29\\ 114.114.114.114\\x27\x27 /etc/config/network' openwrt/package/lean/default-settings/files/zzz-default-settings
sed -i '$ised -i \x27$i\\ \\ \\ \\ \\ \\ \\ \\ option gateway '"'"'"'"'192.168.7.2'"'"'"'"'\x27 /etc/config/network' openwrt/package/lean/default-settings/files/zzz-default-settings
sed -i '$ised -i \x27$i\\ \\ \\ \\ \\ \\ \\ \\ option broadcast '"'"'"'"'192.168.7.255'"'"'"'"'\x27 /etc/config/network' openwrt/package/lean/default-settings/files/zzz-default-settings
sed -i '$ised -i \x27$i\\ \\ \\ \\ \\ \\ \\ \\ option dns '"'"'"'"'223.6.6.6\\ 223.5.5.5\\ 119.29.29.29\\ 114.114.114.114'"'"'"'"'\x27 /etc/config/network' openwrt/package/lean/default-settings/files/zzz-default-settings

#7. Disable dhcp
#sed -i '$ised -i \x27s\/option\\ start\\ \\x27100\\x27\/option\\ ignore\\ \\x271\\x27\/g\x27 /etc/config/dhcp' openwrt/package/lean/default-settings/files/zzz-default-settings
sed -i '$ised -i \x27\/start\/ignore\/g\x27\ /etc/config/dhcp' openwrt/package/lean/default-settings/files/zzz-default-settings
sed -i '$ised -i \x27\/100\/1\/g\x27\ /etc/config/dhcp' openwrt/package/lean/default-settings/files/zzz-default-settings
sed -i '$ised -i \x27\/limit\/d\x27\ /etc/config/dhcp' openwrt/package/lean/default-settings/files/zzz-default-settings
sed -i '$ised -i \x27\/leasetime\/d\x27\ /etc/config/dhcp' openwrt/package/lean/default-settings/files/zzz-default-settings

# Replace with JerryKuKu’s Argon
#rm openwrt/package/lean/luci-theme-argon -rf
