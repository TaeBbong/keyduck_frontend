import 'package:flutter/material.dart';
import 'package:keyboard_duckhoo/views/pages/template.dart';

class LoginPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => LoginPage());
  }

  final List<Widget> mobileChildren = [];
  final List<Widget> desktopChildren = [];

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      mobileChildren: mobileChildren,
      desktopChildren: desktopChildren,
    );
  }
}
