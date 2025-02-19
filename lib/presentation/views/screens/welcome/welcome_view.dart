import 'package:dart_periphery/dart_periphery.dart';
import 'package:flutter/material.dart';
import 'package:vending_machine/presentation/config/color_palette.dart';
import 'package:vending_machine/presentation/views/components/buttons/blue_button.dart';
import 'package:vending_machine/presentation/views/components/vending_machine_scaffold.dart';
import 'package:get/get.dart';
import 'package:vending_machine/presentation/views/screens/flow_selection/flow_selection_view.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen> {
  List<String> lines = [];

  @override
  void initState() {
    super.initState();

    try {
      List<String> lines = [];
      var config = GPIOconfig.defaultValues();
      lines.add('Native c-periphery Version :  ${getCperipheryVersion()}');
      lines.add('GPIO test');

      var gpio = GPIO(18, GPIOdirection.gpioDirOut);
      var gpio2 = GPIO(16, GPIOdirection.gpioDirOut);
      var gpio3 = GPIO.advanced(5, config);

      lines.add('GPIO info: ' + gpio.getGPIOinfo());

      lines.add('GPIO native file handle: ${gpio.getGPIOfd()}');
      lines.add('GPIO chip name: ${gpio.getGPIOchipName()}');
      lines.add('GPIO chip label: ${gpio.getGPIOchipLabel()}');
      lines.add('GPIO chip name: ${gpio.getGPIOchipName()}');
      lines.add('CPIO chip label: ${gpio.getGPIOchipLabel()}');

      gpio.dispose();
      gpio2.dispose();
      gpio3.dispose();

      setState(() {
        this.lines = lines;
      });
    } catch (e) {
      setState(() {
        this.lines = [
          e.toString(),
        ];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return VendingMachineScaffold(
      canGoBack: false,
      body: GestureDetector(
          onTap: () {
            Get.to(() => const FlowSelectionView());
          },
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Bem-vindo",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: ColorPalette.blue3,
                      ),
                    ),
                    Text(
                      lines.join("\n"),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: ColorPalette.blue3,
                      ),
                    ),
                    Text(
                      "Máquina de Auto Atendimento",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: ColorPalette.blue3,
                      ),
                    ),
                    Text(
                      "24h",
                      style: TextStyle(
                        fontSize: 60,
                        letterSpacing: -2,
                        fontWeight: FontWeight.bold,
                        color: ColorPalette.blue3,
                      ),
                    ),
                  ],
                ),
              ),
              BlueButton(
                onPressed: () {
                  Get.to(() => const FlowSelectionView());
                },
                child: const Center(
                  child: Text(
                    "Toque para iniciar",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          )),
    );
  }
}
