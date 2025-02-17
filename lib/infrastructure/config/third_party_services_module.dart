import 'package:device_info_plus/device_info_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:package_info_plus/package_info_plus.dart';

@module
abstract class ThirdPartyServicesModule {
  @preResolve
  Future<PackageInfo> get packageInfo => PackageInfo.fromPlatform();

  @singleton
  DeviceInfoPlugin get deviceInfoPlugin;

  @singleton
  Logger get logger => Logger();
}