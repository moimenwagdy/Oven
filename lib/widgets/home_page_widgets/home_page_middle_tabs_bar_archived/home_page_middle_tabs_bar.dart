import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/home_page_widgets/home_page_middle_tabs_bar_archived/home_page_middle_tabs_bar_Tab.dart';

class HomePageMidlleTabsBar extends StatelessWidget {
  final PageController controller;
  final int currentIndex;
  const HomePageMidlleTabsBar({
    super.key,
    required this.controller,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    void onTabSelected(int index) {
      final currentPage = controller.page?.round() ?? 0;
      if (index == currentPage) return;

      final difference = (currentPage - index).abs();

      if (difference > 1) {
        controller.jumpToPage(index);
      } else {
        controller.animateToPage(
          index,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
        );
      }
    }

    final List<Map<String, dynamic>> tabsList = [
      {"icon": Icons.star, "text": context.l10n.favoritesTab},
      {"icon": Icons.history, "text": context.l10n.mostOrderedTab},
    ];
    return SizedBox(
      width: context.screenWidth * .8,
      child: Row(
        spacing: 5,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(tabsList.length, (index) {
          final item = tabsList[index];

          return HomePageMiddleTabsBarTab(
            onClick: () => onTabSelected(index),
            icon: item["icon"],
            text: item["text"],
            isSelected: currentIndex == index,
          );
        }),
      ),
    );
  }
}

/////////////////////////////////////////////////


// import 'package:flutter/material.dart';
// import 'package:oven/notifires/TabsBarNotifier.dart';
// import 'package:oven/utils/constants/colors.dart';
// import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';

// class NewNavBarTestItems extends StatefulWidget {
//   const NewNavBarTestItems({super.key});

//   @override
//   State<NewNavBarTestItems> createState() => _NewNavBarTestItemsState();
// }

// class _NewNavBarTestItemsState extends State<NewNavBarTestItems> {
//   final List<Map<String, dynamic>> momo = [
//     {"icon": Icons.star, "text": "Favorites"},
//     {"icon": Icons.list, "text": "Orders"},
//     {"icon": Icons.category, "text": "Categories"},
//     {"icon": Icons.history, "text": "Recent"},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: context.screenWidth,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: List.generate(momo.length, (index) {
//           final item = momo[index];
//           return ValueListenableBuilder(
//             valueListenable: selectedTabIndex,
//             builder: (context, value, child) {
//               final isSelected = value == index;
//               return NewNavBarTestItem(
//                 icon: item["icon"],
//                 text: item["text"],
//                 isSelected: isSelected,
//                 onClick: () {
//                   selectedTabIndex.value = index;
//                 },
//               );
//             },
//           );
//         }),
//       ),
//     );
//   }
// }

// class NewNavBarTestItem extends StatelessWidget {
//   final IconData icon;
//   final String text;
//   final bool isSelected;
//   final VoidCallback onClick;

//   const NewNavBarTestItem({
//     super.key,
//     required this.icon,
//     required this.text,
//     required this.isSelected,
//     required this.onClick,
//   });

//   @override
//   Widget build(BuildContext context) {
//     const kAnimationDuration = Duration(milliseconds: 220);

//     double _width = isSelected
//         ? context.screenWidth / 2.5
//         : context.screenWidth / 6;

//     return AnimatedScale(
//       duration: kAnimationDuration,
//       scale: isSelected ? 1.25 : 1,
//       alignment: Alignment.center,
//       curve: Curves.easeInOut,
//       child: Container(
//         height: context.isSmallDevice ? 35 : 45,
//         decoration: BoxDecoration(
//           color: !isSelected
//               ? Theme.of(context).colorScheme.secondary.withValues(alpha: .5)
//               : Theme.of(context).colorScheme.onSurface,
//           borderRadius: BorderRadius.circular(6),
//         ),
//         child: TextButton(
//           onPressed: onClick,
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               isSelected
//                   ? AnimatedSize(
//                       duration: kAnimationDuration,
//                       child: Text(
//                         text,
//                         key: ValueKey(text),
//                         style: Theme.of(context).textTheme.labelLarge?.copyWith(
//                           color: Theme.of(context).colorScheme.surface,
//                           fontSize: 12,
//                         ),
//                       ),
//                     )
//                   : SizedBox(width: 1),
//               isSelected ? SizedBox(width: 6) : SizedBox.shrink(),
//               AnimatedOpacity(
//                 duration: kAnimationDuration,
//                 opacity: 1,
//                 child: Icon(
//                   icon,
//                   color: !isSelected
//                       ? Theme.of(context).colorScheme.onSurface
//                       : primary,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         // ),
//       ),
//     );
//   }
// }
