import 'package:android_id/android_id.dart';
import 'package:device_info_plus/device_info_plus.dart';

class DeviceUuidGetter {
  static Future<String> get() async {
    DeviceInfoPlugin device = DeviceInfoPlugin();
    AndroidDeviceInfo info = await device.androidInfo;

    return await AndroidId().getId() ?? info.fingerprint;
  }
}