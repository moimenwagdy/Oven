import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @helloWorld.
  ///
  /// In en, this message translates to:
  /// **'Hello World!'**
  String get helloWorld;

  /// No description provided for @currentMerchant.
  ///
  /// In en, this message translates to:
  /// **'Current Customer'**
  String get currentMerchant;

  /// No description provided for @newMerchant.
  ///
  /// In en, this message translates to:
  /// **'New Customer'**
  String get newMerchant;

  /// No description provided for @personalCustomer.
  ///
  /// In en, this message translates to:
  /// **'Personal Customer'**
  String get personalCustomer;

  /// No description provided for @tradingOperations.
  ///
  /// In en, this message translates to:
  /// **'Business orders'**
  String get tradingOperations;

  /// No description provided for @personalOperations.
  ///
  /// In en, this message translates to:
  /// **'Personal orders'**
  String get personalOperations;

  /// No description provided for @signinWelcomeMainMessage.
  ///
  /// In en, this message translates to:
  /// **'Welcome!'**
  String get signinWelcomeMainMessage;

  /// No description provided for @signinWelcomeSecondMessage.
  ///
  /// In en, this message translates to:
  /// **'Let\'s login to continue exploring'**
  String get signinWelcomeSecondMessage;

  /// No description provided for @signupWelcomeMainMessage.
  ///
  /// In en, this message translates to:
  /// **'Create Your Account'**
  String get signupWelcomeMainMessage;

  /// No description provided for @signupWelcomeSecondMessage.
  ///
  /// In en, this message translates to:
  /// **'Create account to explore products'**
  String get signupWelcomeSecondMessage;

  /// No description provided for @skipToProducts.
  ///
  /// In en, this message translates to:
  /// **'Skip To Products'**
  String get skipToProducts;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @orUseCredentials.
  ///
  /// In en, this message translates to:
  /// **'Or use credentials'**
  String get orUseCredentials;

  /// No description provided for @signupWith.
  ///
  /// In en, this message translates to:
  /// **'Sign up with'**
  String get signupWith;

  /// No description provided for @orUseEmail.
  ///
  /// In en, this message translates to:
  /// **'Or with email'**
  String get orUseEmail;

  /// No description provided for @enterEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get enterEmail;

  /// No description provided for @enterPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get enterPassword;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password ?'**
  String get forgotPassword;

  /// No description provided for @connectOptions.
  ///
  /// In en, this message translates to:
  /// **'Login or Sign up with'**
  String get connectOptions;

  /// No description provided for @haveNoAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get haveNoAccount;

  /// No description provided for @haveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Have an account ?'**
  String get haveAnAccount;

  /// No description provided for @signup.
  ///
  /// In en, this message translates to:
  /// **' Sign up'**
  String get signup;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @userName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get userName;

  /// No description provided for @enterUserName.
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get enterUserName;

  /// No description provided for @merchantName.
  ///
  /// In en, this message translates to:
  /// **'Merchant name'**
  String get merchantName;

  /// No description provided for @enterMerchantName.
  ///
  /// In en, this message translates to:
  /// **'Enter merchant name'**
  String get enterMerchantName;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading'**
  String get loading;

  /// No description provided for @confirmPasswrod.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPasswrod;

  /// No description provided for @repeatPasswrod.
  ///
  /// In en, this message translates to:
  /// **'Repeat your password'**
  String get repeatPasswrod;

  /// No description provided for @enterphoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number'**
  String get enterphoneNumber;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @area.
  ///
  /// In en, this message translates to:
  /// **'Area'**
  String get area;

  /// No description provided for @allowedAreas.
  ///
  /// In en, this message translates to:
  /// **'Delivery allowed only in alexandria.'**
  String get allowedAreas;

  /// No description provided for @selectArea.
  ///
  /// In en, this message translates to:
  /// **'Select area'**
  String get selectArea;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @enterAddress.
  ///
  /// In en, this message translates to:
  /// **'Write your address'**
  String get enterAddress;

  /// No description provided for @moreInfo.
  ///
  /// In en, this message translates to:
  /// **'More information'**
  String get moreInfo;

  /// No description provided for @enterMoreInfo.
  ///
  /// In en, this message translates to:
  /// **'Additional information'**
  String get enterMoreInfo;

  /// No description provided for @customerCode.
  ///
  /// In en, this message translates to:
  /// **'Customer code'**
  String get customerCode;

  /// No description provided for @enterCustomerCode.
  ///
  /// In en, this message translates to:
  /// **'Enter your code'**
  String get enterCustomerCode;

  /// No description provided for @stepTwo.
  ///
  /// In en, this message translates to:
  /// **'Additional details'**
  String get stepTwo;

  /// No description provided for @completeTheForm.
  ///
  /// In en, this message translates to:
  /// **'Complete The Form'**
  String get completeTheForm;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// No description provided for @enterCity.
  ///
  /// In en, this message translates to:
  /// **'Enter you city'**
  String get enterCity;

  /// No description provided for @customerCodeInformation.
  ///
  /// In en, this message translates to:
  /// **'Enter customer code, or contact us to get code, and once you finish signing up process we will contact you. '**
  String get customerCodeInformation;

  /// No description provided for @customerCodeGuide.
  ///
  /// In en, this message translates to:
  /// **'Customer code guide'**
  String get customerCodeGuide;

  /// No description provided for @countinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get countinue;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
