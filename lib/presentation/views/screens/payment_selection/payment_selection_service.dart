import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:vending_machine/bootstrap.dart';
import 'package:vending_machine/presentation/services/session_service.dart';
import 'package:vending_machine/presentation/views/screens/card_payment/card_payment.dart';
import 'package:vending_machine/presentation/views/screens/pix_payment/pix_payment_view.dart';

class PaymentSelectionService {
  final dio = getIt<Dio>();
  final sessionService = getIt<SessionService>();

  Future<void> init() async {
    sessionService.update(properties: {
      'latest_screen': 'Escolha da Forma de Pagamento',
    });
  }

  Future<void> debitCardSelected() async {
    sessionService.update(properties: {
      'latest_screen': 'Escolha da Forma de Pagamento',
      'payment_method_id': 2,
    });

    Get.to(() => const CardPaymentView());
  }

  Future<void> creditCardSelected() async {
    sessionService.update(properties: {
      'latest_screen': 'Escolha da Forma de Pagamento',
      'payment_method_id': 3,
    });

    Get.to(() => const CardPaymentView());
  }

  Future<void> pixSelected() async {
    sessionService.update(properties: {
      'latest_screen': 'Escolha da Forma de Pagamento',
      'payment_method_id': 9,
    });

    Get.to(() => const PixPaymentView());
  }
}