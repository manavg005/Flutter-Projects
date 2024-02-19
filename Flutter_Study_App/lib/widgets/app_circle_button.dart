import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({super.key, required this.child, this.color, this.onTap});
  final Widget child;
  final Color? color;
  final double width = 60;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: CircleBorder(),
      child: InkWell(
        child: child,
      ),
    );
  }
}
