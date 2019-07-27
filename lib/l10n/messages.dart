// 各国語に対応しているメッセージを追加するには、次の手順に従うこと
//
// 1. 下記の Messages クラスに、既存のコードに倣いメソッドを追加する
// 2. 次のコマンドを実行すると、 lib/l10n/intl_messages.arb に新たに数行追加される
//    エラーが出ていないことを確認すること
//
//    flutter pub run intl_translation:extract_to_arb \
//      --locale=en --output-dir=lib/l10n lib/l10n/messages.dart
//
// 3. 日本語に対応するには、lib/l10n/intl_messages.arb に新たに追加された最初の１行をコピーし、
//    lib/l10n/intl_ja.arb にペーストし、日本語に書き直す
//      ! intl_*.arb の中身は、JSON形式なので、 `,` に注意すること
//      ! JSONは、配列の末尾に `,` を入れることが出来ない
// 4. 最後に次のコマンドを実行し、エラーが出ないことを確認する
//    エラーが出た場合は、３の注意事項を確認すること
//
//    flutter pub run intl_translation:generate_from_arb \
//      --output-dir=lib/l10n --no-use-deferred-loading \
//      lib/l10n/messages.dart lib/l10n/intl_*.arb

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:practice_refactoring/l10n/messages_all.dart';

class Messages {
  static Future<Messages> load(Locale locale) {
    final String name = locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return Messages();
    });
  }

  static Messages of(BuildContext context) {
    return Localizations.of<Messages>(context, Messages);
  }

  String get title => Intl.message('Hello, world', name: 'title');
  String helloUser(String name) => Intl.message('Hello, $name', name: 'helloUser', args: [name]);
  String get pleaseAddAnyComments => Intl.message('Please add any Comments', name: 'pleaseAddAnyComments');
  String get editYourName => Intl.message('Edit your name',name: 'editYourName');
}