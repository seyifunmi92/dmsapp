//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <nb_utils/nb_utils_plugin.h>
#include <platform_device_id_linux/platform_device_id_linux_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) nb_utils_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "nb_utils_plugin");
  nb_utils_plugin_register_with_registrar(nb_utils_registrar);
  g_autoptr(FlPluginRegistrar) platform_device_id_linux_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "PlatformDeviceIdLinuxPlugin");
  platform_device_id_linux_plugin_register_with_registrar(platform_device_id_linux_registrar);
}
