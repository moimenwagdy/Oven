import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oven/notifires/locale_provider.dart';
import 'package:oven/routing/app_router.dart';
import 'package:oven/utils/constants/theme_data.dart';
import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(Duration(seconds: 5));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return ValueListenableBuilder(
          valueListenable: locale,
          builder: (context, value, child) {
            return MaterialApp.router(
              title: "Oven",
              locale: value,
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: [
                Locale('en'), // English
                Locale('ar'), // Spanish
              ],
              debugShowCheckedModeBanner: false,
              theme: buildTheme(),
              routerConfig: appRouter,
            );
          },
        );
      },
    );
  }
}
