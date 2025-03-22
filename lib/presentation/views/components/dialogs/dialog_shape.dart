import 'package:flutter/material.dart';

class DialogShape extends StatelessWidget {
  final List<Widget> children;
  final CrossAxisAlignment? crossAxisAlignment;
  final EdgeInsets? contentPadding;
  final EdgeInsets? insetPadding;
  final double? borderRadius;
  final Color? backgroundColor;
  final double? elevation;

  const DialogShape({
    super.key,
    this.crossAxisAlignment,
    this.contentPadding,
    this.insetPadding,
    this.backgroundColor,
    this.borderRadius,
    this.elevation,
    required this.children,y
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backgroundColor ?? Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 10)),
      ),
      contentPadding: contentPadding ?? EdgeInsets.all(24),
      insetPadding: insetPadding ?? EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
      elevation: elevation,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}