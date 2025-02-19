import 'package:flutter/material.dart';
import 'package:vending_machine/presentation/views/screens/welcome/welcome_view.dart';
import 'package:get/get.dart';

class VendingMachineApp extends StatelessWidget {
  const VendingMachineApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Máquina PopGás 24h',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Geist'),
      home: WelcomeScreen(),
    );
  }
}
