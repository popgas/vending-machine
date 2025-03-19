import 'package:flutter/material.dart';
import 'package:vending_machine/presentation/abstractions/new_order_intent.dart';
import 'package:vending_machine/presentation/config/color_palette.dart';
import 'package:vending_machine/presentation/views/components/buttons/blue_button.dart';
import 'package:vending_machine/presentation/views/components/vending_machine_scaffold.dart';
import 'package:vending_machine/presentation/views/screens/payment_selection/payment_selection_service.dart';

class PaymentSelectionView extends StatefulWidget {
  final NewOrderIntent orderIntent;

  const PaymentSelectionView({super.key, required this.orderIntent});

  @override
  State<PaymentSelectionView> createState() => _PaymentSelectionViewState();
}

class _PaymentSelectionViewState extends State<PaymentSelectionView> {
  late PaymentSelectionService service;

  @override
  void initState() {
    super.initState();
    service = PaymentSelectionService(widget.orderIntent);
    service.init();
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: Text(
                    "Selecione a forma de pagamento",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: ColorPalette.blue3),
                  ),
                ),
              ),
            ),
            BlueButton(
              onPressed: service.debitCardSelected,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0, top: 12, bottom: 12, left: 6),
                    child: SizedBox(width: 25, child: Image.asset("assets/payment_selection/cartao.png")),
                  ),
                  const Text("Cartão de Débito", style: TextStyle(color: Colors.white, fontSize: 23, letterSpacing: 1)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            BlueButton(
              onPressed: service.creditCardSelected,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0, top: 12, bottom: 12, left: 6),
                    child: SizedBox(width: 25, child: Image.asset("assets/payment_selection/cartao.png")),
                  ),
                  const Text("Cartão de Crédito (á vista)", style: TextStyle(color: Colors.white, fontSize: 23, letterSpacing: 1)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            BlueButton(
              onPressed: service.pixSelected,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0, top: 12, bottom: 12, left: 6),
                    child: SizedBox(width: 25, child: Image.asset("assets/payment_selection/pix.png")),
                  ),
                  const Text("PIX", style: TextStyle(color: Colors.white, fontSize: 23, letterSpacing: 1)),
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
