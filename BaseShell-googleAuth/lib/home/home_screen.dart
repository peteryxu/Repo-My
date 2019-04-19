//import 'package:baseshell_googleauth/home/bloc/tab_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import './bloc/bloc.dart';
import './tabs/tabs.dart';
import '../widgets.dart';


import 'package:baseshell_googleauth/authentication/authentication.dart';

/* class HomeScreen extends StatelessWidget {
  final String name;

  HomeScreen({Key key, @required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Firebase Authentication'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(child: Text('Welcome $name!')),
          Center(
            child: RaisedButton(
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(context).dispatch(Logout());
              },
              child: Text('Sign Out'),
            ),
          ),
        ],
      ),
    );
  }
} */


class HomeScreen extends StatefulWidget {
   //final String name;
   //final FirebaseUser user;

  //HomeScreen({Key key, @required this.user}) : super(key: key);

  @override
  HomeScreenState createState() => new HomeScreenState();
}

// SingleTickerProviderStateMixin is used for animation
class HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  // Create a tab controller
  TabController controller;

  @override
  void initState() {
    super.initState();

    // Initialize the Tab Controller
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      drawer: new DrawerOnly(),  
      // Appbar
      appBar: new AppBar(
        // Title
        title: new Text("Chapel Hill Connect"),
        // Set the background color of the App Bar
        backgroundColor: Colors.blue,
      ),
      // Set the TabBar view as the body of the Scaffold
      body: new TabBarView(
        // Add tabs as widgets
        //children: <Widget>[new FirstTab(name: widget.user), new SecondTab(), new ThirdTab()],
        children: <Widget>[new FirstTab(), new SecondTab(), new ThirdTab()],
        // set the controller
        controller: controller,
      ),
      // Set the bottom navigation bar
      bottomNavigationBar: new Material(
        // set the color of the bottom navigation bar
        color: Colors.blue,
        // set the tab bar as the child of bottom navigation bar
        child: new TabBar(
          tabs: <Tab>[
            new Tab(
              // set icon to the tab
              icon: new Icon(Icons.favorite),
            ),
            new Tab(
              icon: new Icon(Icons.add_call),
            ),
            new Tab(
              icon: new Icon(Icons.airport_shuttle),
            ),
          ],
          // setup the controller
          controller: controller,
        ),
      ),
    );
  }
}