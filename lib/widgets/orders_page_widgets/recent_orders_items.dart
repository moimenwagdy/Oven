import 'package:flutter/material.dart';
import 'package:oven/widgets/orders_page_widgets/recent_orders_item.dart';

class RecentOrdersItems extends StatefulWidget {
  const RecentOrdersItems({super.key});

  @override
  State<RecentOrdersItems> createState() => _RecentOrdersItemsState();
}

class _RecentOrdersItemsState extends State<RecentOrdersItems>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final items = List.generate(10, (index) => "Favorite Item $index");

    return ListView.builder(
      key: const PageStorageKey("favoriteItemsPage"),
      itemCount: items.length,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        String type;
        if (index == 0) {
          type = "approved";
        } else if (index == 1) {
          type = "preparing";
        } else {
          type = "cancelled";
        }
        return RecentOrdersItem(type: type);
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
