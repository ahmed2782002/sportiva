import 'package:flutter/material.dart';

class OnboardingEntranceAnimation extends StatefulWidget {
  final Widget child;

  const OnboardingEntranceAnimation({
    super.key,
    required this.child,
  });

  @override
  State<OnboardingEntranceAnimation> createState() =>
      _OnboardingEntranceAnimationState();
}

class _OnboardingEntranceAnimationState
    extends State<OnboardingEntranceAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    )..forward();
    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _slide = Tween<Offset>(
      begin: const Offset(0, 0.05),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => FadeTransition(
    opacity: _fade,
    child: SlideTransition(
      position: _slide,
      child: widget.child,
    ),
  );
}
