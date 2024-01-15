import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double size;
  final Color? color;

  const Logo({super.key,
    required this.size,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.shopping_bag,
      color: color ?? Theme.of(context).primaryColor,
      size: size,
    );
  }
}
