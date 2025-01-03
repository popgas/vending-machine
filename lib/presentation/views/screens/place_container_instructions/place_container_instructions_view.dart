import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vending_machine/presentation/config/color_palette.dart';
import 'package:vending_machine/presentation/views/components/buttons/blue_button.dart';
import 'package:vending_machine/presentation/views/components/vending_machine_scaffold.dart';
import 'package:vending_machine/presentation/views/screens/security_verification/security_verification_view.dart';

class PlaceContainerInstructionsView extends StatefulWidget {
  const PlaceContainerInstructionsView({super.key});

  @override
  State<PlaceContainerInstructionsView> createState() => _PlaceContainerInstructionsViewState();
}

class _PlaceContainerInstructionsViewState extends State<PlaceContainerInstructionsView> {
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
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
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Insira seu botijão",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: ColorPalette.blue3),
                ),
              ],
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
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: ColorPalette.neutralPrimary),
                  ),
                  const SizedBox(height: 24),
                  Image.asset("assets/place_container_instructions/instrucoes_colocar_botijao.png", width: 200),
                ],
              )),
          const SizedBox(height: 24),
          BlueButton(
            onPressed: () {
              player.stop();
              Get.to(() => const SecurityVerificationView());
            },
            child: const Row(
              children: [
                Expanded(
                  child: Text(
                    "Pronto. Coloquei o botijão",
                    style: TextStyle(fontSize: 18, color: Colors.white),
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