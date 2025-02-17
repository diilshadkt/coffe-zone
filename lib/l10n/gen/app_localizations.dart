import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.dart';
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
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'CoffeZone'**
  String get appName;

  /// No description provided for @landingTitle.
  ///
  /// In en, this message translates to:
  /// **'Manage your own Coffee'**
  String get landingTitle;

  /// No description provided for @landingMessage.
  ///
  /// In en, this message translates to:
  /// **'The home for all your products and orders. Manage them all in one place.'**
  String get landingMessage;

  /// No description provided for @loginBtnLabel.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginBtnLabel;

  /// No description provided for @registerBtnLabel.
  ///
  /// In en, this message translates to:
  /// **'Signup'**
  String get registerBtnLabel;

  /// No description provided for @loginPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get loginPageTitle;

  /// No description provided for @loginPageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Login to continue.'**
  String get loginPageSubtitle;

  /// No description provided for @emailFieldLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailFieldLabel;

  /// No description provided for @passwordFieldLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordFieldLabel;

  /// No description provided for @createAccountBtnLabel.
  ///
  /// In en, this message translates to:
  /// **'Create Accoount'**
  String get createAccountBtnLabel;

  /// No description provided for @forgotPasswordLink.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPasswordLink;

  /// No description provided for @showPasswordLink.
  ///
  /// In en, this message translates to:
  /// **'Show'**
  String get showPasswordLink;

  /// No description provided for @hidePasswordLink.
  ///
  /// In en, this message translates to:
  /// **'Hide'**
  String get hidePasswordLink;

  /// No description provided for @signupPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get signupPageTitle;

  /// No description provided for @signupPageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Register an account.'**
  String get signupPageSubtitle;

  /// No description provided for @confirmPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPasswordLabel;

  /// No description provided for @emailRequiredError.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get emailRequiredError;

  /// No description provided for @passwordRequiredError.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get passwordRequiredError;

  /// No description provided for @passwordShortError.
  ///
  /// In en, this message translates to:
  /// **'Password must have atleast 8 characters'**
  String get passwordShortError;

  /// No description provided for @confirmNotMatchError.
  ///
  /// In en, this message translates to:
  /// **'Password do not match'**
  String get confirmNotMatchError;

  /// No description provided for @invalidEmailError.
  ///
  /// In en, this message translates to:
  /// **'Invalid email address'**
  String get invalidEmailError;

  /// No description provided for @confirmRequiredError.
  ///
  /// In en, this message translates to:
  /// **'Confirm password is required'**
  String get confirmRequiredError;

  /// No description provided for @sendResetEmailBtnLabel.
  ///
  /// In en, this message translates to:
  /// **'Send reset email'**
  String get sendResetEmailBtnLabel;

  /// No description provided for @verficationMailSentMessage.
  ///
  /// In en, this message translates to:
  /// **'Verification email sent to the email address. Please check your mail.'**
  String get verficationMailSentMessage;

  /// No description provided for @cannotSignupError.
  ///
  /// In en, this message translates to:
  /// **'Cannot create account. Try again'**
  String get cannotSignupError;

  /// No description provided for @emailNotVerified.
  ///
  /// In en, this message translates to:
  /// **'Your email is not verified. Please verify email to login.'**
  String get emailNotVerified;

  /// No description provided for @cannotLoginError.
  ///
  /// In en, this message translates to:
  /// **'Cannot login. Try again'**
  String get cannotLoginError;

  /// No description provided for @cannotLogoutError.
  ///
  /// In en, this message translates to:
  /// **'Cannot logout. Try again'**
  String get cannotLogoutError;

  /// No description provided for @passwordResetSentMessage.
  ///
  /// In en, this message translates to:
  /// **'Password reset link is sent to your account'**
  String get passwordResetSentMessage;

  /// No description provided for @cannotResetPasswordError.
  ///
  /// In en, this message translates to:
  /// **'Cannot reset your password. Try again'**
  String get cannotResetPasswordError;

  /// No description provided for @ordersBottomNavItem.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get ordersBottomNavItem;

  /// No description provided for @productsBottomNavItem.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get productsBottomNavItem;

  /// No description provided for @addCategoryBottomSheetTitle.
  ///
  /// In en, this message translates to:
  /// **'Add New Category'**
  String get addCategoryBottomSheetTitle;

  /// No description provided for @renameCategoryBottomSheetTitle.
  ///
  /// In en, this message translates to:
  /// **'Rename This Category'**
  String get renameCategoryBottomSheetTitle;

  /// No description provided for @deleteCategoryBottomSheetTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete This Category'**
  String get deleteCategoryBottomSheetTitle;

  /// No description provided for @submitButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submitButtonLabel;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
