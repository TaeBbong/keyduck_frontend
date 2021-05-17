import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:keyboard_duckhoo/models/member.dart';
import 'package:keyboard_duckhoo/repositories/authentication_repository.dart';
import 'package:keyboard_duckhoo/repositories/member_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required AuthenticationRepository authenticationRepository,
    required MemberRepository memberRepository,
  })   : _authenticationRepository = authenticationRepository,
        _memberRepository = memberRepository,
        super(const AuthenticationState.unknown()) {
    _authenticationStatusSubscription = _authenticationRepository.status.listen(
      (status) => add(AuthenticationStatusChanged(status)),
    );
  }

  final AuthenticationRepository _authenticationRepository;
  final MemberRepository _memberRepository;
  late StreamSubscription<AuthenticationStatus>
      _authenticationStatusSubscription;

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AuthenticationStatusChanged) {
      yield await _mapAuthenticationStatusChangedToState(event);
    } else if (event is AuthenticationLogoutRequested) {
      _authenticationRepository.logOut();
    }
  }

  @override
  Future<void> close() {
    _authenticationStatusSubscription.cancel();
    _authenticationRepository.dispose();
    return super.close();
  }

  Future<AuthenticationState> _mapAuthenticationStatusChangedToState(
    AuthenticationStatusChanged event,
  ) async {
    switch (event.status) {
      case AuthenticationStatus.unauthenticated:
        return const AuthenticationState.unauthenticated();
      case AuthenticationStatus.authenticated:
        final member = await _tryGetMember();
        return member != null
            ? AuthenticationState.authenticated(member)
            : const AuthenticationState.unauthenticated();
      default:
        return const AuthenticationState.unknown();
    }
  }

  Future<Member?> _tryGetMember() async {
    try {
      final member = await _memberRepository.getMember();
      return member;
    } on Exception {
      return null;
    }
  }
}
