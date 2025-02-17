import 'package:injectable/injectable.dart';

@module
abstract class ConfigurationModule {
  @Named("baseUrl")
  String baseUrl() => 'https://sandbox-api.popgas.com.br';
}
