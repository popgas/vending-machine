import 'package:flutter/material.dart';
import 'package:vending_machine/presentation/config/color_palette.dart';

class BlueButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final double? height;

  const BlueButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height ?? 100,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          backgroundColor: ColorPalette.blue3,
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
