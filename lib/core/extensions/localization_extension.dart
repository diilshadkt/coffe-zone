import 'package:coffee_zone/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';

extension Localization on BuildContext {
  AppLocalizations get text {
    return AppLocalizations.of(this)!;
  }
}
