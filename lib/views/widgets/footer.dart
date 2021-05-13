import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text('Copyright 밍기원정대, 2021 ALL RIGHTS RESERVED'),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          Text('Designed by TaeBbong'),
        ],
      ),
    );
  }
}

class MobileFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('Copyright 밍기원정대, 2021 ALL RIGHTS RESERVED'),
          Text('Designed by TaeBbong'),
        ],
      ),
    );
  }
}
