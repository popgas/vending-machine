import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:vending_machine/infrastructure/config/machine_http_module.dart';
import 'package:vending_machine/presentation/views/components/dialogs/info_dialog.dart';
import 'package:vending_machine/presentation/views/components/dialogs/loading_dialog.dart';
import 'package:vending_machine/presentation/views/screens/product_selection/product_selection_view.dart';

class WelcomeViewService {
  final machineDio = MachineHttpModule.create();
  final player = AudioPlayer();

  void goToProductSelection() async {
    try {
      Get.dialog(LoadingDialog("Verificando conexão com a máquina..."));

      var response = await machineDio.get("/health");

      Get.back();

      if (response.statusCode != 200) {
        player.play(AssetSource('welcome/connection_issue.mp3'));
        return Get.dialog(InfoDialog("Identificamos um problema de comunicação com a máquina. Entre em contato com o suporte."));
      }

      Get.to(() => const ProductSelectionView());
    } catch (e) {
      Get.isDialogOpen ?? Get.back();
    }
  }
}
