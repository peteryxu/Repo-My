import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class TabBloc extends Bloc<TabEvent, AppTab> {
  @override
  AppTab get initialState => AppTab.tab1;

  @override
  Stream<AppTab> mapEventToState(TabEvent event) async* {
    if (event is SwitchTab) {
      yield event.tab;
    }
  }
}