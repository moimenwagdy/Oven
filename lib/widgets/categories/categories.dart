import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/categories/category.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView(
      key: const PageStorageKey("CategoriesPage"),
      padding: EdgeInsets.all(5),
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: context.isSmallDevice ? 300 : 350,
              child: GridView.builder(
                key: const PageStorageKey("CategoriesGrid"),
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: context.isSmallDevice ? 10 : 15,
                  mainAxisSpacing: context.isSmallDevice ? 10 : 15,
                  childAspectRatio: 1,
                ),
                padding: EdgeInsets.zero,
                itemCount: 22,
                itemBuilder: (context, index) {
                  return CategoryItem(key: Key(index.toString()));
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
