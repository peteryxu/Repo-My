import 'package:flutter/material.dart';

class SecondTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.green,
      body: new Container(
        child: new Center(
          child: new Column(
            // center the children
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Icon(
                Icons.adb,
                size: 160.0,
                color: Colors.white,
              ),
              new Text(
                "Second Tab",
                style: new TextStyle(color: Colors.white),
              ),
              RaisedButton(
              child: Text("Navigate to a named that accepts arguments"),
              onPressed: () {
                // When the user taps the button, navigate to a named route
                // and provide the arguments as an optional parameter.
                Navigator.pushNamed(
                  context,
                  PassArgumentsScreen.routeName,
                  arguments: ScreenArguments2(
                    'Accept Arguments Screen',
                    'This message is extracted in the onGenerateRoute function.',
                  ),
                );
              },
            ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScreenArguments2 {
  final String title;
  final String message;

  ScreenArguments2(this.title, this.message);
}

// A Widget that accepts the necessary arguments via the constructor.
class PassArgumentsScreen extends StatelessWidget {
  static const routeName = '/passArguments';

  final String title;
  final String message;

  // This Widget accepts the arguments as constructor parameters. It does not
  // extract the arguments from the ModalRoute.
  //
  // The arguments are extracted by the onGenerateRoute function provided to the
  // MaterialApp widget.
  const PassArgumentsScreen({
    Key key,
    @required this.title,
    @required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(message),
      ),
    );
  }
}
