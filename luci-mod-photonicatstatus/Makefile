include $(TOPDIR)/rules.mk

PKG_NAME:=luci-mod-photonicatstatus
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_MAINTAINER:=ntbowen <ntbowen2001@gmail.com>
PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

LUCI_TITLE:=Photonicat Battery Status
LUCI_DESCRIPTION:=Provides a battery charge and system clock indicator in LuCI. Currently only supports Photonicat.

LUCI_DEPENDS:=+luci-base +libiwinfo-lua +rpcd-mod-iwinfo +pcat-manager

include $(TOPDIR)/feeds/luci/luci.mk

# Install CSS and JS files
$(eval $(call LUCI_INSTALL_PRELOAD,photonicatstatus,/www/luci-static/resources/preload,photonicatstatus.css photonicatstatus-indicator.js))

# call BuildPackage - OpenWrt buildroot signature
