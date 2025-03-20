import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:vending_machine/bootstrap.dart';
import 'package:vending_machine/presentation/abstractions/new_order_intent.dart';
import 'package:vending_machine/presentation/views/screens/order_completed/order_completed_state.dart';
import 'package:vending_machine/presentation/views/screens/welcome/welcome_view.dart';

class OrderCompletedService {
  final dio = getIt<Dio>();
  final NewOrderIntent orderIntent;
  final player = AudioPlayer();
  final state = OrderCompletedState();

  OrderCompletedService(this.orderIntent);

  Future<void> updateRating(int score) async {
    dio.put("/vending-machine-orders/${orderIntent.correlationId}/rating", data: {
      'rating': score,
    });

    state.update(hasRated: true);

    await Future.delayed(const Duration(seconds: 3));
    backToBeginning();
  }

  void init() {
    playAudio();
  }

  void playAudio() async {
    await player.play(AssetSource('order_placed/audio.mp3'));
  }

  void backToBeginning() {
    Get.offAll(() => const WelcomeScreen());
  }
}