import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    "lib/assets/sliderTest.png",
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: context.isSmallDevice ? 160 : 180,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: context.isSmallDevice ? 160 : 180,
            width: context.isPortrait
                ? context.screenWidth
                : context.screenWidth * .75,
            child: CarouselSlider(
              options: CarouselOptions(
                height: context.isSmallDevice ? 160 : 180,
                viewportFraction: .92,
                enlargeCenterPage: true,
                enlargeFactor: 0.15,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 6),
                autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: images.map((url) {
                final placeholders = [
                  "Exclusive Offers",
                  "Very High Quality",
                  "More Than delicious",
                  "",
                ];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(12),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          url,
                          fit: BoxFit.cover,
                          width: context.screenWidth,
                          height: double.infinity,
                        ),
                        Text(
                          placeholders[_currentIndex],
                          style: Theme.of(context).textTheme.headlineLarge
                              ?.copyWith(
                                color: Colors.amber[100],
                                shadows: [
                                  Shadow(
                                    offset: Offset(2, 2),
                                    blurRadius: 6,
                                    color: Colors.black54,
                                  ),
                                ],
                              ),
                        ),
                      ],
                    ),
                  ),
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
                  width: 8.h,
                  height: 8.h,
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
