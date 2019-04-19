import 'package:flutter/material.dart';

class ThirdTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.orange,
      body: new Container(
        child: new Center(
          child: new Column(
            // center the children
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Icon(
                Icons.airport_shuttle,
                size: 160.0,
                color: Colors.white,
              ),
              new Text(
                "Third Tab",
                style: new TextStyle(color: Colors.white),
              ),
              RaisedButton(
              child: Text("Navigate to screen that extracts arguments"),
              onPressed: () {
                // When the user taps the button, navigate to the specific route
                // and provide the arguments as part of the RouteSettings.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExtractArgumentsScreen(),
                    // Pass the arguments as part of the RouteSettings. The
                    // ExtractArgumentScreen reads the arguments from these
                    // settings.
                    settings: RouteSettings(
                      arguments: ScreenArguments3(
                        'Extract Arguments Screen',
                        'This message is extracted in the build method.',
                      ),
                    ),
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

// A Widget that extracts the necessary arguments from the ModalRoute.
class ExtractArgumentsScreen extends StatelessWidget {
  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute settings and cast
    // them as ScreenArguments.
    final ScreenArguments3 args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: Text(args.message),
      ),
    );
  }
}



// You can pass any object to the arguments parameter. In this example, create a
// class that contains both a customizable title and message.
class ScreenArguments3 {
  final String title;
  final String message;

  ScreenArguments3(this.title, this.message);
}



class ThirdTab2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // A button that navigates to a named route that. The named route
            // extracts the arguments by itself.
            RaisedButton(
              child: Text("Navigate to screen that extracts arguments"),
              onPressed: () {
                // When the user taps the button, navigate to the specific route
                // and provide the arguments as part of the RouteSettings.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExtractArgumentsScreen(),
                    // Pass the arguments as part of the RouteSettings. The
                    // ExtractArgumentScreen reads the arguments from these
                    // settings.
                    settings: RouteSettings(
                      arguments: ScreenArguments3(
                        'Extract Arguments Screen',
                        'This message is extracted in the build method.',
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

