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

  @override
  String get loginPageTitle => 'Welcome Back';

  @override
  String get loginPageSubtitle => 'Login to continue.';

  @override
  String get emailFieldLabel => 'Email';

  @override
  String get passwordFieldLabel => 'Password';

  @override
  String get createAccountBtnLabel => 'Create Accoount';

  @override
  String get forgotPasswordLink => 'Forgot Password?';

  @override
  String get showPasswordLink => 'Show';

  @override
  String get hidePasswordLink => 'Hide';

  @override
  String get signupPageTitle => 'Get Started';

  @override
  String get signupPageSubtitle => 'Register an account.';

  @override
  String get confirmPasswordLabel => 'Confirm Password';

  @override
  String get emailRequiredError => 'Email is required';

  @override
  String get passwordRequiredError => 'Password is required';

  @override
  String get passwordShortError => 'Password must have atleast 8 characters';

  @override
  String get confirmNotMatchError => 'Password do not match';

  @override
  String get invalidEmailError => 'Invalid email address';

  @override
  String get confirmRequiredError => 'Confirm password is required';
}
