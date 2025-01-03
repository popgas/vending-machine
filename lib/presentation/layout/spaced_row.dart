import 'package:flutter/material.dart';

class SpacedRow extends StatelessWidget {
  final List<Widget> children;
  final double space;
  final CrossAxisAlignment? crossAxisAlignment;
  final EdgeInsets? padding;

  const SpacedRow({
    Key? key,
    this.space = 12,
    this.crossAxisAlignment,
    this.padding,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Row(
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: _getItems(),
      ),
    );
  }

  List<Widget> _getItems() {
    List<Widget> items = [];

    for (var widget in children) {
      if (items.isNotEmpty) {
        items.add(SizedBox(width: space));
      }

      items.add(widget);
    }

    return items;
  }
}
