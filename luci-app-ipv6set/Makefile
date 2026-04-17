include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-ipv6set
PKG_VERSION:=1.6
PKG_RELEASE:=1

PKG_LICENSE:=Apache-2.0
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-ipv6set
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=IPv6 Settings
  DEPENDS:=+luci-base
endef

define Package/luci-app-ipv6set/description
  IPv6 Global Setting
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)/i18n
	$(CP) ./ipv6set.zh-cn.lmo $(PKG_BUILD_DIR)/i18n/
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/luci-app-ipv6set/install
	$(CP) ./files/* $(1)/
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/i18n
	$(CP) $(PKG_BUILD_DIR)/i18n/ipv6set.zh-cn.lmo $(1)/usr/lib/lua/luci/i18n/
endef

$(eval $(call BuildPackage,luci-app-ipv6set))
