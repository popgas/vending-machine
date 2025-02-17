// import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vending_machine/presentation/config/color_palette.dart';
import 'package:vending_machine/presentation/views/components/vending_machine_scaffold.dart';
import 'package:vending_machine/presentation/views/screens/card_payment/card_payment_service.dart';
import 'package:vending_machine/presentation/views/screens/order_completed/order_completed.dart';

class CardPaymentView extends StatefulWidget {
  const CardPaymentView({super.key});

  @override
  State<CardPaymentView> createState() => _CardPaymentViewState();
}

class _CardPaymentViewState extends State<CardPaymentView> {
  // final player = AudioPlayer();
  final service = CardPaymentService();

  @override
  void initState() {
    super.initState();
    service.init();
    // playAudio();

    Future.delayed(const Duration(seconds: 5), () {
      Get.to(() => const OrderCompletedView());
    });
  }

  void playAudio() async {
    // await player.play(AssetSource('card_payment/audio.mp3'));
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
                    "Aguardando pagamento",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: ColorPalette.blue3),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Insira ou aproxime seu cartão na máquina",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: ColorPalette.blue2),
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