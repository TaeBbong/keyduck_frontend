import 'package:flutter/material.dart';
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
              NavbarItem('홈'),
              SizedBox(width: 60),
              NavbarItem('키보드'),
              SizedBox(width: 60),
              NavbarItem('게시판'),
              SizedBox(width: 60),
              NavbarItem('게임'),
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

class NavbarMember extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 150,
      child: Center(
        child: Text(
          '키덕',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class NavbarLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 150,
      child: Center(
        child: Text(
          '키덕',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class NavbarItem extends StatelessWidget {
  final String title;
  const NavbarItem(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 18),
    );
  }
}
