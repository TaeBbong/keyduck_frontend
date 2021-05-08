import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MainBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          viewportFraction: 1.0,
          aspectRatio: 30 / 9,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
        ),
        items: [
          Image.asset('images/banner_1.png'),
          Image.asset('images/banner_2.png'),
          Image.asset('images/banner_3.png'),
        ],
      ),
    );
  }
}

class MobileMainBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          viewportFraction: 1.0,
          aspectRatio: 1.0,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
        ),
        items: [
          Image.asset('images/mbanner_1.png'),
          Image.asset('images/mbanner_2.png'),
        ],
      ),
    );
  }
}
