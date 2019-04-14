import 'package:flutter/material.dart';
import './ui-pages/home.dart';
import './ui-pages/pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  /* This widget is the root of your application. It typically returns MaterialApp, 
  MaterialApp could be wrapped in  BLoC providers

    return LoginBlocProvider(
      child: GoalsBlocProvider(
        child: MaterialApp
  */

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter Template',

      theme: ThemeData(
        // This is the theme of your application. App wide settings
        //primarySwatch: Colors.amber,
        accentColor: Colors.black,
        primaryColor: Colors.blue[200],
      ),

      //Test Scafford, layout
      home: MyHomePage(title: 'Home'),
      
      //Test Navigation
      // home: FirstScreen(),

    );
  }
}

