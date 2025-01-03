import 'package:flutter/material.dart';

typedef WidgetBuilder = Widget Function();

class Conditional extends StatelessWidget {
  final bool condition;
  final WidgetBuilder ifTrue;
  final WidgetBuilder? ifFalse;

  const Conditional({
    super.key,
    required this.condition,
    required this.ifTrue,
    this.ifFalse,
  });

  @override
  Widget build(BuildContext context) {
    if (condition) return ifTrue();
    return ifFalse != null ? ifFalse!() : SizedBox.shrink();
  }
}
