import 'package:flutter/widgets.dart';

class DragToCartAnimationOptions {
  final Duration duration;
  final bool rotation;
  final Curve curve;

  const DragToCartAnimationOptions({
    this.duration = const Duration(milliseconds: 1000),
    this.curve = Curves.easeIn,
    this.rotation = false,
  });
}