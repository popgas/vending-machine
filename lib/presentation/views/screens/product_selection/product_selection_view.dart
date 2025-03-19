import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:vending_machine/presentation/config/color_palette.dart';
import 'package:vending_machine/presentation/layout/conditional.dart';
import 'package:vending_machine/presentation/utils/formatters.dart';
import 'package:vending_machine/presentation/views/components/buttons/white_button.dart';
import 'package:vending_machine/presentation/views/components/vending_machine_scaffold.dart';
import 'package:vending_machine/presentation/views/screens/product_selection/product_selection_service.dart';
import 'package:provider/provider.dart';
import 'package:vending_machine/presentation/views/screens/product_selection/product_selection_view_state.dart';

class ProductSelectionView extends StatefulWidget {
  const ProductSelectionView({super.key});

  @override
  State<ProductSelectionView> createState() => _ProductSelectionViewState();
}

class _ProductSelectionViewState extends State<ProductSelectionView> with AfterLayoutMixin<ProductSelectionView> {
  final service = ProductSelectionService();

  @override
  void afterFirstLayout(BuildContext context) => service.init();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: service.state,
      child: Consumer<ProductSelectionViewState>(
        builder:
            (context, state, _) => VendingMachineScaffold(
              canGoBack: true,
              body: Conditional(
                condition: state.fetchingPrices,
                ifTrue: () => const Center(child: CircularProgressIndicator()),
                ifFalse: () => Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Center(
                          child: Text("Selecione o produto", textAlign: TextAlign.center, style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: ColorPalette.blue3)),
                        ),
                      ),
                    ),
                    WhiteButton(
                      onPressed: service.refillSelected,
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Recarga 13kg", style: TextStyle(color: ColorPalette.blue3, fontSize: 30)),
                                Text("eu trouxe o vasilhame vazio para troca", style: TextStyle(color: ColorPalette.neutralPrimary, fontSize: 18)),
                              ],
                            ),
                          ),
                          Text(Formatters.formatCurrency(state.gasRefillPrice), style: TextStyle(color: ColorPalette.blue3, fontSize: 30)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    WhiteButton(
                      onPressed: service.gasWithContainerSelected,
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Comprar Botijão + Vasilhame 13kg", style: TextStyle(color: ColorPalette.blue3, fontSize: 30)),
                                Text("não tenho vasilhame e quero comprar", style: TextStyle(color: ColorPalette.neutralPrimary, fontSize: 18)),
                              ],
                            ),
                          ),
                          Text(Formatters.formatCurrency(state.gasWithContainerPrice), style: TextStyle(color: ColorPalette.blue3, fontSize: 30)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
