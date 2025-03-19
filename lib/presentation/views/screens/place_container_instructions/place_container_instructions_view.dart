import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vending_machine/presentation/abstractions/new_order_intent.dart';
import 'package:vending_machine/presentation/config/color_palette.dart';
import 'package:vending_machine/presentation/views/components/buttons/blue_button.dart';
import 'package:vending_machine/presentation/views/components/vending_machine_scaffold.dart';
import 'package:vending_machine/presentation/views/screens/place_container_instructions/place_container_instructions_service.dart';
import 'package:vending_machine/presentation/views/screens/security_verification/security_verification_view.dart';

class PlaceContainerInstructionsView extends StatefulWidget {
  final NewOrderIntent orderIntent;

  const PlaceContainerInstructionsView({
    super.key,
    required this.orderIntent,
  });

  @override
  State<PlaceContainerInstructionsView> createState() => _PlaceContainerInstructionsViewState();
}

class _PlaceContainerInstructionsViewState extends State<PlaceContainerInstructionsView> {
  final player = AudioPlayer();
  final service = PlaceContainerInstructionsService();

  @override
  void initState() {
    super.initState();
    service.init();
    playAudio();
  }

  void playAudio() async {
    await player.play(AssetSource('place_container_instructions/audio.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return VendingMachineScaffold(
      canGoBack: true,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Text(
                  "Insira seu botijão",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: ColorPalette.blue3,
                  ),
                ),
              ),
            ),
          ),
          Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              padding: const EdgeInsets.symmetric(vertical: 24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: ColorPalette.neutralPrimary.withAlpha(150)),
              ),
              child: Column(
                children: [
                  Text(
                    "Coloque seu botijão vazio na porta e se afaste",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: ColorPalette.neutralPrimary),
                  ),
                  const SizedBox(height: 24),
                  Image.asset("assets/place_container_instructions/instrucoes_colocar_botijao.png", width: 200),
                ],
              )),
          const SizedBox(height: 24),
          BlueButton(
            onPressed: () {
              player.stop();
              Get.to(() => SecurityVerificationView(orderIntent: widget.orderIntent));
            },
            child: const Row(
              children: [
                Expanded(
                  child: Text(
                    "Pronto. Coloquei o botijão",
                    style: TextStyle(fontSize: 23, color: Colors.white),
                  ),
                ),
                Icon(Icons.arrow_forward_rounded, color: Colors.white),
              ],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}