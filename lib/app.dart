import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      theme: ThemeData(
        textTheme: GoogleFonts.interTightTextTheme(),
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
    );
  }
}
