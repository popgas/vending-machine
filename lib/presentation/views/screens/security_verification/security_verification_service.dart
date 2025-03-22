import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:vending_machine/infrastructure/config/machine_http_module.dart';
import 'package:vending_machine/presentation/abstractions/new_order_intent.dart';
import 'package:vending_machine/presentation/views/components/dialogs/info_dialog.dart';
import 'package:vending_machine/presentation/views/screens/payment_selection/payment_selection_view.dart';

class SecurityVerificationService {
  final machineDio = MachineHttpModule.create();
  final NewOrderIntent orderIntent;
  final player = AudioPlayer();

  SecurityVerificationService(this.orderIntent);

  Future<void> init() async {
    try {
      playAudio();

      var camera = orderIntent.getCamera();
      var result = await machineDio.get("/capture/$camera");

      await Future.delayed(const Duration(seconds: 2));

      if (result.statusCode != 200 || result.data['result'] != "recognized") {
        return showError();
      }

      player.stop();
      Get.to(() => PaymentSelectionView(orderIntent: orderIntent));
    } catch (e) {
      showError();
    }
  }

  void showError() async {
    Get.dialog(InfoDialog("Seu botijão não foi aprovado na verificação de segurança."));

    await Future.delayed(const Duration(seconds: 3));

    var openDoorPin = orderIntent.getOpenDoorPin();
    await machineDio.get("/trigger/$openDoorPin");

    Get.back();
  }

  void playAudio() async {
    await player.play(AssetSource('security_verification/audio.mp3'));
  }
}