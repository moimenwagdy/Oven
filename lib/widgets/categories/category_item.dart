import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oven/utils/constants/percentages_of_screen_heights.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String imgUrl;
  final int currentIndex;
  final bool isSelectedCategory;
  final VoidCallback onTap;

  const CategoryItem({
    super.key,
    required this.title,
    required this.currentIndex,
    required this.imgUrl,
    required this.isSelectedCategory,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height:
                (context.screenHeight *
                    ScreenHeightsByPercentage.productsPageCategoriesSection) *
                .16,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Theme.of(context).colorScheme.primary.withValues(
                alpha: context.isDarkMode ? .1 : .2,
              ),
            ),
            child: Center(
              child: Image.asset(imgUrl, alignment: Alignment.topCenter),
            ),
          ),
          SizedBox(
            height:
                context.screenHeight *
                ScreenHeightsByPercentage.productsPageCategoriesSection *
                .01,
          ),
          Container(
            decoration: BoxDecoration(
              color: isSelectedCategory
                  ? Theme.of(context).colorScheme.primary
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(2),
            ),

            child: SizedBox(
              width: 105.w,
              height:
                  (context.screenHeight *
                      ScreenHeightsByPercentage.productsPageCategoriesSection) *
                  .06,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      textAlign: TextAlign.center,
                      title,
                      overflow: TextOverflow.ellipsis,
                      textScaler: TextScaler.linear(.9),
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: isSelectedCategory
                            ? Theme.of(context).colorScheme.onPrimary
                            : Theme.of(context).colorScheme.onSurface,
                        fontSize: context.isSmallDevice ? 10 : 11,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
