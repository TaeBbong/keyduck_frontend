import 'package:flutter/material.dart';
import 'package:keyboard_duckhoo/views/widgets/navbar.dart';

class IndexPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => IndexPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Navbar(),
        ],
      ),
    );
  }
}
