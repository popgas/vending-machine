import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vending_machine/presentation/views/components/buttons/blue_button.dart';
import 'package:vending_machine/presentation/views/components/vending_machine_scaffold.dart';
import 'package:vending_machine/presentation/views/screens/gpio_test/gpio_test_service.dart';

class GpioTestView extends StatefulWidget {
  const GpioTestView({super.key});

  @override
  State<GpioTestView> createState() => _GpioTestViewState();
}

class _GpioTestViewState extends State<GpioTestView> {
  final service = GpioTestService();

  @override
  Widget build(BuildContext context) {
    return VendingMachineScaffold(
      canGoBack: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Wrap(
            children: [for(var i=1; i<30; i+=1) i].map((e) => Container(
              width: MediaQuery.of(context).size.width / 100 * 30,
              margin: EdgeInsets.only(bottom: 20),
              child: BlueButton(
                onPressed: () {
                  service.executePin(e);
                },
                child: Center(
                  child: Text(
                    "Pino $e",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )).toList(),
          ),
        ),
      )
    );
  }
}
