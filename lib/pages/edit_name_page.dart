import 'package:flutter/material.dart';
import 'package:practice_refactoring/l10n/messages.dart';

class EditNamePage extends StatefulWidget {
  final userName;
  EditNamePage(this.userName);
  @override
  _EditNamePageState createState() => _EditNamePageState();
}

class _EditNamePageState extends State<EditNamePage> {
  TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.userName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Messages.of(context).editYourName),
        actions: <Widget>[
          IconButton(
            onPressed: () => Navigator.pop(context, controller.text),
            icon: Icon(Icons.save_alt),
          )
        ],
      ),
      body: Center(
        child: TextField(
          autofocus: true,
          controller: controller,
          decoration: InputDecoration(
            hintText: Messages.of(context).editYourName,
          ),
        ),
      ),
    );
  }
}