include $(TOPDIR)/rules.mk

PKG_NAME:=peervpn
PKG_VERSION:=044
PKG_RELEASE:=0

PKG_SOURCE:=$(PKG_NAME)-$(PKG_RELEASE)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://peervpn.net/files/
PKG_MD5SUM:=3acb4cbf083c0bdacc90ad7d2403b1bc

PKG_LICENSE:=GPLv3
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=tobiasvolk <mail@tobiasvolk.de>

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_RELEASE)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
	SECTION:=net
	CATEGORY:=Network
	TITLE:=The open source peer-to-peer VPN
	URL:=https://peervpn.net/
	DEPENDS:=+libopenssl
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/peervpn $(1)/usr/bin
	$(INSTALL_DIR) $(1)/etc/
	$(CP) $(PKG_BUILD_DIR)/peervpn.conf $(1)/etc/
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
