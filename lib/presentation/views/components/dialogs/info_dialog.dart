import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vending_machine/presentation/views/components/dialogs/dialog_shape.dart';

class InfoDialog extends StatelessWidget {
  final Color infoColor = const Color(0xFF2494e9);
  final String message;
  final String? title;
  final String? buttonLabel;
  final TextAlign? textAlign;

  const InfoDialog(this.message, {super.key, this.buttonLabel, this.title, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return DialogShape(
      children: <Widget>[
        Text(title ?? "Informação", style: TextStyle(fontWeight: FontWeight.bold, color: infoColor, letterSpacing: -0.7)),
        Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 24),
          child: Text(message, style: TextStyle(fontSize: 17, letterSpacing: -0.5, height: 1.4, color: Colors.grey[800])),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: 120,
              height: 45,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  padding: EdgeInsets.symmetric(vertical: 8),
                  backgroundColor: infoColor,
                ),
                child: Text(buttonLabel ?? "Entendi", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                onPressed: () => Get.back(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
