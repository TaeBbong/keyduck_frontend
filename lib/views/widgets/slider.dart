import 'package:flutter/material.dart';

class ItemSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            child: Image.asset('images/mbanner_1.png'),
            padding: EdgeInsets.all(3),
          ),
          Container(
            child: Image.asset('images/mbanner_2.png'),
            padding: EdgeInsets.all(3),
          ),
          Container(
            child: Image.asset('images/mbanner_1.png'),
            padding: EdgeInsets.all(3),
          ),
          Container(
            child: Image.asset('images/mbanner_2.png'),
            padding: EdgeInsets.all(3),
          ),
          Container(
            child: Image.asset('images/mbanner_1.png'),
            padding: EdgeInsets.all(3),
          ),
          Container(
            child: Image.asset('images/mbanner_2.png'),
            padding: EdgeInsets.all(3),
          ),
          Container(
            child: Image.asset('images/mbanner_1.png'),
            padding: EdgeInsets.all(3),
          ),
          Container(
            child: Image.asset('images/mbanner_2.png'),
            padding: EdgeInsets.all(3),
          ),
        ],
      ),
    );
  }
}

class MobileItemSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            child: Image.asset('images/mbanner_1.png'),
          ),
          Container(
            child: Image.asset('images/mbanner_2.png'),
          ),
          Container(
            child: Image.asset('images/mbanner_1.png'),
          ),
          Container(
            child: Image.asset('images/mbanner_2.png'),
          ),
          Container(
            child: Image.asset('images/mbanner_1.png'),
          ),
          Container(
            child: Image.asset('images/mbanner_2.png'),
          ),
          Container(
            child: Image.asset('images/mbanner_1.png'),
          ),
          Container(
            child: Image.asset('images/mbanner_2.png'),
          ),
        ],
      ),
    );
  }
}
