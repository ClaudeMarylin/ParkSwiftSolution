// ignore_for_file: unused_import

import 'dart:async';
import 'package:flutter/material.dart';

class DealyedAniamtion extends StatefulWidget {
  final Widget child;
  final int delay;
  const DealyedAniamtion({required this.delay, required this.child});

  @override
  State<DealyedAniamtion> createState() => _DealyedAniamtionState();
}

class _DealyedAniamtionState extends State<DealyedAniamtion>
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
