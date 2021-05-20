import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:keyboard_duckhoo/models/member.dart';
import 'package:keyboard_duckhoo/repositories/auth_repository.dart';
import 'package:keyboard_duckhoo/repositories/member_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required AuthRepository authRepository,
    required MemberRepository memberRepository,
  })   : _authRepository = authRepository,
        _memberRepository = memberRepository,
        super(const AuthState.unknown()) {
    _authStatusSubscription = _authRepository.status.listen(
      (status) => add(AuthStatusChanged(status)),
    );
  }

  final AuthRepository _authRepository;
  final MemberRepository _memberRepository;
  late StreamSubscription<AuthStatus> _authStatusSubscription;

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AuthStatusChanged) {
      yield await _mapAuthStatusChangedToState(event);
    } else if (event is AuthLogoutRequested) {
      _authRepository.logOut();
    }
  }

  @override
  Future<void> close() {
    _authStatusSubscription.cancel();
    _authRepository.dispose();
    return super.close();
  }

  Future<AuthState> _mapAuthStatusChangedToState(
    AuthStatusChanged event,
  ) async {
    switch (event.status) {
      case AuthStatus.unauthenticated:
        return const AuthState.unauthenticated();
      case AuthStatus.authenticated:
        final member = await _tryGetMember();
        return member != null
            ? AuthState.authenticated(member)
            : const AuthState.unauthenticated();
      default:
        return const AuthState.unknown();
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
