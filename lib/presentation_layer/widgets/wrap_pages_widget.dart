import 'package:flutter/material.dart';

class WrapPagesWidget extends StatelessWidget {
  const WrapPagesWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(
        top: 10.0,
        right: 10.0,
        left: 10.0,
        bottom: 20.0,
      ),
      child: child,
    );
  }
}
