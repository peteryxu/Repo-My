import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import './app_tab.dart';

@immutable
abstract class TabEvent extends Equatable {
  TabEvent([List props = const []]) : super(props);
}

class SwitchTab extends TabEvent {
  final AppTab tab;

  SwitchTab(this.tab) : super([tab]);

  @override
  String toString() => 'SwitchTab { tab: $tab }';
}