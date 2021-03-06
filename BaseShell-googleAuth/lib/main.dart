import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:baseshell_googleauth/home/home.dart';
import 'package:baseshell_googleauth/login/login.dart';
import 'package:baseshell_googleauth/splash/splash.dart';
import 'package:baseshell_googleauth/simple_bloc_delegate.dart';
import './appshare/appshare.dart';

import './home/tabs/second.dart';

main() {
  BlocSupervisor().delegate = SimpleBlocDelegate();
  runApp(App());
}

class App extends StatefulWidget {
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final UserRepository _userRepository = UserRepository();
  AuthenticationBloc _authenticationBloc;
  LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _authenticationBloc = AuthenticationBloc(userRepository: _userRepository);
    _loginBloc = LoginBloc(
      userRepository: _userRepository,
      authenticationBloc: _authenticationBloc,
    );
    _authenticationBloc.dispatch(AppStarted());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: _authenticationBloc,
      child: MaterialApp(
        //initialRoute: '/',
        routes: {
          AppRoutes.home: (context) => HomeScreen(),
          AppRoutes.splash: (context) => SplashScreen(),
        },

        onGenerateRoute: (settings) {
          // If you push the PassArguments route
          if (settings.name == PassArgumentsScreen.routeName) {
            // Cast the arguments to the correct type: ScreenArguments.
            final ScreenArguments2 args = settings.arguments;

            // Then, extract the required data from the arguments and
            // pass the data to the correct screen.
            return MaterialPageRoute(
              builder: (context) {
                return PassArgumentsScreen(
                  title: args.title,
                  message: args.message,
                );
              },
            );
          }
        },

        home: BlocBuilder(
          bloc: _authenticationBloc,
          builder: (BuildContext context, AuthenticationState state) {
            if (state is Uninitialized) {
              return SplashScreen();
            }
            if (state is Unauthenticated) {
              return LoginScreen(loginBloc: _loginBloc);
            }
            if (state is Authenticated) {
              //return HomeScreen(name: state.user);
              return HomeScreen();
              //Navigator.pushNamed(context, AppRoutes.home);
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _authenticationBloc.dispose();
    _loginBloc.dispose();
    super.dispose();
  }
}
