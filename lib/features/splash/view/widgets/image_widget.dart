import 'package:flutter/material.dart';
import '../../../../core/utils/constants/app_images.dart';

class ImageWidget extends StatelessWidget {
  final AnimationController imageController;
  final AnimationController shimmerController;
  final Animation<double> imageScale;
  final Animation<double> imageOpacity;
  final Animation<double> imageSlide;
  final Animation<double> shimmer;

  const ImageWidget({
    super.key,
    required this.imageController,
    required this.shimmerController,
    required this.imageScale,
    required this.imageOpacity,
    required this.imageSlide,
    required this.shimmer,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: imageController,
      builder: (_, _) => Opacity(
        opacity: imageOpacity.value,
        child: Transform.translate(
          offset: Offset(0, imageSlide.value),
          child: Transform.scale(
            scale: imageScale.value,
            child: SizedBox(
              width: 550,
              height: 300,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      AppImages.splashLogo,
                      fit: BoxFit.contain,
                    ),
                  ),
                  _buildShimmerOverlay(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildShimmerOverlay() {
    return AnimatedBuilder(
      animation: shimmerController,
      builder: (_, _) => ClipRect(
        child: Align(
          alignment: Alignment(shimmer.value, 0),
          child: Transform.rotate(
            angle: -0.4,
            child: Container(
              width: 50,
              height: 300,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withValues(alpha: 0),
                    Colors.white.withValues(alpha: 0.30),
                    Colors.white.withValues(alpha: 0.45),
                    Colors.white.withValues(alpha: 0.30),
                    Colors.white.withValues(alpha: 0),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
