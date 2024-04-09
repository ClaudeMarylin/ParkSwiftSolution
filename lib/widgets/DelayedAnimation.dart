import 'package:flutter/material.dart';
import 'dart:async';



class DelayedAnimation extends StatefulWidget {
  final Widget child;
  final int delay;
  const DelayedAnimation({required this.delay, required this.child});

  @override
  State<DelayedAnimation> createState() => _DelayedAnimationState();
}
class _DelayedAnimationState extends State<DelayedAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  // controller et offset permettent de controller et de preciser le comportement de la methode
  late Animation<Offset> _animOffset;
//  StatefulWidget

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    final curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.decelerate,
    );

    _animOffset = Tween<Offset>(
      begin: Offset(0.0, -0.35),
      end: Offset.zero,
    ).animate(curvedAnimation);

    Timer(Duration(milliseconds: widget.delay), () {
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: SlideTransition(
        position: _animOffset,
        child: widget.child,
      ),
    );
  }
}
