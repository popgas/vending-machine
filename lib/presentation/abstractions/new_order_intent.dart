import 'package:flutter/material.dart';
import 'package:vending_machine/domain/enums/machine_doors.dart';
import 'package:vending_machine/domain/enums/order_product_selected.dart';

@immutable
class NewOrderIntent {
  final OrderProductSelected productSelected;
  final double productPrice;
  final int? paymentMethodId;
  final String? correlationId;
  final int stockCount;

  const NewOrderIntent({
    required this.productSelected,
    required this.productPrice,
    required this.stockCount,
    this.paymentMethodId,
    this.correlationId,
  });

  NewOrderIntent copyWith({
    int? paymentMethodId,
    String? correlationId,
  }) {
    return NewOrderIntent(
      productSelected: productSelected,
      productPrice: productPrice,
      stockCount: stockCount,
      paymentMethodId: paymentMethodId ?? this.paymentMethodId,
      correlationId: correlationId ?? this.correlationId,
    );
  }

  int getOpenDoorPin() {
    if (stockCount > 27) {
      return VendingMachinePins.openDoor1;
    } else if (stockCount > 13) {
      return VendingMachinePins.openDoor2;
    } else {
      return VendingMachinePins.openDoor3;
    }
  }

  int getCloseDoorPin() {
    if (stockCount > 27) {
      return VendingMachinePins.closeDoor1;
    } else if (stockCount > 13) {
      return VendingMachinePins.closeDoor2;
    } else {
      return VendingMachinePins.closeDoor3;
    }
  }

  int getCamera() {
    if (stockCount > 27) {
      return 1;
    } else if (stockCount > 13) {
      return 2;
    } else {
      return 3;
    }
  }
}