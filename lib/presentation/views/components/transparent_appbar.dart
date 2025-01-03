import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vending_machine/presentation/config/color_palette.dart';
import 'package:vending_machine/presentation/views/screens/welcome/welcome_view.dart';

class TransparentAppBar extends StatelessWidget {
  final bool canGoBack;

  const TransparentAppBar({super.key, this.canGoBack = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            SizedBox(width: 47, child: canGoBack ? icon() : null),
            Expanded(
              child: Center(
                child: SvgPicture.asset("assets/colored-logo.svg", width: 100),
              ),
            ),
            SizedBox(
              width: 47,
              child: canGoBack
                  ? IconButton(
                      onPressed: () {
                        Get.offAll(() => const WelcomeScreen());
                      },
                      icon: Column(
                        children: [
                          Icon(Icons.home_outlined, size: 30, color: ColorPalette.blue3),
                          const Text("Ínicio", style: TextStyle(fontSize: 11),),
                        ],
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget icon() {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        size: 30,
        color: ColorPalette.blue3,
      ),
      onPressed: _goBack,
    );
  }

  void _goBack() async {
    Get.back();
  }
}
