import 'package:flutter/material.dart';

import 'package:sportive/core/utils/constants/app_colors.dart';

/// Network image with a branded gradient placeholder, so screens keep their
/// composition even when the image is still loading or unavailable offline.
class UserNetworkImage extends StatelessWidget {
  const UserNetworkImage({
    super.key,
    required this.url,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.fallbackIcon = Icons.sports_tennis_rounded,
  });

  final String url;
  final BoxFit fit;
  final double? width;
  final double? height;
  final IconData fallbackIcon;

  @override
  Widget build(BuildContext context) {
    if (url.isEmpty) return _placeholder();

    return Image.network(
      url,
      width: width,
      height: height,
      fit: fit,
      loadingBuilder: (context, child, progress) =>
          progress == null ? child : _placeholder(),
      errorBuilder: (context, error, stackTrace) => _placeholder(),
    );
  }

  Widget _placeholder() => Container(
    width: width,
    height: height,
    decoration: const BoxDecoration(gradient: AppColors.cardGradient),
    child: Center(
      child: Icon(
        fallbackIcon,
        color: AppColors.primary200,
        size: 28,
      ),
    ),
  );
}
