import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './authentication/bloc/bloc.dart';
import './appshare.dart';

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
                Navigator.pushNamed(ctxt, AppRoutes.home);
              },
            ),
            new ListTile(
              title: new Text("Settings"),
              onTap: () {
                Navigator.pop(ctxt);
                Navigator.pushNamed(ctxt, AppRoutes.home);
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