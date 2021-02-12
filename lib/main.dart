import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Customize your Alert Dialog',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Customize your Alert Dialog'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var language = "Dart";

  _showAlertDialog() {
    final SetListTiles _setListTiles = new SetListTiles(
      language: language,
    );

    return showDialog(
      context: context,
      child: new AlertDialog(
        title: Text('Choose your favourite programming language!'),
        content: new SingleChildScrollView(
          child: Column(
            children: [
              _setListTiles,
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Abort'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                language = _setListTiles.language;
              });
              Navigator.pop(context);
            },
            child: Text('Confirm'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new FlatButton(
              color: Colors.grey[300],
              padding: EdgeInsets.all(8.0),
              onPressed: _showAlertDialog,
              child: Text(
                "Choose your favourite programming language!",
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Text(
              "Your favourite programming language is:",
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              language,
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        )));
  }
}

class SetListTiles extends StatefulWidget {
  String language;
  SetListTiles({Key key, this.language}) : super(key: key);

  @override
  _SetListTilesState createState() => _SetListTilesState();
}

class _SetListTilesState extends State<SetListTiles> {
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text('Dart'),
          leading: new Radio(
            value: "Dart",
            groupValue: widget.language,
            onChanged: (String selectedLanguage) {
              setState(() {
                widget.language = selectedLanguage;
              });
            },
          ),
        ),
        ListTile(
          title: Text('Java'),
          leading: new Radio(
            value: "Java",
            groupValue: widget.language,
            onChanged: (String selectedLanguage) {
              setState(() {
                widget.language = selectedLanguage;
              });
            },
          ),
        ),
        ListTile(
          title: Text('Python'),
          leading: new Radio(
            value: "Python",
            groupValue: widget.language,
            onChanged: (String selectedLanguage) {
              setState(() {
                widget.language = selectedLanguage;
              });
            },
          ),
        ),
      ],
    );
  }
}
