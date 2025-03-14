import 'dart:math';

import 'drag_to_cart_animation_options.dart';

import 'jump_animation_options.dart';
import 'add_to_cart_icon.dart';
import 'globalkeyext.dart';
import 'package:flutter/material.dart';

export 'add_to_cart_icon.dart';
export 'jump_animation_options.dart';
export 'drag_to_cart_animation_options.dart';

class _PositionedAnimationModel {
  bool showAnimation = false;
  bool animationActive = false;
  Offset imageSourcePoint = Offset.zero;
  Offset imageDestPoint = Offset.zero;
  Size imageSourceSize = Size.zero;
  Size imageDestSize = Size.zero;
  bool rotation = false;
  double opacity = 0.85;
  late Container container;
  Duration duration = Duration.zero;
  Curve curve = Curves.easeIn;
}

/// An add to cart animation which provide you an animation by sliding the product to cart in the Flutter app
class AddToCartAnimation extends StatefulWidget {
  final Widget child;
  final GlobalKey<CartIconKey> cartKey;
  final Function(Future<void> Function(GlobalKey)) createAddToCartAnimation;
  final double height;
  final double width;
  final double opacity;
  final JumpAnimationOptions jumpAnimation;
  final DragToCartAnimationOptions dragAnimation;

  const AddToCartAnimation({
    Key? key,
    required this.child,
    required this.cartKey,
    required this.createAddToCartAnimation,
    this.height = 30,
    this.width = 30,
    this.opacity = 0.85,
    this.jumpAnimation = const JumpAnimationOptions(),
    this.dragAnimation = const DragToCartAnimationOptions(),
  }) : super(key: key);

  @override
  _AddToCartAnimationState createState() => _AddToCartAnimationState();
}

class _AddToCartAnimationState extends State<AddToCartAnimation> {
  List<_PositionedAnimationModel> animationModels = [];

  @override
  void initState() {
    this.widget.createAddToCartAnimation(runAddToCartAnimation);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        Positioned.fill(
          child: Stack(
            children: animationModels
                .map<Widget>((model) => model.showAnimation
                    ? AnimatedPositioned(
                        top: model.animationActive
                            ? model.imageDestPoint.dx
                            : model.imageSourcePoint.dx,
                        left: model.animationActive
                            ? model.imageDestPoint.dy
                            : model.imageSourcePoint.dy,
                        height: model.animationActive
                            ? model.imageDestSize.height
                            : model.imageSourceSize.height,
                        width: model.animationActive
                            ? model.imageDestSize.width
                            : model.imageSourceSize.width,
                        duration: model.duration,
                        curve: model.curve,
                        child: model.rotation
                            ? TweenAnimationBuilder(
                                tween: Tween<double>(begin: 0, end: pi * 2),
                                duration: model.duration,
                                child: model.container,
                                builder: (context, double value, widget) {
                                  return Transform.rotate(
                                    angle: value,
                                    child: Opacity(
                                      opacity: model.opacity,
                                      child: widget,
                                    ),
                                  );
                                },
                              )
                            : Opacity(
                                opacity: model.opacity,
                                child: model.container,
                              ),
                      )
                    : Container())
                .toList(),
          ),
        ),
      ],
    );
  }

  Future<void> runAddToCartAnimation(GlobalKey widgetKey) async {
    _PositionedAnimationModel animationModel = _PositionedAnimationModel()
      ..rotation = false
      ..opacity = widget.opacity;

    animationModel.imageSourcePoint = Offset(
        widgetKey.globalPaintBounds!.top, widgetKey.globalPaintBounds!.left);

    // Improvement/Suggestion 1: Provinding option, in order to, use/or not initial "jumping" on image
    var startingHeight = widget.jumpAnimation.active
        ? widgetKey.currentContext!.size!.height
        : 0;
    animationModel.imageDestPoint = Offset(
        widgetKey.globalPaintBounds!.top - (startingHeight + widget.height),
        widgetKey.globalPaintBounds!.left);

    animationModel.imageSourceSize = Size(widgetKey.currentContext!.size!.width,
        widgetKey.currentContext!.size!.height);

    animationModel.imageDestSize = Size(
        widgetKey.currentContext!.size!.width + widget.width,
        widgetKey.currentContext!.size!.height + widget.height);

    animationModels.add(animationModel);
    animationModel.container = Container(
      child: (widgetKey.currentWidget! as Container).child,
    );

    animationModel.showAnimation = true;

    setState(() {});

    await Future.delayed(Duration(milliseconds: 75));

    animationModel.curve = widget.jumpAnimation.curve;
    animationModel.duration =
        widget.jumpAnimation.duration;
    animationModel.animationActive = true;
    setState(() {});

    await Future.delayed(animationModel.duration);
    animationModel.curve = widget.dragAnimation.curve;
    animationModel.rotation = widget.dragAnimation.rotation;
    animationModel.duration =
        widget.dragAnimation.duration;

    animationModel.imageDestPoint = Offset(
        this.widget.cartKey.globalPaintBounds!.top,
        this.widget.cartKey.globalPaintBounds!.left);

    animationModel.imageDestSize = Size(
        this.widget.cartKey.currentContext!.size!.width,
        this.widget.cartKey.currentContext!.size!.height);

    setState(() {});

    await Future.delayed(animationModel.duration);
    animationModel.showAnimation = false;
    animationModel.animationActive = false;

    setState(() {});

    return;
  }
}