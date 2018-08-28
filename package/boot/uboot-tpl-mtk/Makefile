#
# Copyright (C) 2013-2018 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_RELEASE:=1

PKG_SOURCE_URL:=https://github.com/blocktrron/tpl-mtk-uboot.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=64bfb98741c9886abaf9718d321de17383244b78

include $(INCLUDE_DIR)/u-boot.mk
include $(INCLUDE_DIR)/package.mk

define U-Boot/Default
  BUILD_TARGET:=ramips
endef

define U-Boot/tpl-mtk-c50-v4
  NAME:=TP-Link Archer C50 v4 split-uboot
  UBOOT_IMAGE:=split_uboot_c50_v4.bin
  UBOOT_CONFIG:=C50V4_SECOND
endef

define Package/u-boot/install
	$(CP) $(patsubst %,$(PKG_BUILD_DIR)/%,bin/$(UBOOT_CONFIG).bin) $(1)/$(UBOOT_IMAGE)
endef

undefine Build/Compile/U-Boot
undefine Build/Configure/U-Boot

UBOOT_TARGETS := tpl-mtk-c50-v4

$(eval $(call BuildPackage/U-Boot))
