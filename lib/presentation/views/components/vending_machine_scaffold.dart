import 'package:flutter/material.dart';
import 'package:vending_machine/presentation/views/components/transparent_appbar.dart';

class VendingMachineScaffold extends StatelessWidget {
  final Widget body;
  final double? bgOpacity;
  final bool? canGoBack;

  const VendingMachineScaffold({
    super.key,
    required this.body,
    this.canGoBack,
    this.bgOpacity,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Container(
          color: Colors.blueGrey[50],
          child: Stack(
            children: [
              Positioned(
                right: 0,
                bottom: 0,
                child: Opacity(
                  opacity: bgOpacity ?? .5,
                  child: Image.asset("assets/welcome/botijao.png", width: MediaQuery.of(context).size.width/2),
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    TransparentAppBar(canGoBack: canGoBack ?? true),
                    Expanded(child: body),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
