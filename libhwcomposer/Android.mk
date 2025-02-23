LOCAL_PATH := $(call my-dir)
include $(LOCAL_PATH)/../common.mk
include $(CLEAR_VARS)

LOCAL_MODULE                  := hwcomposer.$(TARGET_BOARD_PLATFORM)
LOCAL_MODULE_RELATIVE_PATH    := hw
LOCAL_VENDOR_MODULE           := true
LOCAL_MODULE_TAGS             := optional
LOCAL_STATIC_LIBRARIES        += libskia_renderengine
LOCAL_SHARED_LIBRARIES        := $(common_libs) libEGL liboverlay \
                                 libhdmi libqdutils libhardware_legacy \
                                 libdl libmemalloc libqservice libsync \
                                 libbinder libmedia libvirtual \
                                 libnativewindow libGLESv2 libpng libskqp_app

ifeq ($(TARGET_USES_QCOM_BSP),true)
LOCAL_SHARED_LIBRARIES += libhwui
ifeq ($(GET_DISPLAY_SECURE_STATUS_FROM_HWC),true)
    LOCAL_CFLAGS += -DGET_DISPLAY_SECURE_STATUS_FROM_HWC
endif
endif #TARGET_USES_QCOM_BSP

LOCAL_CFLAGS                  := $(common_flags) -DLOG_TAG=\"qdhwcomposer\" -Wno-sign-conversion -Wno-shorten-64-to-32 -Wno-float-conversion
LOCAL_HEADER_LIBRARIES        := display_headers generated_kernel_headers
LOCAL_SRC_FILES               := hwc.cpp          \
                                 hwc_utils.cpp    \
                                 hwc_uevents.cpp  \
                                 hwc_vsync.cpp    \
                                 hwc_fbupdate.cpp \
                                 hwc_mdpcomp.cpp  \
                                 hwc_copybit.cpp  \
                                 hwc_qclient.cpp  \
                                 hwc_dump_layers.cpp \
                                 hwc_ad.cpp \
                                 hwc_virtual.cpp
include $(BUILD_SHARED_LIBRARY)
