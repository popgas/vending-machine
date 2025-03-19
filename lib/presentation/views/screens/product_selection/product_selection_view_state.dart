import 'package:flutter/material.dart';

class ProductSelectionViewState extends ChangeNotifier {
  bool fetchingPrices = false;
  double gasRefillPrice = 0;
  double gasWithContainerPrice = 0;

  void update({
    bool? fetchingPrices,
    double? gasRefillPrice,
    double? gasWithContainerPrice,
  }) {
    this.fetchingPrices = fetchingPrices ?? this.fetchingPrices;
    this.gasRefillPrice = gasRefillPrice ?? this.gasRefillPrice;
    this.gasWithContainerPrice = gasWithContainerPrice ?? this.gasWithContainerPrice;
    notifyListeners();
  }
}