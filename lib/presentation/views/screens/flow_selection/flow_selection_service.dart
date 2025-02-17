import 'package:dio/dio.dart';
import 'package:vending_machine/bootstrap.dart';
import 'package:vending_machine/presentation/services/session_service.dart';

class FlowSelectionService {
  final dio = getIt<Dio>();
  final sessionService = getIt<SessionService>();

  Future<void> init() async {
    sessionService.update(properties: {
      'latest_screen': 'Novo Pedido ou Retirada',
    });
  }
}