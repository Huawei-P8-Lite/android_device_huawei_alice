/*
   Copyright (C) 2019, The Lineage OS Project
   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.
   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <android-base/logging.h>
#include <cstdlib>
#include <fstream>
#include <string>
#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>

#include "property_service.h"
#include "vendor_init.h"

using android::init::property_set;
using namespace std;

const char *APP_INFO = "/proc/app_info";

void property_override(char const prop[], char const value[])
{
    prop_info *pi;

    pi = (prop_info*) __system_property_find(prop);
    if (pi)
        __system_property_update(pi, value, strlen(value));
    else
        __system_property_add(prop, strlen(prop), value, strlen(value));
}

void property_override_dual(char const system_prop[], char const vendor_prop[], char const value[])
{
    property_override(system_prop, value);
    property_override(vendor_prop, value);
}

void set_model(const char *model) {
    property_override("ro.build.product", model);
    property_override_dual("ro.product.device", "ro.vendor.product.device", model);
    property_override_dual("ro.product.model", "ro.vendor.product.model", model);
}

void init_target_properties()
{
    ifstream fin;
    string buf;

    fin.open(APP_INFO, ios::in);
    if (!fin) {
        LOG(ERROR) << __func__ << ": Failed to open " << APP_INFO;
        return;
    }

    while (getline(fin, buf))
        if (buf.find("huawei_fac_product_name") != string::npos)
            break;
    fin.close();

    /* ALE-L02 */
    if (buf.find("ALE-L02") != string::npos) {
        set_model("ALE-L02");
        property_override("rild.libargs", "-m modem0");
        property_override("rild.libargs1", "-m modem1");
        property_override("rild.libpath", "/vendor/lib64/libbalong-ril.so");
        property_override("rild.libpath1", "/vendor/lib64/libbalong-ril.so");
        property_override("ro.config.dsds_mode", "umts_gsm");
        property_override("ro.config.hw_dsda", "true");
        property_override("ro.multi.rild", "true");
        property_override("persist.dsds.enabled", "true");
        property_override("rild.rild1_ready_to_start", "true");
        property_override("persist.radio.multisim.config", "dsda");
        property_override("ro.config.is_start_commril", "true");
        property_override("ro.config.default_commril_mode", "HISI_CGUL_MODE");
        property_override("ro.config.fix_commril_mode", "false");
        property_override("ro.telephony.default_network", "9");
        property_override("gsm.defaultpdpcontext.active", "true");
        property_override("persist.radio.m0_ps_allow", "1");
        property_override("persist.radio.modem_cdma_roam", "false");
        property_override("ro.config.full_network_support", "false");
        property_override("ro.build.description", "ALE-L02-user 6.0 HuaweiALE-L02 C432B596 release-keys");
        property_override_dual("ro.build.fingerprint", "ro.vendor.build.fingerprint",
                               "Huawei/ALE-L02/hwALE-H:6.0/HuaweiALE-L02/C432B596:user/release-keys");
    }
    /* ALE-L21 */
    else if (buf.find("ALE-L21") != string::npos) {
        set_model("ALE-L21");
        property_override("rild.libargs", "-m modem0");
        property_override("rild.libargs1", "-m modem1");
        property_override("rild.libpath", "/vendor/lib64/libbalong-ril.so");
        property_override("rild.libpath1", "/vendor/lib64/libbalong-ril.so");
        property_override("ro.config.dsds_mode", "umts_gsm");
        property_override("ro.config.hw_dsda", "true");
        property_override("ro.multi.rild", "true");
        property_override("persist.dsds.enabled", "true");
        property_override("rild.rild1_ready_to_start", "true");
        property_override("persist.radio.multisim.config", "dsda");
        property_override("ro.config.is_start_commril", "true");
        property_override("ro.config.default_commril_mode", "HISI_CGUL_MODE");
        property_override("ro.config.fix_commril_mode", "false");
        property_override("ro.telephony.default_network", "9");
        property_override("gsm.defaultpdpcontext.active", "true");
        property_override("persist.radio.m0_ps_allow", "1");
        property_override("persist.radio.modem_cdma_roam", "false");
        property_override("ro.config.full_network_support", "false");
        property_override("ro.build.description", "ALE-L21-user 6.0 HuaweiALE-L21 C432B596 release-keys");
        property_override_dual("ro.build.fingerprint", "ro.vendor.build.fingerprint",
                               "Huawei/ALE-L21/hwALE-H:6.0/HuaweiALE-L21/C432B596:user/release-keys");
    }
    /* ALE-L23 */
    else if (buf.find("ALE-L23") != string::npos) {
        set_model("ALE-L23");
        property_override("rild.libargs", "-m modem0");
        property_override("rild.libargs1", "-m modem1");
        property_override("rild.libpath", "/vendor/lib64/libbalong-ril.so");
        property_override("rild.libpath1", "/vendor/lib64/libbalong-ril.so");
        property_override("ro.config.dsds_mode", "umts_gsm");
        property_override("ro.config.hw_dsda", "true");
        property_override("ro.multi.rild", "true");
        property_override("persist.dsds.enabled", "true");
        property_override("rild.rild1_ready_to_start", "true");
        property_override("persist.radio.multisim.config", "dsda");
        property_override("ro.config.is_start_commril", "true");
        property_override("ro.config.default_commril_mode", "HISI_CGUL_MODE");
        property_override("ro.config.fix_commril_mode", "false");
        property_override("ro.telephony.default_network", "9");
        property_override("gsm.defaultpdpcontext.active", "true");
        property_override("persist.radio.m0_ps_allow", "1");
        property_override("persist.radio.modem_cdma_roam", "false");
        property_override("ro.config.full_network_support", "false");
        property_override("ro.build.description", "ALE-L23-user 6.0 HuaweiALE-L23 C432B596 release-keys");
        property_override_dual("ro.build.fingerprint", "ro.vendor.build.fingerprint",
                               "Huawei/ALE-L23/hwALE-H:6.0/HuaweiALE-L23/C432B596:user/release-keys");
    }
    /* ALE-UL00 */
    else if (buf.find("ALE-UL00") != string::npos) {
        set_model("ALE-UL00");
        property_override("rild.libargs", "-m modem0");
        property_override("rild.libargs1", "-m modem1");
        property_override("rild.libpath", "/vendor/lib64/libbalong-ril.so");
        property_override("rild.libpath1", "/vendor/lib64/libbalong-ril.so");
        property_override("ro.config.dsds_mode", "umts_gsm");
        property_override("ro.config.hw_dsda", "true");
        property_override("ro.multi.rild", "true");
        property_override("persist.dsds.enabled", "true");
        property_override("rild.rild1_ready_to_start", "true");
        property_override("persist.radio.multisim.config", "dsda");
        property_override("ro.config.is_start_commril", "true");
        property_override("ro.config.default_commril_mode", "HISI_CGUL_MODE");
        property_override("ro.config.fix_commril_mode", "false");
        property_override("ro.telephony.default_network", "9");
        property_override("gsm.defaultpdpcontext.active", "true");
        property_override("persist.radio.m0_ps_allow", "1");
        property_override("persist.radio.modem_cdma_roam", "false");
        property_override("ro.config.full_network_support", "false");
        property_override("ro.build.description", "ALE-UL00-user 6.0 HuaweiALE-UL00 C432B596 release-keys");
        property_override_dual("ro.build.fingerprint", "ro.vendor.build.fingerprint",
                               "Huawei/ALE-UL00/hwALE-H:6.0/HuaweiALE-UL00/C432B596:user/release-keys");
    }
    else {
        LOG(ERROR) << __func__ << ": unexcepted huawei_fac_product_name!";
    }
}
