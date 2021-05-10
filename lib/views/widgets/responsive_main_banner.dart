import 'package:flutter/material.dart';

enum ScreenType { Mobile, Tablet, Desktop }

ScreenType getScreenType(MediaQueryData mediaQueryData) {
  double width = 0;

  if (mediaQueryData.orientation == Orientation.landscape) {
    width = mediaQueryData.size.height;
  } else {
    width = mediaQueryData.size.width;
  }

  if (width > 950) {
    return ScreenType.Desktop;
  } else if (width > 600) {
    return ScreenType.Tablet;
  }
  return ScreenType.Mobile;
}

class ResponsiveBanner extends StatelessWidget {
  final Text title;
  final Text subtitle;
  final Text description;
  final Image image;
  final TextButton textButton;

  ResponsiveBanner(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.description,
      required this.image,
      required this.textButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getScreenType(MediaQuery.of(context)) == ScreenType.Mobile
        ? Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                subtitle,
                title,
                description,
                image,
                textButton,
              ],
            ),
          )
        : Container();
  }
}
