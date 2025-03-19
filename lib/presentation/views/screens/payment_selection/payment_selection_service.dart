import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:vending_machine/bootstrap.dart';
import 'package:vending_machine/presentation/abstractions/new_order_intent.dart';
import 'package:vending_machine/presentation/views/screens/card_payment/card_payment.dart';
import 'package:vending_machine/presentation/views/screens/pix_payment/pix_payment_view.dart';

class PaymentSelectionService {
  final dio = getIt<Dio>();
  final NewOrderIntent orderIntent;
  final player = AudioPlayer();

  PaymentSelectionService(this.orderIntent);

  Future<void> init() async {
    await player.play(AssetSource('payment_selection/audio.mp3'));
  }

  Future<void> debitCardSelected() async {
    Get.to(() => CardPaymentView(
      orderIntent: orderIntent.copyWith(
        paymentMethodId: 2,
      ),
    ));
  }

  Future<void> creditCardSelected() async {
    Get.to(() => CardPaymentView(
      orderIntent: orderIntent.copyWith(
        paymentMethodId: 3,
      ),
    ));
  }

  Future<void> pixSelected() async {
    Get.to(() => PixPaymentView(
      orderIntent: orderIntent.copyWith(
        paymentMethodId: 9,
      ),
    ));
  }
}