import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vending_machine/app.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'bootstrap.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await configureDependencies();

  FlutterNativeSplash.remove();

  runApp(const VendingMachineApp());
}