import 'package:flutter/material.dart';
import 'package:practice_refactoring/pages/add_comment_page.dart';
import 'package:practice_refactoring/utils/categories.dart';
import 'package:practice_refactoring/pages/edit_name_page.dart';
import 'package:practice_refactoring/pages/empty_page.dart';

class AppNavigators {
  static Future<dynamic> push(BuildContext context, Categories category, {dynamic arg}) async {
    return await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          switch(category) {
            case Categories.edit_name:
              return EditNamePage(arg is String
                ? arg
                : '');
            case Categories.add_comment:
              return AddCommentPage();
            default:
              return EmptyPage();
          }
        }
      ),
    );
  }
}