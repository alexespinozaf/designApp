import 'package:design/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlidesShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: MySlidershow()),
          Expanded(child: MySlidershow()),
        ],
      ),
    );
  }
}

class MySlidershow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Slideshow(
      slides: [
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-2.svg'),
        SvgPicture.asset('assets/svgs/slide-3.svg'),
        SvgPicture.asset('assets/svgs/slide-4.svg'),
        SvgPicture.asset('assets/svgs/slide-5.svg'),
      ],
      // indicatorUp: true,
      primaryColor: Colors.red,
      primaryBullet: 20.0,
      secondaryBullet: 12.0,
    );
  }
}
