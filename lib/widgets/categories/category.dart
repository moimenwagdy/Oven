import 'package:flutter/material.dart';
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
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Theme.of(context).colorScheme.primary.withValues(
                  alpha: context.isDarkMode ? .1 : .2,
                ),
              ),
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(imgUrl, alignment: Alignment.topCenter),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Container(
            decoration: BoxDecoration(
              color: isSelectedCategory
                  ? Theme.of(context).colorScheme.primary
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(2),
            ),
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  textScaler: TextScaler.linear(.9),
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: isSelectedCategory
                        ? Theme.of(context).colorScheme.surface
                        : Theme.of(context).colorScheme.onSurface,
                    fontSize: context.isSmallDevice ? 10 : 11,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:oven/notifires/categories_notifier.dart';
// import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// part 'category.g.dart';

// @riverpod
// class SelectedCategoryNotifier extends _$SelectedCategoryNotifier {
//   @override
//   int build() {
//     return 0;
//   }

//   void selectCategory(int index) {
//     state = index;
//   }
// }

// class CategoryItem extends ConsumerWidget {
//   final String title;
//   final String imgUrl;
//   final int currentIndex;
//   const CategoryItem({
//     super.key,
//     required this.title,
//     required this.currentIndex,
//     required this.imgUrl,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // final isSelectedCategory = context.read == currentIndex;

//     return GestureDetector(
//       onTap: () => {
//         selectedCategoryState.value = SelectedCategoryState(currentIndex),
//       },
//       child: Column(
//         children: [
//           Expanded(
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(6),
//                 color: Theme.of(context).colorScheme.primary.withValues(
//                   alpha: context.isDarkMode ? .05 : .2,
//                 ),
//               ),
//               child: Center(
//                 child: Stack(
//                   alignment: AlignmentGeometry.center,
//                   children: [
//                     Image.asset(imgUrl, alignment: Alignment.topCenter),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 5),
//           Container(
//             // decoration: BoxDecoration(
//             //   color: isSelectedCategory
//             //       ? Theme.of(context).colorScheme.primary
//             //       : Colors.transparent,
//             //   borderRadius: BorderRadius.circular(2),
//             // ),
//             padding: EdgeInsets.symmetric(vertical: 2),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   textScaler: TextScaler.linear(.9),
//                   title,
//                   style: Theme.of(context).textTheme.labelLarge?.copyWith(
//                     // color: !isSelectedCategory
//                     //     ? Theme.of(context).colorScheme.onSurface
//                     //     : Theme.of(context).colorScheme.surface,
//                     fontSize: context.isSmallDevice ? 10 : 11,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
