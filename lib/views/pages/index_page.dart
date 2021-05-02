import 'package:flutter/material.dart';
import 'package:keyboard_duckhoo/views/widgets/navbar.dart';
import 'package:keyboard_duckhoo/views/widgets/navbar_drawer.dart';
import 'package:responsive_builder/responsive_builder.dart';

class IndexPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => IndexPage());
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, size) {
      return Scaffold(
        appBar: size.deviceScreenType == DeviceScreenType.mobile
            ? AppBar(
                backgroundColor: Colors.transparent,
                iconTheme: IconThemeData(color: Colors.black),
                elevation: 0,
                title: Text(
                  '키덕',
                  style: TextStyle(color: Colors.black),
                ),
              )
            : PreferredSize(
                child: Navbar(),
                preferredSize: Size(1000, 1000),
              ),
        drawer: size.deviceScreenType == DeviceScreenType.mobile
            ? NavDrawer()
            : null,
        body: Container(
          child: Center(
            child: Text('hihi'),
          ),
        ),
      );
    });
  }
}
