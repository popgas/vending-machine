import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vending_machine/presentation/abstractions/new_order_intent.dart';
import 'package:vending_machine/presentation/config/color_palette.dart';
import 'package:vending_machine/presentation/views/components/vending_machine_scaffold.dart';
import 'package:vending_machine/presentation/views/screens/card_machine_payment/card_machine_payment_service.dart';
import 'package:vending_machine/presentation/views/screens/card_machine_payment/card_machine_payment_view_state.dart';

class CardMachinePaymentView extends StatefulWidget {
  final NewOrderIntent orderIntent;

  const CardMachinePaymentView({super.key, required this.orderIntent});

  @override
  State<CardMachinePaymentView> createState() => _CardMachinePaymentViewState();
}

class _CardMachinePaymentViewState extends State<CardMachinePaymentView> {
  late CardMachinePaymentService service;

  @override
  void initState() {
    super.initState();
    service = CardMachinePaymentService(widget.orderIntent);
    service.initiatePayment();
  }

  @override
  void dispose() {
    service.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: service.state,
      child: Consumer<CardMachinePaymentViewState>(
        builder:
            (context, state, _) => VendingMachineScaffold(
              bgOpacity: 0,
              canGoBack: false,
              body: Column(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 100 * 80,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Aguardando pagamento", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: ColorPalette.blue3)),
                          SizedBox(height: 12),
                          Text(
                            widget.orderIntent.paymentMethodId == 5
                              ? "Escaneie o QR code na tela da maquininha de cartão para efetuar o pagamento"
                              : "Insira ou aproxime seu cartão na maquininha",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold, color: ColorPalette.blue2),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 70, height: 70, child: CircularProgressIndicator(strokeWidth: 10, color: ColorPalette.blue2)),
                  const SizedBox(height: 50),
                  Image.asset("assets/security_verification/fila_botijoes.png", width: MediaQuery.of(context).size.width),
                  const SizedBox(height: 40),
                ],
              ),
            ),
      ),
    );
  }
}
