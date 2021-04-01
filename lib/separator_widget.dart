import 'package:flutter/material.dart';

class SeparatorWidget extends StatelessWidget {
  final Axis axis;

  SeparatorWidget({required this.axis});

  @override
  Widget build(BuildContext context) {
    Widget widget = axis == Axis.horizontal
        ? Divider(
            height: 40,
            thickness: 1,
          )
        : VerticalDivider(
            width: 40,
            thickness: 1,
          );
    return widget;
  }
}
