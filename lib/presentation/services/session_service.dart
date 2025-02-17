import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:vending_machine/bootstrap.dart';

@lazySingleton
class SessionService {
  var dio = getIt<Dio>();
  var logger = getIt<Logger>();

  Future<void> update({Map<String, dynamic>? properties}) async {
    try {
      var data = {
        'vending_machine_id': 1,
        ...(properties ?? {}),
      };

      await dio.put('/vending-machine-sessions', data: data);
    } catch (e) {
      logger.e(e);
    }
  }
}