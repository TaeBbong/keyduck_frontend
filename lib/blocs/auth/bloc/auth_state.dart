part of 'auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState._({
    this.status = AuthStatus.unknown,
    this.member = Member.empty,
  });

  const AuthState.unknown() : this._();

  const AuthState.authenticated(Member member)
      : this._(status: AuthStatus.authenticated, member: member);

  const AuthState.unauthenticated()
      : this._(status: AuthStatus.unauthenticated);

  final AuthStatus status;
  final Member member;

  @override
  List<Object> get props => [status, member];
}
