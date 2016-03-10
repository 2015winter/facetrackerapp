 
 LOCAL_PATH := $(call my-dir)
 MY_PATH := $(LOCAL_PATH)

ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)

include $(CLEAR_VARS)
LOCAL_MODULE := FaceTracker
LOCAL_SRC_FILES := libFaceTracker.a 
#$(wildcard /FaceTracker/lib/*.cc)
#LOCAL_C_INCLUDES := $(LOCAL_PATH)/FaceTracker
LOCAL_LDLIBS   = -lz -lm
LOCAL_CFLAGS   = -Wall -pedantic -g -O3	-ffast-math -funroll-loops -march=armv7-a -mfloat-abi=softfp -mfpu=neon
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
OPENCV_INSTALL_MODULES:=on
OPENCV_CAMERA_MODULES:=on
	
include E:/Libraries/OpenCV-2.4.10-android-sdk/sdk/native/jni/OpenCV.mk

LOCAL_MODULE    := native_activity
LOCAL_SRC_FILES := native.cpp \
				   TeapotRenderer.cpp
LOCAL_C_FLAGS+= -DNDEBUG -Wall -pedantic -g -O3	-ffast-math -funroll-loops -march=armv7-a -mfloat-abi=softfp -mfpu=neon
#LOCAL_C_INCLUDES+= $(NDK_APP_PROJECT_PATH)/stasm4.1.0/stasm
#LOCAL_SRC_FILES += $(NDK_APP_PROJECT_PATH)/libstasm.a
#LOCAL_SRC_FILES += $(wildcard $(NDK_APP_PROJECT_PATH)/stasm/*.cpp)
LOCAL_LDLIBS    += -lm -llog -landroid -lEGL -lGLESv2
#LOCAL_SHARED_LIBRARIES += libandroid
LOCAL_STATIC_LIBRAIES += cpufeatures
LOCAL_STATIC_LIBRARIES += android_native_app_glue
LOCAL_STATIC_LIBRARIES += FaceTracker
LOCAL_STATIC_LIBRARIES += ndk_helper
LOCAL_ARM_NEON := true
LOCAL_ARM_MODE := arm
include $(BUILD_SHARED_LIBRARY)

$(call import-module,android/ndk_helper)
$(call import-module,android/native_app_glue)
$(call import-module,android/cpufeatures)

endif
	
	
