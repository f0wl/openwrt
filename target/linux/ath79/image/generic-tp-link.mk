include ./common-tp-link.mk

define Device/tplink_archer-c7-v1
  $(Device/tplink-8mlzma)
  ATH_SOC := qca9558
  DEVICE_TITLE := TP-LINK Archer C7 v1
  DEVICE_PACKAGES := kmod-usb-core kmod-usb2 kmod-usb-ledtrig-usbport kmod-ath10k-ct ath10k-firmware-qca988x-ct
  TPLINK_HWID := 0x75000001
endef
TARGET_DEVICES += tplink_archer-c7-v1

define Device/tplink_archer-c7-v2
  $(Device/tplink-16mlzma)
  ATH_SOC := qca9558
  DEVICE_TITLE := TP-LINK Archer C7 v2
  DEVICE_PACKAGES := kmod-usb-core kmod-usb2 kmod-usb-ledtrig-usbport kmod-ath10k-ct ath10k-firmware-qca988x-ct
  TPLINK_HWID := 0xc7000002
  IMAGES := sysupgrade.bin factory.bin factory-us.bin factory-eu.bin
  IMAGE/factory-us.bin := append-rootfs | mktplinkfw factory -C US
  IMAGE/factory-eu.bin := append-rootfs | mktplinkfw factory -C EU
endef
TARGET_DEVICES += tplink_archer-c7-v2

define Device/tplink_cpe-wbs-v1
  $(Device/tplink)
  ATH_SOC := ar9344
  LOADER_TYPE := elf
  LOADER_FLASH_OFFS := 0x43000
  COMPILE := loader-$(1).elf
  COMPILE/loader-$(1).elf := loader-okli-compile
  KERNEL := kernel-bin | append-dtb | lzma | uImage lzma -M 0x4f4b4c49 | loader-okli $(1) 12288
  IMAGES += factory.bin
  IMAGE/sysupgrade.bin := append-rootfs | tplink-safeloader sysupgrade | append-metadata
  IMAGE/factory.bin := append-rootfs | tplink-safeloader factory
  DEVICE_PACKAGES := rssileds
endef

define Device/tplink_cpe210-v1
  $(Device/tplink_cpe-wbs-v1)
  DEVICE_TITLE := TP-LINK CPE210 v1
  TPLINK_BOARD_ID := CPE210
endef
TARGET_DEVICES += tplink_cpe210-v1

define Device/tplink_cpe510-v1
  $(Device/tplink_cpe-wbs-v1)
  DEVICE_TITLE := TP-LINK CPE510 v1
  TPLINK_BOARD_ID := CPE510
endef
TARGET_DEVICES += tplink_cpe510-v1

define Device/tplink_wbs210-v1
  $(Device/tplink_cpe-wbs-v1)
  DEVICE_TITLE := TP-LINK WBS210 v1
  TPLINK_BOARD_ID := WBS210
endef
TARGET_DEVICES += tplink_wbs210-v1

define Device/tplink_wbs510-v1
  $(Device/tplink_cpe-wbs-v1)
  DEVICE_TITLE := TP-LINK WBS510 v1
  TPLINK_BOARD_ID := WBS510
endef
TARGET_DEVICES += tplink_wbs510-v1

define Device/tplink_re450-v2
  $(Device/tplink)
  ATH_SOC := qca9563
  IMAGE_SIZE := 6016k
  DEVICE_TITLE := TP-LINK RE450 v2
  DEVICE_PACKAGES := kmod-ath10k-ct ath10k-firmware-qca988x-ct
  TPLINK_HWID := 0x0
  TPLINK_HWREV := 0
  TPLINK_BOARD_ID := RE450-V2
  LOADER_TYPE := elf
  KERNEL := kernel-bin | append-dtb | lzma | tplink-v1-header -O
  IMAGE/sysupgrade.bin := append-rootfs | tplink-safeloader sysupgrade | \
    append-metadata | check-size $$$$(IMAGE_SIZE)
  IMAGE/factory.bin := append-rootfs | tplink-safeloader factory
endef
TARGET_DEVICES += tplink_re450-v2

define Device/tplink_tl-wdr3600
  $(Device/tplink-8mlzma)
  ATH_SOC := ar9344
  DEVICE_TITLE := TP-LINK TL-WDR3600
  DEVICE_PACKAGES := kmod-usb-core kmod-usb2 kmod-usb-ledtrig-usbport
  TPLINK_HWID := 0x36000001
  SUPPORTED_DEVICES += tl-wdr3600
endef
TARGET_DEVICES += tplink_tl-wdr3600

define Device/tplink_tl-wdr4300
  $(Device/tplink-8mlzma)
  ATH_SOC := ar9344
  DEVICE_TITLE := TP-LINK TL-WDR4300
  DEVICE_PACKAGES := kmod-usb-core kmod-usb2 kmod-usb-ledtrig-usbport
  TPLINK_HWID := 0x43000001
  SUPPORTED_DEVICES += tl-wdr4300
endef
TARGET_DEVICES += tplink_tl-wdr4300

define Device/tplink_tl-wdr4900-v2
  $(Device/tplink-8mlzma)
  ATH_SOC := qca9558
  DEVICE_TITLE := TP-LINK TL-WDR4900 v2
  DEVICE_PACKAGES := kmod-usb-core kmod-usb2 kmod-usb-ledtrig-usbport
  TPLINK_HWID := 0x49000002
endef
TARGET_DEVICES += tplink_tl-wdr4900-v2

define Device/tplink_tl-wr1043nd-v1
  $(Device/tplink-8m)
  ATH_SOC := ar9132
  DEVICE_TITLE := TP-LINK TL-WR1043N/ND v1
  DEVICE_PACKAGES := kmod-usb-core kmod-usb2 kmod-usb-ledtrig-usbport
  TPLINK_HWID := 0x10430001
  SUPPORTED_DEVICES += tl-wr1043nd
endef
TARGET_DEVICES += tplink_tl-wr1043nd-v1

define Device/tplink_tl-wr842n-v2
  $(Device/tplink-8mlzma)
  ATH_SOC := ar9341
  DEVICE_TITLE := TP-LINK TL-WR842N/ND v2
  DEVICE_PACKAGES := kmod-usb-core kmod-usb2 kmod-usb-ledtrig-usbport
  TPLINK_HWID := 0x8420002
  SUPPORTED_DEVICES += tl-wr842n-v2
endef
TARGET_DEVICES += tplink_tl-wr842n-v2

define Device/tplink_tl-wr1043nd-v2
  $(Device/tplink-8mlzma)
  ATH_SOC := qca9558
  DEVICE_TITLE := TP-LINK TL-WR1043N/ND v2
  DEVICE_PACKAGES := kmod-usb-core kmod-usb2 kmod-usb-ledtrig-usbport
  TPLINK_HWID := 0x10430002
  SUPPORTED_DEVICES += tl-wr1043nd-v2
endef
TARGET_DEVICES += tplink_tl-wr1043nd-v2

define Device/tplink_tl-wr1043nd-v3
  $(Device/tplink-8mlzma)
  ATH_SOC := qca9558
  DEVICE_TITLE := TP-LINK TL-WR1043N/ND v3
  DEVICE_PACKAGES := kmod-usb-core kmod-usb2 kmod-usb-ledtrig-usbport
  TPLINK_HWID := 0x10430003
  SUPPORTED_DEVICES += tl-wr1043nd-v3
endef
TARGET_DEVICES += tplink_tl-wr1043nd-v3

define Device/tplink_tl-wr1043nd-v4
  $(Device/tplink)
  ATH_SOC := qca9563
  IMAGE_SIZE := 15552k
  DEVICE_TITLE := TP-LINK TL-WR1043N/ND v4
  DEVICE_PACKAGES := kmod-usb-core kmod-usb2 kmod-usb-ledtrig-usbport
  TPLINK_HWID := 0x10430004
  TPLINK_BOARD_ID := TLWR1043NDV4
  KERNEL := kernel-bin | append-dtb | lzma | tplink-v1-header -O
  IMAGE/sysupgrade.bin := append-rootfs | tplink-safeloader sysupgrade | \
    append-metadata | check-size $$$$(IMAGE_SIZE)
  IMAGE/factory.bin := append-rootfs | tplink-safeloader factory
  SUPPORTED_DEVICES += tl-wr1043nd-v4
endef
TARGET_DEVICES += tplink_tl-wr1043nd-v4

define Device/tplink_tl-wr2543-v1
  $(Device/tplink-8mlzma)
  ATH_SOC := ar7242
  DEVICE_TITLE := TP-LINK TL-WR2543N/ND v1
  DEVICE_PACKAGES := kmod-usb-core kmod-usb2 kmod-usb-ledtrig-usbport
  TPLINK_HWID := 0x25430001
  IMAGE/sysupgrade.bin := append-rootfs | mktplinkfw sysupgrade -v 3.13.99 | \
    append-metadata | check-size $$$$(IMAGE_SIZE)
  IMAGE/factory.bin := append-rootfs | mktplinkfw factory -v 3.13.99
  SUPPORTED_DEVICES += tl-wr2543-v1
endef
TARGET_DEVICES += tplink_tl-wr2543-v1
