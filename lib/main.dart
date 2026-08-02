import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/cache/shared_preferences_manager.dart';
import 'core/services/dependency_injection.dart';
import 'core/utils/constants/app_colors.dart';
import 'core/utils/constants/app_context.dart';
import 'features/common/language/presentation/view_model/language_selection_cubit.dart';
import 'features/splash/view/screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SharedPref.init();
  await Injection().init();


  // Read saved locale — fallback to 'en' if not set yet
  final savedLocale = LanguageSelectionCubit.getSavedLocale() ?? const Locale('en');

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      startLocale: savedLocale,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: AppContext.navigatorKey,
        title: 'Sportiva',
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        // RTL support: auto-applied based on locale
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
          useMaterial3: true,
        ),
        home: child,
      ),
      child: const SplashScreen(),
    );
  }
}
