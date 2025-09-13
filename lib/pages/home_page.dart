import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/custom%20widgets/header_image_donuts.dart';
import 'package:oven/widgets/home_page_widgets/images_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ImageCarouselWithDots(),
          HeaderImageDonuts(),
          SizedBox(
            height: 320,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // 3 rows
                crossAxisSpacing: context.isSmallDevice ? 10 : 20,
                mainAxisSpacing: context.isSmallDevice ? 10 : 20,
                childAspectRatio: 1, // items are square
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: 22,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(
                      context,
                    ).colorScheme.onPrimary.withValues(alpha: .08),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black38.withValues(alpha: .019),
                        blurRadius: 1,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          "lib/assets/logo_larg.png",
                          alignment: Alignment.topCenter,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            "Item $index",
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
