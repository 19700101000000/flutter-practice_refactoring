import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:practice_refactoring/l10n/messages.dart';
import 'package:practice_refactoring/l10n/app_localizations_delegate.dart';
import 'package:practice_refactoring/pages/root_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (BuildContext context) => Messages.of(context).title,
      localizationsDelegates: [
        const AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('ja', ''),
      ],
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      // initialRoute: '/',
      // routes: {
      //   '/' : (context) => RootPage(),
      // },
      home: RootPage(),
    );
  }
}
