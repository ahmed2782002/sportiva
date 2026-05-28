import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../cache/shared_preferences_manager.dart';
import 'app_colors.dart';
import 'app_context.dart';
import 'app_strings.dart';

Future<void> launchUrlHelper({
  required String url,
  LaunchMode mode = LaunchMode.platformDefault,
  bool showToast = true,
}) async {
  try {
    if (!await launchUrl(Uri.parse(url), mode: mode) && showToast) {
      showToastMessage(url);
    }
  } catch (_) {
    if (showToast) showToastMessage(url);
  }
}

Future<void> makePhoneCall(String phoneNumber) {
  return launchUrlHelper(url: 'tel:$phoneNumber');
}

Future<void> openEmail(String email) {
  return launchUrlHelper(url: 'mailto:$email');
}

Future<void> openLink(String link) {
  return launchUrlHelper(url: link);
}

Future<void> openWhatsApp(String phoneNumber) async {
  final appUrl = 'https://wa.me/$phoneNumber';
  final webUrl = 'https://web.whatsapp.com/send?phone=$phoneNumber';
  try {
    await launchUrlHelper(url: appUrl);
  } catch (_) {
    await launchUrlHelper(url: webUrl);
  }
}

Future<void> openGoogleMaps(double? lat, double? lng) async {
  if (lat == null || lng == null) {
    showToastMessage('Location is not available');
    return;
  }

  final url = Uri.parse(
    'https://www.google.com/maps/search/?api=1&query=$lat,$lng',
  );
  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } else {
    showToastMessage('Could not open maps');
  }
}

Widget cachedImage(
  String? url, {
  double? height,
  Color? color,
  double? width,
  BoxFit? fit,
  Alignment? alignment,
  bool usePlaceholderIfUrlEmpty = true,
  double? radius,
}) {
  if (url == null || url.isEmpty) {
    return placeHolderWidget(height: height, width: width, radius: radius);
  }

  if (url.startsWith('http')) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? 0),
      child: Image.network(
        url,
        height: height,
        width: width,
        fit: fit ?? BoxFit.cover,
        color: color,
        alignment: alignment ?? Alignment.center,
        errorBuilder: (_, __, ___) =>
            placeHolderWidget(height: height, width: width, radius: radius),
      ),
    );
  }

  return ClipRRect(
    borderRadius: BorderRadius.circular(radius ?? 0),
    child: Image.asset(
      url,
      height: height,
      width: width,
      fit: fit ?? BoxFit.cover,
      alignment: alignment ?? Alignment.center,
      errorBuilder: (_, __, ___) =>
          placeHolderWidget(height: height, width: width, radius: radius),
    ),
  );
}

Widget placeHolderWidget({double? height, double? width, double? radius}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      color: AppColors.primaryColor,
      borderRadius: BorderRadius.circular(radius ?? 0),
    ),
    alignment: Alignment.center,
    child: Icon(Icons.image_outlined, color: AppColors.gray, size: 24.r),
  );
}

class FocusScopeDes extends StatelessWidget {
  const FocusScopeDes({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      behavior: HitTestBehavior.opaque,
      child: child,
    );
  }
}

void showToastMessage(String value, {Color? bgColor, Color? textColor}) {
  ScaffoldMessenger.of(AppContext.context).showSnackBar(
    SnackBar(
      backgroundColor: bgColor ?? AppColors.red,
      content: Text(
        value,
        style: TextStyle(
          color: textColor ?? AppColors.white,
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
  );
}

bool isGuest() => (SharedPref.getString('token') ?? '').isEmpty;

void showLoginRequiredDialog({required VoidCallback onLogin}) {
  showDialog(
    context: AppContext.context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      title: Text(
        AppString.loginRequired.tr(),
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
      ),
      content: Text(
        AppString.loginRequiredMessage.tr(),
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 14.sp, color: AppColors.gray),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            AppString.notNow.tr(),
            style: TextStyle(color: AppColors.gray),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
            onLogin();
          },
          child: Text(
            AppString.login.tr(),
            style: TextStyle(color: AppColors.white),
          ),
        ),
      ],
    ),
  );
}
