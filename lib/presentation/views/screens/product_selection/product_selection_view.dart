// import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vending_machine/presentation/config/color_palette.dart';
import 'package:vending_machine/presentation/views/components/buttons/white_button.dart';
import 'package:vending_machine/presentation/views/components/vending_machine_scaffold.dart';
import 'package:vending_machine/presentation/views/screens/place_container_instructions/place_container_instructions_view.dart';
import 'package:vending_machine/presentation/views/screens/product_selection/product_selection_service.dart';

class ProductSelectionView extends StatefulWidget {
  const ProductSelectionView({super.key});

  @override
  State<ProductSelectionView> createState() => _ProductSelectionViewState();
}

class _ProductSelectionViewState extends State<ProductSelectionView> {
  // final player = AudioPlayer();
  final service = ProductSelectionService();

  @override
  void initState() {
    super.initState();
    service.init();
    playAudio();
  }

  void playAudio() async {
    // await player.play(AssetSource('product_selection/audio.mp3'));
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
                  "Selecione o produto",
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
          WhiteButton(
            onPressed: service.refillSelected,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Recarga 13kg",
                        style: TextStyle(color: ColorPalette.blue3, fontSize: 30),
                      ),
                      Text(
                        "eu trouxe o vasilhame vazio para troca",
                        style: TextStyle(color: ColorPalette.neutralPrimary, fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Text(
                  "R\$ 89,00",
                  style: TextStyle(color: ColorPalette.blue3, fontSize: 30),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          WhiteButton(
            onPressed: service.gasWithContainerSelected,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Comprar Botijão + Vasilhame 13kg",
                        style: TextStyle(color: ColorPalette.blue3, fontSize: 30),
                      ),
                      Text(
                        "não tenho vasilhame e quero comprar",
                        style: TextStyle(color: ColorPalette.neutralPrimary, fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Text(
                  "R\$ 279,00",
                  style: TextStyle(color: ColorPalette.blue3, fontSize: 30),
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