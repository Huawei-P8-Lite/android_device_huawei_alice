#
# Copyright (C) 2015 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

ifneq ($(filter alice, $(TARGET_DEVICE)),)
   LOCAL_PATH := $(call my-dir)
   include $(call all-makefiles-under,$(LOCAL_PATH))
endif

#copy kernel for aosp
ifneq ($(filter aosp, $(TARGET_DEVICE)),)
   $(info $(shell mkdir -p out/target/product/alice/))
   $(info $(shell cp device/huawei/alice/kernel out/target/product/alice/))
endif

#copy kernel ts files to overcome an error while building
$(info $(shell mkdir -p out/target/product/alice/obj/KERNEL_OBJ/firmware/))
$(info $(shell cp -avr kernel/huawei/alice/firmware/ts out/target/product/alice/obj/KERNEL_OBJ/firmware/))