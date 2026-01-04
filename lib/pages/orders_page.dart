import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/recent_orders_provider/recent_order_filter_provider.dart';
import 'package:oven/providers/recent_orders_provider/recent_orders_provider.dart';
import 'package:oven/widgets/custom_widgets/custom_global_button.dart';
import 'package:oven/widgets/custom_widgets/spinner.dart';
import 'package:oven/widgets/orders_page_widgets/recent_orders_item.dart';

class OrdersPage extends ConsumerWidget {
  const OrdersPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ordersAsync = ref.watch(recentOrdersListProvider);
    final selectedFilter = ref.watch(ordersFilterProvider);

    return ordersAsync.when(
      loading: () => const SmallSpinner(),
      error: (e, _) => const Center(child: Text("")),
      data: (ordersList) {
        final usableList = selectedFilter != null
            ? ordersList
                  .where((order) => order.status == selectedFilter)
                  .toList()
            : ordersList;

        return RefreshIndicator(
          onRefresh: () async {},
          child: usableList.isEmpty
              ? Center(
                  child: Text(
                    "No Orders Yet",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                )
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        itemCount: usableList.length,
                        itemBuilder: (context, index) {
                          return RecentOrdersItem(orderItem: usableList[index]);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: CustomGlobalButton(
                        child: const Text("Reset"),
                        onPressed: () =>
                            ref.read(recentOrdersListProvider.notifier).reset(),
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
