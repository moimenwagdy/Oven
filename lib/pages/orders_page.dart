import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/widgets/orders_page_widgets/recent_orders_items.dart';
import 'package:oven/widgets/orders_page_widgets/recent_orders_filter.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          scrolledUnderElevation: 10,
          toolbarHeight: 40,
          backgroundColor: Colors.white,
          elevation: 0,
          pinned: false,
          floating: false,
          expandedHeight: 40,
          flexibleSpace: SizedBox(
            height: 40,
            child: Padding(
              padding: EdgeInsets.fromLTRB(8, 5, 8, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.l10n.ordersPageHeader,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  RecentOrdersFilter(),
                ],
              ),
            ),
          ),
        ),
      ],
      body: const RecentOrdersItems(),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:oven/utils/helpers/localization_extension.dart';
// import 'package:oven/widgets/home_page_widgets/home_page_recent_orders/home_page_recent_orders_items.dart';
// import 'package:oven/widgets/home_page_widgets/home_page_recent_orders/recent_orders_filter.dart';

// class OrdersPage extends StatelessWidget {
//   const OrdersPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           height: 40,
//           child: Padding(
//             padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   context.l10n.ordersPageHeader,
//                   style: Theme.of(context).textTheme.labelLarge,
//                 ),
//                 RecentOrdersFilter(),
//               ],
//             ),
//           ),
//         ),
//         Expanded(child: HomePageRecentOrdersItems()),
//       ],
//     );
//   }
// }
