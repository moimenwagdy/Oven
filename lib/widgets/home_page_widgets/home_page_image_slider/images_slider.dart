import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';

class ImageSlidingAnnouncment extends StatefulWidget {
  const ImageSlidingAnnouncment({super.key});

  @override
  ImageSlidingAnnouncmentState createState() => ImageSlidingAnnouncmentState();
}

class ImageSlidingAnnouncmentState extends State<ImageSlidingAnnouncment> {
  final List<String> images = [
    "lib/assets/slide1.jpg",
    "lib/assets/slide2.jpg",
    "lib/assets/slide3.jpg",
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: 180,
            width: context.isPortrait
                ? context.screenWidth
                : context.screenWidth * .75,
            child: CarouselSlider(
              options: CarouselOptions(
                height: 180,
                viewportFraction: context.isSmallDevice ? 1.1 : 1,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 6),
                autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                enlargeCenterPage: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: images.map((url) {
                return Image.asset(
                  url,
                  fit: BoxFit.cover,
                  width: context.screenWidth,
                );
              }).toList(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images.asMap().entries.map((entry) {
              return Padding(
                padding: EdgeInsetsGeometry.only(bottom: 4),
                child: Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == entry.key
                        ? Theme.of(context).colorScheme.primary
                        : Colors.black.withValues(alpha: .3),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
