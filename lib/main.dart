import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:in_app_update/in_app_update.dart';
import 'package:oven/routing/app_router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oven/notifires/locale_provider.dart';
import 'package:oven/utils/constants/theme_data.dart';
import 'package:oven/utils/helpers/initial_location_based_on_updated_needed.dart';
// import 'package:oven/widgets/update_check_before_app_start/in_app_update_check_before_app_start.dart';
import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final initialRoute = await whereToNavigate();
  final router = appRouter(initialRoute); // create once here

  await Future.delayed(Duration(seconds: 5));

  runApp(MyApp(router: router));
}

class MyApp extends StatelessWidget {
  final GoRouter router;
  const MyApp({super.key, required this.router});
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
              supportedLocales: [Locale('en'), Locale('ar')],
              debugShowCheckedModeBanner: false,
              theme: buildTheme(value, brightness: Brightness.light),
              darkTheme: buildTheme(value, brightness: Brightness.dark),
              themeMode: ThemeMode.system,
              routerConfig: router,
            );
          },
        );
      },
    );
  }
}
