import 'package:flutter/material.dart';
import 'package:oven/widgets/home_page_widgets/home_page_favorites/item_details_bottom_screen_modal.dart';

class HomePageFavoriteItems extends StatelessWidget {
  const HomePageFavoriteItems({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(10, (index) => "Favorite Item $index");

    return ListView.builder(
      itemCount: items.length,
      padding: EdgeInsets.all(0),
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding: EdgeInsets.all(0),
          leading: SizedBox(
            height: double.infinity,
            child: Image.asset("lib/assets/Cakes3-2.webp", fit: BoxFit.cover),
          ),
          title: Text(items[index]),
          subtitle: Text("here is the item description"),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0, top: 0),
                child: Icon(Icons.star, color: Colors.yellow),
              ),
            ],
          ),
          onTap: () => itemDetailBottomScreenModal(context, items[index]),
        );
      },
    );
  }
}
