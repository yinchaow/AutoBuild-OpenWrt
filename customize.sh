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
echo 'CONFIG_PACKAGE_luci-i18n-cloudflarespeedtest-zh_Hans=y' >> openwrt/.config

# Replace with JerryKuKu’s Argon
#rm openwrt/package/lean/luci-theme-argon -rf
