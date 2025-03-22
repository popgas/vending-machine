import 'package:flutter/material.dart';
import 'package:vending_machine/presentation/views/components/dialogs/dialog_shape.dart';

class LoadingDialog extends StatelessWidget {
  final Color infoColor = const Color(0xFF2494e9);
  final String message;

  const LoadingDialog(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return DialogShape(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 10),
        CircularProgressIndicator(),
        SizedBox(height: 20),
        Text(message),
      ],
    );
  }
}
