import 'package:flutter/material.dart';

class ProductSelectionViewState extends ChangeNotifier {
  bool fetchingPrices = false;
  double gasRefillPrice = 0;
  double gasWithContainerPrice = 0;
  int stockCount = 0;

  void update({
    bool? fetchingPrices,
    double? gasRefillPrice,
    double? gasWithContainerPrice,
    int? stockCount,
  }) {
    this.fetchingPrices = fetchingPrices ?? this.fetchingPrices;
    this.gasRefillPrice = gasRefillPrice ?? this.gasRefillPrice;
    this.gasWithContainerPrice = gasWithContainerPrice ?? this.gasWithContainerPrice;
    this.stockCount = stockCount ?? this.stockCount;
    notifyListeners();
  }
}