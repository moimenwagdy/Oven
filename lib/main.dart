import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/providers/locale_provider/locale_provider.dart';
import 'package:oven/routing/app_router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oven/utils/constants/colors_schemas.dart';
import 'package:oven/utils/constants/theme_data.dart';
import 'package:oven/utils/helpers/initial_location_based_on_updated_needed.dart';
import 'l10n/app_localizations.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  preloadFonts();
  final initialRoute = await whereToNavigate();
  final router = appRouter(initialRoute);

  await Future.delayed(Duration(seconds: 5));
  runApp(ProviderScope(child: MyApp(router: router)));
}

class MyApp extends ConsumerWidget {
  final GoRouter router;
  const MyApp({super.key, required this.router});

  @override
  Widget build(BuildContext context, ref) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          theme: buildTheme(buildLightColorScheme()),
          darkTheme: buildTheme(buildDarkColorScheme()),
          title: "Oven",
          locale: ref.watch(appLocaleProvider).value,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [Locale('en'), Locale('ar')],
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system,
          routerConfig: router,
        );
      },
    );
  }
}

Future<void> preloadFonts() async {
  // English fonts
  final englishLoader = FontLoader('EnglishFont');
  englishLoader.addFont(
    rootBundle.load('lib/assets/fonts/Lobster-Regular.ttf'),
  );
  englishLoader.addFont(rootBundle.load('lib/assets/fonts/Poppins-Light.ttf'));
  englishLoader.addFont(rootBundle.load('lib/assets/fonts/Poppins-Bold.ttf'));

  // Arabic fonts
  final arabicLoader = FontLoader('ArabicFont');
  arabicLoader.addFont(rootBundle.load('lib/assets/fonts/Cairo-Regular.ttf'));
  arabicLoader.addFont(rootBundle.load('lib/assets/fonts/Cairo-Bold.ttf'));

  // Wait until all fonts are loaded
  await Future.wait([englishLoader.load(), arabicLoader.load()]);

  print("Fonts preloaded successfully!");
}
