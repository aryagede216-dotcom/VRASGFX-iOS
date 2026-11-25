// VRASGFX iOS native-loader probe — ARM64 / iOS
// This is a diagnostic stub only. It does NOT implement graphics effects.
#include <stdint.h>

#if defined(__APPLE__)
  #define VRAS_EXPORT __attribute__((visibility("default")))
#else
  #define VRAS_EXPORT
#endif

VRAS_EXPORT const char *vrasgfx_ios_probe_name(void) {
    return "VRASGFX iOS Native Probe";
}

VRAS_EXPORT uint32_t vrasgfx_ios_probe_version(void) {
    return 0x00000002u;
}

VRAS_EXPORT int32_t vrasgfx_ios_probe_ping(int32_t value) {
    return value ^ 0x56524153; // deterministic round-trip marker: "VRAS"
}
