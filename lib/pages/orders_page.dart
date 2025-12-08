import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/recent_orders_provider/recent_order_filter_provider.dart';
import 'package:oven/providers/recent_orders_provider/recent_orders_provider.dart';
import 'package:oven/widgets/custom_widgets/spinner.dart';
import 'package:oven/widgets/orders_page_widgets/recent_orders_items.dart';

class OrdersPage extends ConsumerWidget {
  const OrdersPage({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final ordersList = ref.watch(recentOrdersListProvider);
    final selectedfilter = ref.watch(ordersFilterProvider);

    return ordersList.when(
      data: (ordersList) {
        final useableList = selectedfilter != null
            ? ordersList.where((ele) => ele.status == selectedfilter).toList()
            : ordersList;
        return RefreshIndicator(
          onRefresh: () async => {},
          child: useableList.isEmpty 
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
                            "No Orders Yet",
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              : RecentOrdersItems(ordersList: useableList),
        );
      },
      error: (e, _) => Text(e.toString()),
      loading: () => SmallSpinner(),
    );
  }
}