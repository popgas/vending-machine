import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:vending_machine/infrastructure/config/machine_http_module.dart';
import 'package:vending_machine/presentation/abstractions/new_order_intent.dart';
import 'package:vending_machine/presentation/views/screens/security_verification/security_verification_view.dart';

class PlaceContainerInstructionsService {
  final NewOrderIntent orderIntent;
  final machineDio = MachineHttpModule.create();
  final player = AudioPlayer();

  PlaceContainerInstructionsService(this.orderIntent);

  Future<void> init() async {
    player.play(AssetSource('place_container_instructions/audio.mp3'));

    var openDoorPin = orderIntent.getOpenDoorPin();
    await machineDio.get("/trigger/$openDoorPin");
  }

  void placeContainer() {
    player.stop();
    Get.to(() => SecurityVerificationView(orderIntent: orderIntent));
  }
}