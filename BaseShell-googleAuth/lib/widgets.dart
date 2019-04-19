import 'package:flutter/material.dart';
import './home/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './authentication/bloc/bloc.dart';

class DrawerOnly extends StatelessWidget {
  @override
  Widget build (BuildContext ctxt) {
    return new Drawer(
        child: new ListView(
          children: <Widget>[
            new DrawerHeader(
              child: new Text("DRAWER HEADER.."),
              decoration: new BoxDecoration(
                  color: Colors.orange
              ),
            ),
            new ListTile(
              title: new Text("Home"),
              onTap: () {
                Navigator.pop(ctxt);
                Navigator.push(ctxt,
                    //new MaterialPageRoute(builder: (ctxt) => HomeScreen(user: null,)));
                    new MaterialPageRoute(builder: (ctxt) => HomeScreen()));
              },
            ),
            new ListTile(
              title: new Text("Settings"),
              onTap: () {
                Navigator.pop(ctxt);
                Navigator.push(ctxt,
                    new MaterialPageRoute(builder: (ctxt) => HomeScreen()));
              },
            ),
            Center(
            child: RaisedButton(
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(ctxt).dispatch(Logout());
              },
              child: Text('Sign Out'),
            ),
          ),
        ],
      
        )
    );
  }
}