
##############################################################
#
# AESD_DEVICE_DRIVER
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESD_DEVICE_DRIVER_VERSION = eaec79e62829b1c304d93550157a0577f4ff4589
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_DEVICE_DRIVER_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-vido2373.git
AESD_DEVICE_DRIVER_SITE_METHOD = git
AESD_DEVICE_DRIVER_GIT_SUBMODULES = YES

AESD_DEVICE_DRIVER_MODULE_SUBDIRS = aesd-char-driver
AESD_DEVICE_DRIVER_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED)

define AESD_DEVICE_DRIVER_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_unload $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment8/* $(TARGET_DIR)/usr/bin
endef

$(eval $(kernel-module))
$(eval $(generic-package))
