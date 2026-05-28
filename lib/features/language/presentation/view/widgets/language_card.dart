import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_text_font.dart';
import '../../../data/model/language_model.dart';

class LanguageCard extends StatefulWidget {
  final LanguageModel language;
  final bool isSelected;
  final VoidCallback onTap;

  const LanguageCard({
    super.key,
    required this.language,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<LanguageCard> createState() => _LanguageCardState();
}

class _LanguageCardState extends State<LanguageCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnim;
  late final Animation<double> _checkAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 280),
    );
    _scaleAnim = Tween<double>(begin: 1.0, end: 0.975).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _checkAnim = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );
  }

  @override
  void didUpdateWidget(LanguageCard old) {
    super.didUpdateWidget(old);
    widget.isSelected ? _controller.forward() : _controller.reverse();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnim,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 280),
          curve: Curves.easeOut,
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 22.h),
          decoration: BoxDecoration(
            color: widget.isSelected ? AppColors.primaryColor : AppColors.white,
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(
              color: widget.isSelected
                  ? AppColors.primaryColor
                  : AppColors.borderSubtle,
              width: widget.isSelected ? 2 : 1.5,
            ),
            boxShadow: widget.isSelected
                ? [
                    BoxShadow(
                      color: AppColors.primaryColor.withValues(alpha: 0.30),
                      blurRadius: 28,
                      offset: const Offset(0, 10),
                    ),
                  ]
                : [
                    BoxShadow(
                      color: AppColors.black.withValues(alpha: 0.05),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
          ),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Row(
              children: [
                _FlagContainer(
                  flag: widget.language.flag,
                  isSelected: widget.isSelected,
                ),
                SizedBox(width: 18.w),
                Expanded(
                  child: _CardTexts(
                    nativeName: widget.language.nativeName,
                    englishName: widget.language.englishName,
                    isSelected: widget.isSelected,
                  ),
                ),
                _CheckIndicator(
                  checkAnim: _checkAnim,
                  isSelected: widget.isSelected,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ── sub widgets ──────────────────────────────────────────────────────────────

class _FlagContainer extends StatelessWidget {
  final String flag;
  final bool isSelected;

  const _FlagContainer({required this.flag, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56.w,
      height: 56.h,
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.white.withValues(alpha: 0.15)
            : AppColors.primaryLighter,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Center(
        child: Text(flag, style: TextStyle(fontSize: 28.sp)),
      ),
    );
  }
}

class _CardTexts extends StatelessWidget {
  final String nativeName;
  final String englishName;
  final bool isSelected;

  const _CardTexts({
    required this.nativeName,
    required this.englishName,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          nativeName,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontManger.bold,
            color: isSelected ? AppColors.white : AppColors.primaryDark,
            letterSpacing: -0.3,
          ),
        ),
        SizedBox(height: 3.h),
        Text(
          englishName,
          style: TextStyle(
            fontSize: 13.sp,
            color: isSelected
                ? AppColors.white.withValues(alpha: 0.65)
                : AppColors.primaryLight,
            letterSpacing: 0.2,
          ),
        ),
      ],
    );
  }
}

class _CheckIndicator extends StatelessWidget {
  final Animation<double> checkAnim;
  final bool isSelected;

  const _CheckIndicator({required this.checkAnim, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: checkAnim,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: 28.w,
        height: 28.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? AppColors.white : AppColors.colorTransparent,
          border: isSelected
              ? null
              : Border.all(color: AppColors.borderSubtle, width: 1.5),
        ),
        child: isSelected
            ? Icon(Icons.check_rounded, color: AppColors.primaryColor, size: 18.sp)
            : null,
      ),
    );
  }
}
