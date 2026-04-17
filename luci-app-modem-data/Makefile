#
# Copyright (C) 2024-2026 OpenWrt
#
# This is free software, licensed under the Apache License 2.0
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-modem-data
PKG_VERSION:=1-15
PKG_RELEASE:=1

PKG_LICENSE:=Apache-2.0
PKG_MAINTAINER:=Your Name <your@mail.com>

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-modem-data
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=LuCI Support for Modem Data / 4G/5G 模组数据管理
  DEPENDS:=+luci-base +luci-mod-admin-full
endef

define Package/luci-app-modem-data/description
  LuCI support for 4G/5G modem data, signal, dial and management.
endef

# 准备阶段：把 .lmo 语言包复制到构建目录
define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)/i18n
	$(CP) ./luci-app-modem-data.zh-cn.lmo $(PKG_BUILD_DIR)/i18n/
endef

define Build/Configure
endef

define Build/Compile
endef

# 安装时同时把 .lmo 安装到 LuCI 的 i18n 目录
define Package/luci-app-modem-data/install
	$(CP) ./files/* $(1)/
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/i18n
	$(CP) $(PKG_BUILD_DIR)/i18n/luci-app-modem-data.zh-cn.lmo $(1)/usr/lib/lua/luci/i18n/
endef

$(eval $(call BuildPackage,luci-app-modem-data))