import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vending_machine/bootstrap.dart';
import 'package:vending_machine/domain/enums/order_product_selected.dart';
import 'package:vending_machine/presentation/abstractions/new_order_intent.dart';
import 'package:vending_machine/presentation/views/screens/card_payment/card_payment_view_state.dart';
import 'package:vending_machine/presentation/views/screens/order_completed/order_completed.dart';

class CardPaymentService {
  final dio = getIt<Dio>();
  final state = CardPaymentViewState();
  final NewOrderIntent orderIntent;
  final player = AudioPlayer();
  String? correlationId;
  Timer? paymentCheckerTimer;

  CardPaymentService(this.orderIntent);

  Future<void> initiatePayment() async {
    player.play(AssetSource('card_payment/audio.mp3'));

    await Future.delayed(const Duration(seconds: 1));

    var storage = await SharedPreferences.getInstance();
    var id = storage.getString("vending_machine_id");

    var response = await dio.post('/vending-machine-orders', data: {
        'vending_machine_id': id,
        'payment_method_id': orderIntent.paymentMethodId,
        'product_price': orderIntent.productPrice,
        'product_selected': orderIntent.productSelected == OrderProductSelected.onlyGasRefill
            ? 'ONLY_GAS_REFILL'
            : 'GAS_WITH_CONTAINER',
    });

    correlationId = response.data['correlation_id'];

    paymentCheckerTimer = Timer.periodic(Duration(seconds: 3), (timer) {
      checkPaymentStatus();
    });
  }

  Future<void> checkPaymentStatus() async {
    var response = await dio.get('/vending-machine-orders/$correlationId');
    var status = response.data['status'];

    switch (status) {
      case 'APPROVED':
        paymentCheckerTimer?.cancel();

        Get.offAll(() => OrderCompletedView(
          orderIntent: orderIntent.copyWith(
            correlationId: correlationId,
          ),
        ));
        break;
      case 'REJECTED':
      case 'UNAUTHORIZED':
      case 'ABORTED':
      case 'CANCELLED':
        paymentCheckerTimer?.cancel();
        state.update(
            awaitingPaymentApproval: false,
            rejected: true,
        );
        break;
      default:
        return;
    }
  }
}