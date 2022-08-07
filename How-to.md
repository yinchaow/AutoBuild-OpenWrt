# VPS

``` shell
# First time
cd lede
sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default
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

Add the following codes to /.github/workflows/Build_OP_x86_64.yml

``` shell
echo "src-git kenzo https://github.com/kenzok8/openwrt-packages" >> ./feeds.conf.default
echo "src-git small https://github.com/kenzok8/small" >> ./feeds.conf.default
```

Copy content of diffconfig to x86_64.config

# ESXi

``` shell
vmkfstools -i openwrt-x86-64-generic-squashfs-rootfs.vmdk openwrt.vmdk
```
