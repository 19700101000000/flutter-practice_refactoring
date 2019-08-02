import 'package:flutter/material.dart';
import 'package:practice_refactoring/l10n/messages.dart';

class AddCommentPage extends StatefulWidget {
  @override
  _AddCommentPageState createState() => _AddCommentPageState();
}

class _AddCommentPageState extends State<AddCommentPage> {
  TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Messages.of(context).addAComment),
        actions: <Widget>[
          IconButton(
            onPressed: () => Navigator.pop(context, controller.text),
            icon: Icon(Icons.save_alt),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            autofocus: true,
            controller: controller,
            decoration: InputDecoration(
              hintText: Messages.of(context).pleaseInputAComment,
            ),
          ),
        ),
      ),
    );
  }
}