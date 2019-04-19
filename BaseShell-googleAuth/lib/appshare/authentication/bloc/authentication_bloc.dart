import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import './authentication_event.dart';
import './authentication_state.dart';
import '../user_repository/user_repository.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;

  AuthenticationBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  AuthenticationState get initialState => Uninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    }
    if (event is Login) {
      /* final name = await _userRepository.getUser();
      yield Authenticated(name); */
     final userInfo= await _userRepository.getUserInfo();
      yield Authenticated(userInfo);
      
    }
    if (event is Logout) {
      yield* _mapLogoutToState();
    }
  }

  Stream<AuthenticationState> _mapAppStartedToState() async* {
    try {
      final isSignedIn = await _userRepository.isSignedIn();
      if (isSignedIn) {
        /* final name = await _userRepository.getUser();
        yield Authenticated(name); */
      final userInfo= await _userRepository.getUserInfo();
      yield Authenticated(userInfo);

      } else {
        yield Unauthenticated();
      }
    } catch (_) {
      yield Unauthenticated();
    }
  }

  Stream<AuthenticationState> _mapLogoutToState() async* {
    await _userRepository.signOut();
    yield Unauthenticated();
  }
}
