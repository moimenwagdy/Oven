import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';

class SuggestionsWidgetItems extends StatefulWidget {
  const SuggestionsWidgetItems({super.key});

  @override
  State<SuggestionsWidgetItems> createState() => _SuggestionsWidgetItemsState();
}

class _SuggestionsWidgetItemsState extends State<SuggestionsWidgetItems>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return ListView(
      key: const PageStorageKey("CategoriesPage"),
      // physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.all(5),
      children: [
        SizedBox(
          height: context.isSmallDevice ? 135 : 135,
          child: GridView.builder(
            key: const PageStorageKey("CategoriesGrid"),
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 10,
              childAspectRatio: 1,
            ),
            padding: EdgeInsets.all(5),
            itemCount: 40,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Theme.of(context).colorScheme.onPrimary,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: .3),
                      offset: Offset(0, 1),
                      blurRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                          child: Image.asset("lib/assets/Cakes3-2.webp"),
                        ),
                        Positioned(
                          top: 4,
                          right: 4,
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).colorScheme.surface,
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.add),
                              iconSize: 18,
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(
                                minWidth: 35,
                                minHeight: 35,
                              ),
                              color: Theme.of(context).colorScheme.primary,
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        padding: context.isArabic
                            ? EdgeInsets.only(right: 5)
                            : EdgeInsets.only(left: 5),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              context.l10n.cartITemTitle,
                              style: Theme.of(
                                context,
                              ).textTheme.labelLarge?.copyWith(fontSize: 12),
                            ),
                            Text(
                              context.isArabic ? "السعر":"Price",
                              style: Theme.of(
                                context,
                              ).textTheme.labelLarge?.copyWith(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
