import 'package:flutter/material.dart';
import 'package:practice_refactoring/l10n/messages.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<Messages> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => [
    'en',
    'ja',
  ].contains(locale.languageCode);

  @override
  Future<Messages> load(Locale locale) => Messages.load(locale);

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
