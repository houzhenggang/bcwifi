TOMATO_N = 1
PROFILE_G = 1
PROFILE_N = 2
TOMATO_PROFILE = $(PROFILE_N)
TOMATO_PROFILE_NAME = "N"
TOMATO_BUILD = "F"
TOMATO_BUILD_NAME = "F"
TOMATO_BUILD_DESC = "Mini"
TOMATO_PROFILE_L = n
TOMATO_PROFILE_U = N
TOMATO_BUILD_USB = ""
export EXTRACFLAGS := -DLINUX26 -DCONFIG_BCMWL5 -pipe -DBCMWPA2 -funit-at-a-time -Wno-pointer-sign -mtune=mips32 -mips32  
