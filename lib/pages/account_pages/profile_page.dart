// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
// import 'package:oven/widgets/custom%20widgets/oven_logo.dart';

// class ProfilePage extends StatelessWidget {
//   const ProfilePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final currentLocation = GoRouterState.of(context).fullPath;
//     print("Current path: $currentLocation");
//     return Scaffold(
//       body: Column(
//         children: [
//           OvenLogo(minW: 40, maxW: 120),
//           Container(
//             height: 300,
//             decoration: BoxDecoration(
//               color: Colors.red,
//               borderRadius: BorderRadius.circular(12),
//             ),
//             padding: EdgeInsets.all(5),
//             child: GridView.builder(
//               key: const PageStorageKey("CategoriesGrid"),
//               scrollDirection: Axis.horizontal,
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: context.isSmallDevice ? 5 : 5,
//                 mainAxisSpacing: context.isSmallDevice ? 5 : 5,
//                 childAspectRatio: .7,
//               ),
//               padding: EdgeInsets.zero,
//               itemCount: 4,
//               itemBuilder: (context, index) {
//                 return Container(
//                   decoration: BoxDecoration(
//                     color: Colors.blue,
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Center(child: Text("data")),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:oven/widgets/profile_page_widgets/profile_page_header.dart';
import 'package:oven/widgets/profile_page_widgets/profile_page_sections.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            spacing: 20,
            mainAxisSize: MainAxisSize.max,
            children: [ProfilePageHeader(), ProfilePageSections()],
          ),
        ),
      ),
    );
  }
}
