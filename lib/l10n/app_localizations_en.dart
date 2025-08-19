// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get helloWorld => 'Hello World!';

  @override
  String get currentMerchant => 'Current User';

  @override
  String get newMerchant => 'New User';

  @override
  String get personalCustomer => 'Personal Customer';

  @override
  String get welcomeMainMessage => 'Welcome Back!';

  @override
  String get welcomeSecondMessage => 'Let\'s login to continue exploring';

  @override
  String get skipToProducts => 'Skip To Products';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get enterEmail => 'Enter your email';

  @override
  String get enterPassword => 'Enter your password';

  @override
  String get forgotPassword => 'Forgot password ?';

  @override
  String get connectOptions => 'You can connect with';

  @override
  String get haveNoAccount => 'Don\'t have an account?';

  @override
  String get signup => ' Sign up';
}
