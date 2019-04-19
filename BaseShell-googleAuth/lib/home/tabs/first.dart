import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../appshare/appshare.dart';

class FirstTab extends StatelessWidget {
  //final String name;
  //FirstTab({Key key, @required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final AuthenticationBloc authenticationBloc =
        BlocProvider.of<AuthenticationBloc>(context);
    
    FirebaseUser  fuser;
    final  currentState =  authenticationBloc.currentState;
    if (currentState is Authenticated) {
       fuser = currentState.user;
    }

    final email = fuser == null? "": fuser.email;

    return new Scaffold(
      backgroundColor: Colors.red,
      body: new Container(
        child: new Center(
          child: new Column(
            // center the children
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Icon(
                Icons.favorite,
                size: 160.0,
                color: Colors.white,
              ),
              new Text(
                    'Welcome, $email',
                style: new TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
