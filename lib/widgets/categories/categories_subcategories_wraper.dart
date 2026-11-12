import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oven/pages/products_page.dart';
import 'package:oven/providers/categories_provider/main_categories_provider/main_categories_provider.dart';
import 'package:oven/providers/categories_provider/selected_category_provider.dart';
import 'package:oven/providers/categories_provider/sub_categories_provider.dart';
import 'package:oven/utils/constants/percentages_of_screen_heights.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/categories/category_item.dart';

class CategoriesSubcategoriesWraper extends ConsumerWidget {
  final MapEntry<MainCategory, List<SubCategory>> entry;
  const CategoriesSubcategoriesWraper({super.key, required this.entry});
  @override
  Widget build(BuildContext context, ref) {
    final selectedCategoryId = ref.watch(selectedCategoryProvider);
    return Wrap(
      alignment: WrapAlignment.start,
      textDirection: TextDirection.ltr,

      runSpacing:
          context.screenHeight *
          ScreenHeightsByPercentage.productsPageCategoriesSection *
          .04,
      spacing: 10,
      direction: Axis.horizontal,
      children: List.generate(entry.value.length, (index) {
        final item = entry.value[index];
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 1),
          constraints: BoxConstraints(minWidth: 100.w, maxWidth: 100.w),
          child: CategoryItem(
            title: item.name,
            currentIndex: index,
            imgUrl: img[index], // or whatever image source you use
            isSelectedCategory: selectedCategoryId == item.id,
            onTap: () {
              ref
                  .read(selectedCategoryProvider.notifier)
                  .selectCategory(item.id);
            },
          ),
        );
      }),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:oven/providers/categories_provider/main_categories_provider/main_categories_provider.dart';
// import 'package:oven/providers/categories_provider/selected_category_provider.dart';
// import 'package:oven/providers/categories_provider/sub_categories_provider.dart';
// import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
// import 'package:oven/widgets/categories/category.dart';

// class CategoriesSubcategoriesWraper extends ConsumerWidget {
//   final MapEntry<MainCategory, List<SubCategory>> entry;
//   const CategoriesSubcategoriesWraper({super.key, required this.entry});

//   @override
//   Widget build(BuildContext context, ref) {
//     final selectedCategoryId = ref.watch(selectedCategoryProvider);

//     return SizedBox(
//       height: context.isTablet
//           ? context.screenHeight * .40
//           : context.isSmallDevice
//           ? context.screenHeight * .28
//           : context.screenHeight * .28,
//       child: Wrap(
//         alignment: WrapAlignment.center,
//         textDirection: TextDirection.ltr,
//         runSpacing: context.isSmallDevice ? 8 : 12,
//         spacing: context.isSmallDevice ? 8 : 12,
//         direction: Axis.vertical,
//         children: List.generate(entry.value.length, (index) {
//           final item = entry.value[index];
//           return Row(
//             children: [
//               Container(
//                 constraints: BoxConstraints(
//                   minWidth: context.isSmallDevice ? 75 : 103,
//                   minHeight: context.isSmallDevice
//                       ? 50
//                       : context.isTablet
//                       ? 80
//                       : 73,
//                   maxWidth: context.isSmallDevice
//                       ? 80
//                       : context.isTablet
//                       ? 135
//                       : 113,
//                   maxHeight: context.isSmallDevice
//                       ? 55
//                       : context.isTablet
//                       ? 90
//                       : 73,
//                 ),
//                 // color: Colors.red,
//                 // width: context.isSmallDevice ? 103 : 113,
//                 // height: context.isSmallDevice ? 70 : 73,
//                 child: CategoryItem(
//                   title: item.name,
//                   currentIndex: index,
//                   imgUrl: img[index], // or whatever image source you use
//                   isSelectedCategory: selectedCategoryId == item.id,
//                   onTap: () {
//                     ref
//                         .read(selectedCategoryProvider.notifier)
//                         .selectCategory(item.id);
//                   },
//                 ),
//               ),
//             ],
//           );
//         }),
//       ),
//     );
//   }
// }

final img = [
  "lib/assets/tart2.png",
  "lib/assets/tart3.png",
  "lib/assets/tart.png",
  "lib/assets/tart3.png",
  "lib/assets/tart.png",
  "lib/assets/tart.png",
  "lib/assets/tart2.png",
  "lib/assets/tart.png",
  "lib/assets/tart3.png",
  "lib/assets/tart.png",
  "lib/assets/tart3.png",
  "lib/assets/tart.png",
  "lib/assets/tart.png",
  "lib/assets/tart2.png",
  "lib/assets/tart.png",
  "lib/assets/tart.png",
  "lib/assets/tart2.png",
  "lib/assets/tart2.png",
  "lib/assets/tart.png",
  "lib/assets/tart3.png",
  "lib/assets/tart2.png",
  "lib/assets/tart.png",
  "lib/assets/tart3.png",
  "lib/assets/tart.png",
  "lib/assets/tart2.png",
  "lib/assets/tart.png",
  "lib/assets/tart.png",
  "lib/assets/tart2.png",
  "lib/assets/tart2.png",
  "lib/assets/tart.png",
  "lib/assets/tart3.png",
  "lib/assets/tart2.png",
  "lib/assets/tart.png",
  "lib/assets/tart3.png",
  "lib/assets/tart3.png",
  "lib/assets/tart3.png",
];
