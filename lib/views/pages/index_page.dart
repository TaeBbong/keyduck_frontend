import 'package:flutter/material.dart';
import 'package:keyboard_duckhoo/views/pages/template.dart';
import 'package:keyboard_duckhoo/views/widgets/banner.dart';
import 'package:keyboard_duckhoo/views/widgets/footer.dart';
import 'package:keyboard_duckhoo/views/widgets/slider.dart';

class IndexPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => IndexPage());
  }

  final List<Widget> mobileChildren = [
    MobileMainBanner(),
    Padding(padding: EdgeInsets.all(10)),
    Text(
      '게임에 몰입하고 싶다면',
      style: TextStyle(fontSize: 30),
    ),
    MobileItemSlider(),
    Padding(padding: EdgeInsets.all(10)),
    Text(
      '사무실에서 조용히',
      style: TextStyle(fontSize: 30),
    ),
    MobileItemSlider(),
    MobileFooter(),
  ];
  final List<Widget> desktopChildren = [
    MainBanner(),
    Padding(padding: EdgeInsets.all(10)),
    Text(
      '게임에 몰입하고 싶다면',
      style: TextStyle(fontSize: 30),
    ),
    ItemSlider(),
    Padding(padding: EdgeInsets.all(10)),
    Text(
      '게임에 몰입하고 싶다면',
      style: TextStyle(fontSize: 30),
    ),
    ItemSlider(),
    Footer(),
  ];

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      mobileChildren: mobileChildren,
      desktopChildren: desktopChildren,
    );
  }
}
