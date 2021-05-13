import 'package:flutter/material.dart';
import 'package:keyboard_duckhoo/views/widgets/banner.dart';
import 'package:keyboard_duckhoo/views/widgets/footer.dart';
import 'package:keyboard_duckhoo/views/widgets/navbar.dart';
import 'package:keyboard_duckhoo/views/widgets/navbar_drawer.dart';
import 'package:keyboard_duckhoo/views/widgets/slider.dart';
import 'package:responsive_builder/responsive_builder.dart';

class IndexPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => IndexPage());
  }

  @override
  Widget build(BuildContext context) {
    final _scrollController = ScrollController();
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
        body: size.deviceScreenType == DeviceScreenType.mobile
            ? ListView(
                children: [
                  MobileMainBanner(),
                  Padding(padding: EdgeInsets.all(10)),
                  Text(
                    '게임에 몰입하고 싶다면',
                    style: TextStyle(fontSize: 30),
                  ),
                  MobileItemSlider(),
                  Padding(padding: EdgeInsets.all(10)),
                  Text(
                    '게임에 몰입하고 싶다면',
                    style: TextStyle(fontSize: 30),
                  ),
                  MobileItemSlider(),
                  MobileFooter(),
                ],
              )
            : Scrollbar(
                isAlwaysShown: true,
                controller: _scrollController,
                child: ListView(
                  children: [
                    MainBanner(),
                    ItemSlider(),
                    ItemSlider(),
                    Footer(),
                  ],
                ),
              ),
      );
    });
  }
}
