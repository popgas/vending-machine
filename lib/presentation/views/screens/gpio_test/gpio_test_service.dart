import 'package:get/get.dart';
import 'package:vending_machine/infrastructure/config/machine_http_module.dart';
import 'package:vending_machine/presentation/views/components/dialogs/loading_dialog.dart';

class GpioTestService {
  final machineDio = MachineHttpModule.create();

  void executePin(int pin) async {
    Get.dialog(LoadingDialog("Aciononando pino $pin..."));

    await machineDio.get("/trigger/$pin");

    Get.back();
  }
}