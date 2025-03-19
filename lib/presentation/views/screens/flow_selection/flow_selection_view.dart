import 'package:after_layout/after_layout.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vending_machine/presentation/config/color_palette.dart';
import 'package:vending_machine/presentation/views/components/buttons/blue_button.dart';
import 'package:vending_machine/presentation/views/components/buttons/white_button.dart';
import 'package:vending_machine/presentation/views/components/vending_machine_scaffold.dart';
import 'package:vending_machine/presentation/views/screens/product_selection/product_selection_view.dart';

class FlowSelectionView extends StatefulWidget {
  const FlowSelectionView({super.key});

  @override
  State<FlowSelectionView> createState() => _FlowSelectionViewState();
}

class _FlowSelectionViewState extends State<FlowSelectionView> with AfterLayoutMixin<FlowSelectionView> {
  final player = AudioPlayer();

  @override
  void afterFirstLayout(BuildContext context) => playAudio();

  void playAudio() async {
    await player.play(AssetSource('flow_selection/audio.mp3'));
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
                  "Escolher como deseja continuar",
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
          BlueButton(
            onPressed: () {
              player.stop();
              Get.to(() => const ProductSelectionView());
            },
            child: const Text(
              "Novo Pedido",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          const SizedBox(height: 24),
          WhiteButton(
            onPressed: () {
              // player.stop();
            },
            child: Column(
              children: [
                Text(
                  "Retirar com código",
                  style: TextStyle(color: ColorPalette.blue3, fontSize: 30),
                ),
                Text(
                  "Já fiz meu pedido no aplicativo",
                  style: TextStyle(color: ColorPalette.neutralPrimary, fontSize: 18),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}