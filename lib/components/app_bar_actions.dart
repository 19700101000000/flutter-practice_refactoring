import 'package:flutter/material.dart';
import 'package:practice_refactoring/l10n/messages.dart';
import 'package:practice_refactoring/utils/categories.dart';

class AppBarActions {
  static String _title(BuildContext context, Categories category) {
    switch (category) {
      case Categories.edit_name:
        return Messages.of(context).editYourName;
      default:
        return null;
    }
  }

  static List<Widget> root(BuildContext context, {void Function(Categories) onSelected}) {
    final items = <Categories>[
      Categories.edit_name,
    ];
    return <Widget>[
      PopupMenuButton<Categories>(
        onSelected: onSelected,
        itemBuilder: (BuildContext context) {
          return items.map((Categories category) {
            return PopupMenuItem<Categories>(
              value: category,
              child: Text(_title(context, category)),
            );
          }).toList();
        },
      )
    ];
  }
}