import 'package:flutter/material.dart';

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
