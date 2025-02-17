import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:vending_machine/bootstrap.dart';
import 'package:vending_machine/presentation/services/session_service.dart';
import 'package:vending_machine/presentation/views/screens/place_container_instructions/place_container_instructions_view.dart';

class ProductSelectionService {
  final dio = getIt<Dio>();
  final sessionService = getIt<SessionService>();

  Future<void> init() async {
    sessionService.update(properties: {
      'latest_screen': 'Novo Pedido - Escolher Produto',
    });
  }

  Future<void> refillSelected() async {
    sessionService.update(properties: {
      'latest_screen': 'Novo Pedido - Escolher Produto',
      'order_type': 'ONLY_GAS_REFILL',
      'product_price': 89.99
    });

    // player.stop();
    Get.to(() => const PlaceContainerInstructionsView());
  }

  Future<void> gasWithContainerSelected() async {
      sessionService.update(properties: {
        'latest_screen': 'Novo Pedido - Escolher Produto',
        'order_type': 'GAS_WITH_CONTAINER',
        'product_price': 279.99
      });

      // player.stop();
      Get.to(() => const PlaceContainerInstructionsView());
  }
}