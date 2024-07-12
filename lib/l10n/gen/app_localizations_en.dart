import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'CoffeZone';

  @override
  String get landingTitle => 'Manage your own Coffee';

  @override
  String get landingMessage => 'The home for all your products and orders. Manage them all in one place.';

  @override
  String get loginBtnLabel => 'Login';

  @override
  String get registerBtnLabel => 'Signup';
}
