#!/bin/bash

# 1. 彻底清除 LuCI 页面中的广告超链接与引流推广
find package/ -type f \( -name "*.htm" -o -name "*.js" -o -name "*.ut" \) -exec sed -i 's|https://openwrt.ai||g' {} +
find package/ -type f \( -name "*.htm" -o -name "*.js" -o -name "*.ut" \) -exec sed -i 's|openwrt.ai||g' {} +

# 2. 定制后台默认 IP（例如改为 192.168.6.1，避免与光猫 192.168.1.1 冲突）
sed -i 's/192.168.1.1/192.168.6.1/g' package/base-files/files/bin/config_generation

# 3. 修改主机名
sed -i 's/OpenWrt/Redmi-AX6000/g' package/base-files/files/bin/config_generation

# 4. 清理 banner 中的外链推广
echo "Custom Pure Firmware for Redmi AX6000" > package/base-files/files/etc/banner

# 添加 PassWall 2 及其依赖 packages 源码源
echo 'src-git passwall2 https://github.com/Openwrt-Passwall/openwrt-passwall2.git;main' >> feeds.conf.default
echo 'src-git passwall_packages https://github.com/Openwrt-Passwall/openwrt-passwall-packages.git;main' >> feeds.conf.default
