import 'package:flutter/widgets.dart';

class JumpAnimationOptions {
  final bool active;
  final Duration duration;
  final Curve curve;

  const JumpAnimationOptions({
    this.active = true,
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.linearToEaseOut,
  });
}