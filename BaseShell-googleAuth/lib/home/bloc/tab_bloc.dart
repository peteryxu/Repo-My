import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:baseshell_googleauth/home/home.dart';

class TabBloc extends Bloc<TabEvent, HomeTab> {
  @override
  HomeTab get initialState => HomeTab.chat;

  @override
  Stream<HomeTab> mapEventToState(TabEvent event) async* {
    if (event is UpdateTab) {
      yield event.activeTab;
    }
  }
}
