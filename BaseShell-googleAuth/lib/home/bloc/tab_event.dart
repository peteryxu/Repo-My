import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:baseshell_googleauth/home/home.dart';

@immutable
abstract class TabEvent extends Equatable {
  TabEvent([List props = const []]) : super(props);
}

class UpdateTab extends TabEvent {
  final HomeTab activeTab;

  UpdateTab({@required this.activeTab});
}
