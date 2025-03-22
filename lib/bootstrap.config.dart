// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:device_info_plus/device_info_plus.dart' as _i833;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;
import 'package:package_info_plus/package_info_plus.dart' as _i655;

import 'infrastructure/config/api_http_module.dart' as _i36;
import 'infrastructure/config/configuration_module.dart' as _i550;
import 'infrastructure/config/third_party_services_module.dart' as _i516;
import 'presentation/services/session_service.dart' as _i433;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final thirdPartyServicesModule = _$ThirdPartyServicesModule();
    final apiHttpModule = _$ApiHttpModule();
    final configurationModule = _$ConfigurationModule();
    await gh.factoryAsync<_i655.PackageInfo>(
      () => thirdPartyServicesModule.packageInfo,
      preResolve: true,
    );
    gh.factory<Map<String, dynamic>>(() => apiHttpModule.defaultHeaders);
    gh.singleton<_i833.DeviceInfoPlugin>(
      () => thirdPartyServicesModule.deviceInfoPlugin,
    );
    gh.singleton<_i974.Logger>(() => thirdPartyServicesModule.logger);
    gh.lazySingleton<_i433.SessionService>(() => _i433.SessionService());
    gh.factory<String>(
      () => configurationModule.machineUrl(),
      instanceName: 'machineUrl',
    );
    gh.factory<String>(
      () => configurationModule.baseUrl(),
      instanceName: 'baseUrl',
    );
    gh.lazySingleton<_i361.Dio>(
      () => apiHttpModule.dio(
        gh<String>(instanceName: 'baseUrl'),
        gh<_i974.Logger>(),
        gh<_i655.PackageInfo>(),
      ),
    );
    return this;
  }
}

class _$ThirdPartyServicesModule extends _i516.ThirdPartyServicesModule {
  @override
  _i833.DeviceInfoPlugin get deviceInfoPlugin => _i833.DeviceInfoPlugin();
}

class _$ApiHttpModule extends _i36.ApiHttpModule {}

class _$ConfigurationModule extends _i550.ConfigurationModule {}
