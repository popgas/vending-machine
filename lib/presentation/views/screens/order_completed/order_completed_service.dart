import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:vending_machine/bootstrap.dart';
import 'package:vending_machine/domain/enums/machine_doors.dart';
import 'package:vending_machine/infrastructure/config/machine_http_module.dart';
import 'package:vending_machine/presentation/abstractions/new_order_intent.dart';
import 'package:vending_machine/presentation/views/components/dialogs/loading_dialog.dart';
import 'package:vending_machine/presentation/views/screens/order_completed/order_completed_state.dart';
import 'package:vending_machine/presentation/views/screens/welcome/welcome_view.dart';

class OrderCompletedService {
  final dio = getIt<Dio>();
  final NewOrderIntent orderIntent;
  final player = AudioPlayer();
  final state = OrderCompletedState();
  final machineDio = MachineHttpModule.create();

  OrderCompletedService(this.orderIntent);

  Future<void> updateRating(int score) async {
    dio.put("/vending-machine-orders/${orderIntent.correlationId}/rating", data: {
      'rating': score,
    });

    state.update(hasRated: true);

    await Future.delayed(const Duration(seconds: 3));
    backToBeginning();
  }

  void init() async {
    playFirstAudio();

    await machineDio.get("/trigger/${VendingMachinePins.rotateCarrousel}");

    await Future.delayed(const Duration(seconds: 25));

    playSecondAudio();

    await Future.delayed(const Duration(seconds: 5));

    await machineDio.get("/trigger/${orderIntent.getOpenDoorPin()}");

    await Future.delayed(const Duration(seconds: 10));

    playThirdAudio();

    await Future.delayed(const Duration(seconds: 120));

    closeAllDoors();
  }

  void playFirstAudio() async {
    await player.play(AssetSource('order_placed/payment_received.mp3'));
  }

  void playSecondAudio() async {
    await player.play(AssetSource('order_placed/ready_to_pickup.mp3'));
  }

  void playThirdAudio() async {
    await player.play(AssetSource('order_placed/thanks_and_rate.mp3'));
  }

  void backToBeginning() async {
    Get.dialog(LoadingDialog("Fechando todas as portas.."));

    await closeAllDoors();

    await Future.delayed(const Duration(seconds: 2));

    Get.offAll(() => const WelcomeScreen());
  }

  Future<void> closeAllDoors() async {
    await machineDio.get("/trigger/${VendingMachinePins.closeDoor1}");
    await machineDio.get("/trigger/${VendingMachinePins.closeDoor2}");
    await machineDio.get("/trigger/${VendingMachinePins.closeDoor3}");
  }
}