LOCAL_PATH := $(call my-dir)
include $(LOCAL_PATH)/../common.mk
include $(CLEAR_VARS)

LOCAL_MODULE                  := libvirtual
LOCAL_MODULE_TAGS             := optional
LOCAL_VENDOR_MODULE           := true
LOCAL_SHARED_LIBRARIES        := $(common_libs) liboverlay libqdutils libmedia libEGL libmedia_omx
LOCAL_CFLAGS                  := $(common_flags) -DLOG_TAG=\"qdvirtual\" -Wno-sign-conversion
LOCAL_HEADER_LIBRARIES        := display_headers generated_kernel_headers av-headers
LOCAL_SRC_FILES               := virtual.cpp
LOCAL_STATIC_LIBRARIES        := libbase

include $(BUILD_SHARED_LIBRARY)
