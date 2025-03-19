import 'package:flutter/material.dart';
import 'package:vending_machine/domain/enums/order_product_selected.dart';

@immutable
class NewOrderIntent {
  final OrderProductSelected productSelected;
  final double productPrice;
  final int? paymentMethodId;
  final String? correlationId;

  const NewOrderIntent({
    required this.productSelected,
    required this.productPrice,
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
      paymentMethodId: paymentMethodId ?? this.paymentMethodId,
      correlationId: correlationId ?? this.correlationId,
    );
  }
}