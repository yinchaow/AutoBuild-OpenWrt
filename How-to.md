# VPS

``` shell
# First time
cd lede
echo "src-git kenzo https://github.com/kenzok8/openwrt-packages" >> ./feeds.conf.default
echo "src-git small https://github.com/kenzok8/small" >> ./feeds.conf.default
echo "src-git cdnspeedtest https://github.com/immortalwrt-collections/openwrt-cdnspeedtest.git" >> ./feeds.conf.default
echo "src-git cloudflarespeedtest https://github.com/mingxiaoyu/luci-app-cloudflarespeedtest.git" >> ./feeds.conf.default
echo "src-git netspeedtest https://github.com/sirpdboy/NetSpeedTest.git" >> ./feeds.conf.default
git pull
./scripts/feeds update -a
./scripts/feeds install -a
make menuconfig
```

``` shell
# Second time and on
cd lede
git pull
./scripts/feeds update -a
./scripts/feeds install -a
# make defconfig
rm -rf ./tmp
# rm -f .config
make menuconfig
```

``` shell
./scripts/diffconfig.sh > diffconfig
```

# GitHub

## Build_OP_x86_64.yml

Add the following codes to /.github/workflows/Build_OP_x86_64.yml

``` shell
echo "src-git kenzo https://github.com/kenzok8/openwrt-packages" >> ./feeds.conf.default
echo "src-git small https://github.com/kenzok8/small" >> ./feeds.conf.default
echo "src-git cdnspeedtest https://github.com/immortalwrt-collections/openwrt-cdnspeedtest.git" >> ./feeds.conf.default
echo "src-git cloudflarespeedtest https://github.com/mingxiaoyu/luci-app-cloudflarespeedtest.git" >> ./feeds.conf.default
echo "src-git netspeedtest https://github.com/sirpdboy/NetSpeedTest.git" >> ./feeds.conf.default
```

``` shell
echo 'CONFIG_PACKAGE_luci-i18n-cloudflarespeedtest-zh-cn=y' >> .config
echo 'CONFIG_PACKAGE_luci-i18n-cloudflarespeedtest-zh_Hans=y' >> .config
```

## x86_64.config

Copy content of diffconfig to x86_64.config

## customize.sh

### hostname
``` shell
sed -i '$ised -i '"'"'s/OpenWrt/WYC/g'"'"' /etc/config/system' openwrt/package/lean/default-settings/files/zzz-default-settings
```

### gateway, broadcast, dns
``` shell
sed -i '$ised -i \x27$i\\ \\ \\ \\ \\ \\ \\ \\ option gateway \\x27192.168.7.2\\x27\x27 /etc/config/network' openwrt/package/lean/default-settings/files/zzz-default-settings
#sed -i '$i\ \ \ \ \ \ \ \ option gateway \x27192.168.7.2\x27' /etc/config/network
#        option gateway '192.168.7.2'
sed -i '$ised -i \x27$i\\ \\ \\ \\ \\ \\ \\ \\ option broadcast \\x27192.168.7.255\\x27\x27 /etc/config/network' openwrt/package/lean/default-settings/files/zzz-default-settings
#sed -i '$i\ \ \ \ \ \ \ \ option broadcast \x27192.168.7.255\x27' /etc/config/network
#        option broadcast '192.168.7.255'
sed -i '$ised -i \x27$i\\ \\ \\ \\ \\ \\ \\ \\ option dns \\x27223.6.6.6\\ 223.5.5.5\\ 119.29.29.29\\ 114.114.114.114\\x27\x27 /etc/config/network' openwrt/package/lean/default-settings/files/zzz-default-settings
#sed -i '$i\ \ \ \ \ \ \ \ option dns \x27223.6.6.6\ 223.5.5.5\ 119.29.29.29\ 114.114.114.114\x27' /etc/config/network
#        option dns '223.6.6.6 223.5.5.5 119.29.29.29 114.114.114.114'
```

# ESXi

``` shell
vmkfstools -i openwrt-x86-64-generic-squashfs-rootfs.vmdk OpenWrt.vmdk
```
