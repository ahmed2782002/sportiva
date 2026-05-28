// Flutter imports:
import 'package:flutter/material.dart';

class CustomAnimation extends StatefulWidget {
  const CustomAnimation({
    super.key,
    required this.child,
    this.duration,
    this.curve,
    this.begin,
    this.end,
  });

  final Widget child;
  final Duration? duration;
  final Curve? curve;
  final double? begin;
  final double? end;

  @override
  State<CustomAnimation> createState() => _CustomAnimationState();
}

class _CustomAnimationState extends State<CustomAnimation>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  Widget get child => widget.child;

  Duration? get duration => widget.duration;

  double? get begin => widget.begin;

  double? get end => widget.end;

  Curve? get curve => widget.curve;

  @override
  void initState() {
    super.initState();

    _scaleController = AnimationController(
      duration: duration ?? const Duration(milliseconds: 600),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: begin ?? 1.3, end: end ?? 1.0)
        .animate(
          CurvedAnimation(
            parent: _scaleController,
            curve: curve ?? Curves.easeInBack,
          ),
        );
    _scaleController.forward();
  }

  @override
  void dispose() {
    _scaleController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(scale: _scaleAnimation, child: child);
  }
}
