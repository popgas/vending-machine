import 'package:flutter/material.dart';

class SpacedColumn extends StatelessWidget {
  final List<Widget> children;
  final double space;
  final MainAxisSize? mainAxisSize;
  final CrossAxisAlignment? crossAxisAlignment;

  const SpacedColumn({
    super.key,
    this.space = 12,
    this.mainAxisSize,
    this.crossAxisAlignment,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: mainAxisSize ?? MainAxisSize.min,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
      children: _getItems(),
    );
  }

  List<Widget> _getItems() {
    List<Widget> items = [];

    children.forEach((widget) {
      if (items.isNotEmpty) {
        items.add(SizedBox(height: space));
      }

      items.add(widget);
    });

    return items;
  }
}
