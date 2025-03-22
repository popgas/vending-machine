import 'package:flutter/material.dart';
import 'package:vending_machine/presentation/abstractions/new_order_intent.dart';
import 'package:vending_machine/presentation/config/color_palette.dart';
import 'package:vending_machine/presentation/views/components/vending_machine_scaffold.dart';
import 'package:vending_machine/presentation/views/screens/security_verification/security_verification_service.dart';

class SecurityVerificationView extends StatefulWidget {
  final NewOrderIntent orderIntent;

  const SecurityVerificationView({super.key, required this.orderIntent});

  @override
  State<SecurityVerificationView> createState() => _SecurityVerificationViewState();
}

class _SecurityVerificationViewState extends State<SecurityVerificationView> {
  late SecurityVerificationService service;

  @override
  void initState() {
    super.initState();
    service = SecurityVerificationService(widget.orderIntent);
    service.init();
  }

  @override
  Widget build(BuildContext context) {
    return VendingMachineScaffold(
      bgOpacity: 0,
      canGoBack: false,
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
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: ColorPalette.blue3),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Estamos verificando o estado do seu botijão. Por favor, aguarde.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: ColorPalette.blue2),
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