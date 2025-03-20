import 'package:flutter/material.dart';

class CardMachinePaymentViewState extends ChangeNotifier {
  bool awaitingPaymentApproval = true;
  bool? rejected;

  void update({
    bool? awaitingPaymentApproval,
    bool? rejected,
  }) {
    this.awaitingPaymentApproval = awaitingPaymentApproval ?? this.awaitingPaymentApproval;
    this.rejected = rejected ?? this.rejected;
    notifyListeners();
  }
}