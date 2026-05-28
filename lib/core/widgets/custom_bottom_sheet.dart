// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/constants/app_colors.dart';
// Project imports:

class NewCustomBottomSheet {
  const NewCustomBottomSheet._();

  static void showModalBottomSheetContainer({
    required BuildContext context,
    required Widget widget,
    Color? backgroundColor,
    bool? isScrollControlled,
    VoidCallback? whenComplete,
  }) => showModalBottomSheet<dynamic>(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    context: context,
    backgroundColor: backgroundColor ?? Colors.white,
    isScrollControlled: isScrollControlled ?? true,
    constraints: BoxConstraints(
      maxHeight: MediaQuery.of(context).size.height * 0.8,
      minHeight: 0,
    ),
    barrierColor: Colors.black.withValues(alpha: 0.5),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: widget,
      );
    },
  ).whenComplete(whenComplete ?? () {});

  static void showModalBottom(context, {required Widget child}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.9,
        minHeight: 0,
      ),
      backgroundColor: Colors.transparent,
      transitionAnimationController: AnimationController(
        duration: Duration(seconds: 1),
        vsync: Navigator.of(context),
      ),
      builder: (context) => CustomBottomSheet(child: child),
    );
  }

  static void showStripePaymentBottom(context, {required Widget child}) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      backgroundColor: AppColors.white,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return child;
      },
    );
  }
}

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      builder: (context, scrollController) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [child],
        );
      },
    );
  }
}
