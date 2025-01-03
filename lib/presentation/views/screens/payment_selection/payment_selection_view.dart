import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vending_machine/presentation/config/color_palette.dart';
import 'package:vending_machine/presentation/views/components/buttons/blue_button.dart';
import 'package:vending_machine/presentation/views/components/vending_machine_scaffold.dart';
import 'package:vending_machine/presentation/views/screens/card_payment/card_payment.dart';
import 'package:vending_machine/presentation/views/screens/pix_payment/pix_payment_view.dart';

class PaymentSelectionView extends StatefulWidget {
  const PaymentSelectionView({super.key});

  @override
  State<PaymentSelectionView> createState() => _PaymentSelectionViewState();
}

class _PaymentSelectionViewState extends State<PaymentSelectionView> {
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    playAudio();
  }

  void playAudio() async {
    await player.play(AssetSource('payment_selection/audio.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return VendingMachineScaffold(
      canGoBack: true,
      body: SizedBox(
        width: 500,
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  "Selecione a forma de pagamento",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: ColorPalette.blue3,
                  ),
                ),
              ),
            ),
            BlueButton(
              onPressed: () {
                player.stop();
                Get.to(() => const CardPaymentView());
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0, top: 12, bottom: 12),
                    child: SizedBox(
                      width: 20,
                      child: Image.asset("assets/payment_selection/cartao.png"),
                    ),
                  ),
                  const Text(
                    "Cartão de Débito",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            BlueButton(
              onPressed: () {
                player.stop();
                Get.to(() => const CardPaymentView());
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0, top: 12, bottom: 12),
                    child: SizedBox(
                      width: 20,
                      child: Image.asset("assets/payment_selection/cartao.png"),
                    ),
                  ),
                  const Text(
                    "Cartão de Crédito (á vista)",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            BlueButton(
              onPressed: () {
                player.stop();
                Get.to(() => const PixPaymentView());
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0, top: 12, bottom: 12),
                    child: SizedBox(
                      width: 20,
                      child: Image.asset("assets/payment_selection/pix.png"),
                    ),
                  ),
                  const Text(
                    "PIX",
                    style: TextStyle(color: Colors.white, fontSize: 20, letterSpacing: 1),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
