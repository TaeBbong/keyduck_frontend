import 'package:flutter/material.dart';
import 'package:keyboard_duckhoo/views/widgets/navbar_item.dart';
import 'package:keyboard_duckhoo/views/widgets/navbar_logo.dart';
import 'package:keyboard_duckhoo/views/widgets/navbar_member.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: NavbarMobile(),
      desktop: NavbarDesktopTablet(),
      tablet: NavbarDesktopTablet(),
    );
  }
}

class NavbarDesktopTablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NavbarLogo(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              NavbarItem('Home'),
              SizedBox(width: 60),
              NavbarItem('Keyboards'),
              SizedBox(width: 60),
              NavbarItem('Contacts'),
            ],
          ),
          NavbarMember(),
        ],
      ),
    );
  }
}

class NavbarMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
          ),
          NavbarLogo(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
