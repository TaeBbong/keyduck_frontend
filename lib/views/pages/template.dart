import 'package:flutter/material.dart';
import 'package:keyboard_duckhoo/views/widgets/navbar.dart';
import 'package:keyboard_duckhoo/views/widgets/navbar_drawer.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PageTemplate extends StatelessWidget {
  final List<Widget> mobileChildren;
  final List<Widget> desktopChildren;
  PageTemplate({required this.mobileChildren, required this.desktopChildren});

  @override
  Widget build(BuildContext context) {
    final _scrollController = ScrollController();
    return ResponsiveBuilder(builder: (context, size) {
      return WillPopScope(
        onWillPop: () async => true,
        child: Scaffold(
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
          body: size.deviceScreenType == DeviceScreenType.mobile
              ? ListView(children: this.mobileChildren)
              : Scrollbar(
                  isAlwaysShown: true,
                  controller: _scrollController,
                  child: ListView(children: this.desktopChildren),
                ),
        ),
      );
    });
  }
}
