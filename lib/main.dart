import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:practice_refactoring/l10n/messages.dart';
import 'package:practice_refactoring/l10n/app_localizations_delegate.dart';

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
      home: RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {

  RootPage({Key key}) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final _commentList = List<String>();
  String _userName;

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(Messages.of(context).title),
    );
  }

  Widget _buildListView(BuildContext context) {
    return Container();
  }

  Widget _buildMessage(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            Messages.of(context).hello_user(_userName),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
          ),
          Text(Messages.of(context).please_add_any_comments),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return _commentList.length > 0
      ? _buildListView(context)
      : _buildMessage(context);
  }

  Widget _buildActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: null,
      tooltip: 'Add a Comment',
      child: Icon(Icons.add),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
      floatingActionButton: _buildActionButton(context),
    );
  }
}
