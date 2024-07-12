import 'package:coffee_zone/core/extensions/localization_extension.dart';
import 'package:coffee_zone/core/utils/snackbar_utils.dart';
import 'package:coffee_zone/features/auth/services/firebase_auth_services.dart';
import 'package:coffee_zone/main.dart';
import 'package:get_it/get_it.dart';

final class AuthController {
  late final FirebaseAuthServices authServices;

  AuthController() {
    authServices = GetIt.I.get();
  }

  Future<void> createAccount(String email, String password) async {
    try {
      await authServices.createAccount(email, password);
      await authServices.sendVerificationEmail();

      SnackbarUtils.showMessage(
          'Verification email sent to the email address. Please check your mail.');
    } catch (e) {
      SnackbarUtils.showMessage('Cannot create account. Try again');
    }
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return App.navigatorKey.currentContext!.text.emailFieldLabel;
    }

    final emailRegExp =
        RegExp(r'^([a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,})$');
    if (!emailRegExp.hasMatch(value)) {
      return App.navigatorKey.currentContext!.text.invalidEmailError;
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return App.navigatorKey.currentContext!.text.passwordRequiredError;
    }

    if (value.length < 8) {
      return App.navigatorKey.currentContext!.text.passwordShortError;
    }

    return null;
  }

  String? validateConfirm(String? password, String? confirm) {
    if (confirm == null || confirm.isEmpty) {
      return App.navigatorKey.currentContext!.text.confirmRequiredError;
    }

    if (confirm != password) {
      return App.navigatorKey.currentContext!.text.confirmNotMatchError;
    }

    return null;
  }
}