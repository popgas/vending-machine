// import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:vending_machine/presentation/config/color_palette.dart';
import 'package:vending_machine/presentation/layout/conditional.dart';
import 'package:vending_machine/presentation/layout/spaced_column.dart';
import 'package:vending_machine/presentation/layout/spaced_row.dart';
import 'package:vending_machine/presentation/views/components/vending_machine_scaffold.dart';
import 'package:vending_machine/presentation/views/screens/order_completed/order_completed_service.dart';

class OrderCompletedView extends StatefulWidget {
  const OrderCompletedView({super.key});

  @override
  State<OrderCompletedView> createState() => _OrderCompletedViewState();
}

class _OrderCompletedViewState extends State<OrderCompletedView> {
  bool hasRated = false;
  final service = OrderCompletedService();
  // final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    service.init();
    // playAudio();
  }

  void playAudio() async {
    // await player.play(AssetSource('order_placed/audio.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return VendingMachineScaffold(
      canGoBack: true,
      body: Column(
        children: [
          const SizedBox(height: 100),
          Expanded(
            child: Center(
              child: Column(
                children: [
                  Image.asset("assets/order_placed/confetti.png", width: 130),
                  const SizedBox(height: 24),
                  Text(
                    "Obrigado pela compra",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: ColorPalette.blue3,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 450,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(230),
              border: Border.all(color: Colors.black12.withAlpha(50)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Conditional(
              condition: hasRated,
              ifTrue: () => SpacedColumn(
                crossAxisAlignment: CrossAxisAlignment.center,
                space: 24,
                children: [
                  Text(
                    "Seu feedback foi enviado, muito obrigado!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorPalette.blue3,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Icon(
                    Icons.check_circle_outline,
                    size: 40,
                    color: ColorPalette.green1,
                  )
                ],
              ),
              ifFalse: () => SpacedColumn(
                crossAxisAlignment: CrossAxisAlignment.center,
                space: 24,
                children: [
                  Text(
                    "Avalie sua experiência:",
                    style: TextStyle(
                      color: ColorPalette.blue3,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SpacedRow(
                    space: 12,
                    children: [
                      rate("rate_1.png", "Muito Ruim"),
                      rate("rate_2.png", "Ruim"),
                      rate("rate_3.png", "Neutro"),
                      rate("rate_4.png", "Boa"),
                      rate("rate_5.png", "Muito Boa"),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 70),
        ],
      ),
    );
  }

  Widget rate(String image, String text) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          hasRated = true;
        });

        // await player.stop();
        // await player.play(AssetSource('order_placed/audio_2.mp3'));
      },
      child: SizedBox(
        width: 70,
        child: Center(
          child: SpacedColumn(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/order_placed/$image", width: 40),
              Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
