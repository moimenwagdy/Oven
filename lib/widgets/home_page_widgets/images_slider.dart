import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';

class ImageCarouselWithDots extends StatefulWidget {
  const ImageCarouselWithDots({super.key});

  @override
  ImageCarouselWithDotsState createState() => ImageCarouselWithDotsState();
}

class ImageCarouselWithDotsState extends State<ImageCarouselWithDots> {
  final List<String> images = [
    "lib/assets/slide1.jpg",
    "lib/assets/slide2.jpg",
    "lib/assets/slide3.jpg",
  ];
  // images dimensions required for this slider widget is 3 : 1
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          width: context.isPortrait
              ? double.infinity
              : context.screenWidth * .75,
          child: CarouselSlider(
            options: CarouselOptions(
              height: 200,
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
                width: double.infinity,
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: images.asMap().entries.map((entry) {
            return Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == entry.key
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey.withValues(alpha: .5),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
