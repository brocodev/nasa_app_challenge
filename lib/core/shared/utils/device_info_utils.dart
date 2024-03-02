import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

sealed class DeviceInfoUtils {
  static Future<String?> getId() async {
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      final iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor;
    } else if (Platform.isAndroid) {
      final androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.serialNumber;
    }
    return null;
  }
}
