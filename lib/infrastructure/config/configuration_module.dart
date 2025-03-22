import 'package:injectable/injectable.dart';

@module
abstract class ConfigurationModule {
  @Named("baseUrl")
  String baseUrl() => 'https://api.popgas.com.br';

  @Named("machineUrl")
  String machineUrl() => 'http://localhost:5000';
}
