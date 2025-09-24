import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';

class HomePageTaps extends StatefulWidget {
  final TabController tabController;
  const HomePageTaps({super.key, required this.tabController});

  @override
  State<HomePageTaps> createState() => _HomePageTapsState();
}

class _HomePageTapsState extends State<HomePageTaps> {
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    widget.tabController.addListener(() {
      if (!widget.tabController.indexIsChanging) {
        setState(() {
          selectedIndex = widget.tabController.index;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: context.isSmallDevice ? 45 : 46,
      child: ButtonsTabBar(
        // onTap: (int int) => {
        //   setState(() {
        //     selectedIndex = int;
        //   }),
        // },
        decoration: BoxDecoration(
          borderRadius: BorderRadiusGeometry.circular(4),
          color: theme.colorScheme.onSurface,
        ),
        unselectedDecoration: BoxDecoration(
          borderRadius: BorderRadiusGeometry.circular(4),
          color: context.isDarkMode
              ? theme.colorScheme.secondary.withValues(alpha: .3)
              : theme.colorScheme.secondary.withValues(alpha: .4),
        ),
        controller: widget.tabController,
        width: ((context.screenWidth - 10) / 3),
        contentPadding: EdgeInsets.symmetric(
          horizontal: context.isSmallDevice ? 0 : 5,
        ),
        contentCenter: true,
        labelStyle: TextStyle(
          fontFamily: "Poppins",
          fontWeight: FontWeight.w800,
          fontSize: 12,
          color: Theme.of(context).colorScheme.surface,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: "Poppins",
          fontWeight: FontWeight.w500,
          fontSize: 12,
          color: Theme.of(context).colorScheme.onSurface,
        ),

        tabs: [
          Tab(
            text: context.l10n.mostOrderedTab,
            icon: Icon(
              Icons.keyboard_double_arrow_up,
              size: 15,
              color: selectedIndex == 0
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSurface,
            ),
          ),
          Tab(
            text: context.l10n.favoritesTab,
            icon: Icon(
              Icons.star,
              size: 15,
              color: selectedIndex == 1
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSurface,
            ),
          ),
          Tab(
            text: context.l10n.categoriesTab,
            icon: Icon(
              Icons.list_alt_sharp,
              size: 15,
              color: selectedIndex == 2
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';

// class HomePageTaps extends StatelessWidget {
//   final TabController tabController;

//   const HomePageTaps({super.key, required this.tabController});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: context.isSmallDevice ? 45 : 46,
//       child: Container(
//         padding: EdgeInsets.all(4),
//         decoration: BoxDecoration(
//           color: Theme.of(context).colorScheme.secondary.withValues(alpha: .2),
//           boxShadow: [
//             BoxShadow(
//               color: Theme.of(
//                 context,
//               ).colorScheme.onSurface.withValues(alpha: .0),
//               offset: Offset(0, 1),
//               blurRadius: 1,
//             ),
//           ],
//         ),
//         child: TabBar(
//           controller: tabController,
//           tabAlignment: TabAlignment.center,
//           dividerHeight: 0,
//           labelPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),

//           labelStyle: TextStyle(
//             fontFamily: "Poppins",
//             fontWeight: FontWeight.w800,
//             fontSize: 15,
//             color: Colors.white,
//           ),
//           unselectedLabelStyle: TextStyle(
//             fontFamily: "Poppins",
//             fontWeight: FontWeight.w500,
//             fontSize: 15,
//             color: Colors.black,
//           ),
//           indicator: BoxDecoration(
//             color: Theme.of(context).colorScheme.primary.withValues(alpha: .8),
//           ),
//           textScaler: TextScaler.noScaling,
//           tabs: [
//             Tab(
//               child: Padding(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: context.isSmallDevice ? 15 : 20,
//                 ),
//                 child: Text("Most ordered"),
//               ),
//             ),
//             Tab(
//               child: Padding(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: context.isSmallDevice ? 15 : 20,
//                 ),
//                 child: Text("Favorites"),
//               ),
//             ),

//             Tab(
//               child: Padding(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: context.isSmallDevice ? 15 : 20,
//                 ),
//                 child: Text("Categories"),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
