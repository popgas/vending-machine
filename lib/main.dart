import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vending_machine/app.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'bootstrap.dart';
import 'package:web/web.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await configureDependencies();

  FlutterNativeSplash.remove();

  await parseVendingMachineId();

  runApp(const VendingMachineApp());
}

Future<void> parseVendingMachineId() async {
  var parsed = Uri.parse(window.location.href);

  if (parsed.queryParameters.containsKey("vm")) {
      var uid = parsed.queryParameters["vm"] as String;

      var storage = await SharedPreferences.getInstance();
      storage.setString("vending_machine_id", uid);
  } else {
    throw Exception("Invalid vending machine id");
  }
}