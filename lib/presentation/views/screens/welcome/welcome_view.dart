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
