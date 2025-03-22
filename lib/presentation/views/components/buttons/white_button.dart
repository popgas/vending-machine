import 'package:flutter/material.dart';
import 'package:vending_machine/presentation/config/color_palette.dart';

class WhiteButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final double? height;

  const WhiteButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height ?? 120,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: ColorPalette.blue3),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          backgroundColor: Colors.white,
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
