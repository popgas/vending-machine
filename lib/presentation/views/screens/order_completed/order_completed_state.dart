import 'package:flutter/material.dart';

class OrderCompletedState extends ChangeNotifier {
  bool hasRated = false;

  void update({
    bool? hasRated,
    bool? rejected,
  }) {
    this.hasRated = hasRated ?? this.hasRated;
    notifyListeners();
  }
}