// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ja locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

// ignore: unnecessary_new
final messages = new MessageLookup();

// ignore: unused_element
final _keepAnalysisHappy = Intl.defaultLocale;

// ignore: non_constant_identifier_names
typedef MessageIfAbsent(String message_str, List args);

class MessageLookup extends MessageLookupByLibrary {
  get localeName => 'ja';

  static m0(name) => "${name}さん、こんにちは";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "addAComment" : MessageLookupByLibrary.simpleMessage("コメントを追加"),
    "editYourName" : MessageLookupByLibrary.simpleMessage("名前を編集"),
    "helloUser" : m0,
    "noName" : MessageLookupByLibrary.simpleMessage("名無し"),
    "pleaseAddAnyComments" : MessageLookupByLibrary.simpleMessage("コメントを追加してください"),
    "pleaseInputYourName" : MessageLookupByLibrary.simpleMessage("名前を入力してください"),
    "title" : MessageLookupByLibrary.simpleMessage("こんにちは、世界")
  };
}
