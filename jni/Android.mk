LOCAL_PATH := $(call my-dir)

CORE_DIR     := $(LOCAL_PATH)/..
LIBRETRO_DIR := $(LOCAL_PATH)/..

include $(LOCAL_PATH)/../Makefile.common

COREFLAGS := -DINLINE=inline -DHAVE_STDINT_H -DHAVE_INTTYPES_H -D__LIBRETRO__  -DLIBRETRO -DGAME_HARD_LINKED=1 -DREF_HARD_LINKED -fPIC

include $(CLEAR_VARS)
LOCAL_MODULE    := retro
LOCAL_SRC_FILES := $(SOURCES_CXX) $(SOURCES_C)
LOCAL_CXXFLAGS  := $(COREFLAGS) $(INCFLAGS)
LOCAL_CFLAGS    := $(COREFLAGS) $(INCFLAGS)
LOCAL_LDFLAGS   := -Wl,-version-script=$(LIBRETRO_DIR)/link.T
LOCAL_C_INCLUDES = $(CORE_DIR)

include $(BUILD_SHARED_LIBRARY)