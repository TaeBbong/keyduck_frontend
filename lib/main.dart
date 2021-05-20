import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_duckhoo/blocs/auth/bloc/auth_bloc.dart';
import 'package:keyboard_duckhoo/repositories/auth_repository.dart';
import 'package:keyboard_duckhoo/repositories/member_repository.dart';
import 'package:keyboard_duckhoo/views/pages/index_page.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(MyApp(
    authRepository: AuthRepository(),
    memberRepository: MemberRepository(),
  ));
}

class MyApp extends StatelessWidget {
  final AuthRepository authRepository;
  final MemberRepository memberRepository;
  const MyApp(
      {Key? key, required this.authRepository, required this.memberRepository})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authRepository,
      child: BlocProvider(
        create: (_) => AuthBloc(
          authRepository: authRepository,
          memberRepository: memberRepository,
        ),
        child: MainApp(),
      ),
    );
  }
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            switch (state.status) {
              case AuthStatus.authenticated:
                _navigator.pushAndRemoveUntil<void>(
                  IndexPage.route(),
                  (route) => false,
                );
                break;
              case AuthStatus.unauthenticated:
                _navigator.pushAndRemoveUntil<void>(
                  IndexPage.route(),
                  (route) => false,
                );
                break;
              default:
                break;
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => IndexPage.route(),
    );
  }
}
