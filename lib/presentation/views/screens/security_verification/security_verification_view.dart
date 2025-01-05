import 'dart:async';

// import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vending_machine/presentation/config/color_palette.dart';
import 'package:vending_machine/presentation/views/components/vending_machine_scaffold.dart';
import 'package:vending_machine/presentation/views/screens/payment_selection/payment_selection_view.dart';

class SecurityVerificationView extends StatefulWidget {
  const SecurityVerificationView({super.key});

  @override
  State<SecurityVerificationView> createState() => _SecurityVerificationViewState();
}

class _SecurityVerificationViewState extends State<SecurityVerificationView> {
  @override
  void initState() {
    super.initState();
    // playAudio();

    Future.delayed(const Duration(seconds: 5), () {
      Get.to(() => const PaymentSelectionView());
    });
  }

  void playAudio() async {
    // final player = AudioPlayer();
    // await player.play(AssetSource('security_verification/audio.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return VendingMachineScaffold(
      bgOpacity: 0,
      canGoBack: true,
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 100 * 80,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Analisando seu botijão",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: ColorPalette.blue3),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Estamos verificando o estado do seu botijão. Por favor, aguarde.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: ColorPalette.blue2),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 70,
            height: 70,
            child: CircularProgressIndicator(
              strokeWidth: 10,
              color: ColorPalette.blue2,
            ),
          ),
          const SizedBox(height: 50),
          Image.asset(
            "assets/security_verification/fila_botijoes.png",
            width: MediaQuery
                .of(context)
                .size
                .width,
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}