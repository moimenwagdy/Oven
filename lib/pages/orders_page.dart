import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/widgets/orders_page_widgets/recent_orders_items.dart';

class OrdersPage extends ConsumerWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final ordersList = ref.watch(recentOrdersListProvider);
    final ordersListIsEmpty = ordersList.isEmpty;
    return RefreshIndicator(
      onRefresh: () async => {},
      child: ordersListIsEmpty
          ? SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "You havn't Orders Yet",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ],
                  ),
                ],
              ),
            )
          : RecentOrdersItems(ordersList: ordersList),
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
