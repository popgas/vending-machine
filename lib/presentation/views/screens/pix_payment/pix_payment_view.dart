import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:vending_machine/presentation/config/color_palette.dart';
import 'package:vending_machine/presentation/utils/timer.dart';
import 'package:vending_machine/presentation/views/components/vending_machine_scaffold.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PixPaymentView extends StatefulWidget {
  const PixPaymentView({super.key});

  @override
  State<PixPaymentView> createState() => _PixPaymentViewState();
}

class _PixPaymentViewState extends State<PixPaymentView> {
  int timeRemaining = 600;
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    playAudio();

    Timer.periodic(const Duration(seconds: 1), (t) {
      setState(() {
        timeRemaining--;
      });
    });
  }

  void playAudio() async {
    await player.play(AssetSource('pix_payment/audio.mp3'));
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
                SizedBox(
                  width: 300,
                  child: Text(
                    "Escaneie o QR code para efetuar o pagamento",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: ColorPalette.blue3,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 50),
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: ColorPalette.neutralPrimary.withAlpha(150)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: QrImageView(
                    data: '1234567890',
                    version: QrVersions.auto,
                    size: 200.0,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.access_time_outlined),
                    const SizedBox(width: 8),
                    Text("Expira em ${TimeUtils.intToTimeLeft(timeRemaining)}"),
                  ],
                ),
                SizedBox(
                  width: 300,
                  height: 30,
                  child: LinearPercentIndicator(
                    width: 300,
                    barRadius: const Radius.circular(8),
                    lineHeight: 8.0,
                    percent: timeRemaining / 600,
                    progressColor: Colors.blue,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4, left: 12, right: 12),
                  child: Row(
                    children: [
                      const Expanded(
                          child: Text(
                        "Valor do Pedido:",
                        style: TextStyle(fontSize: 17),
                      )),
                      Text(
                        "R\$ 113,00",
                        style: TextStyle(
                          fontSize: 17,
                          letterSpacing: .7,
                          color: ColorPalette.neutralPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}
