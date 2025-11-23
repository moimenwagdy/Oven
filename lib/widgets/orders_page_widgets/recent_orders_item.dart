import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/cart_page_widgets/cart_items/cart_notifier.dart';
import 'package:oven/widgets/custom%20widgets/forms_custom_widgets/custom_form_submit_button.dart';
import 'package:oven/widgets/orders_page_widgets/aligned_text.dart';

class RecentOrdersItem extends StatelessWidget {
  final String type;
  final List<String> contentItemsList;
  final List<CartItem> cartData;
  final double totalCost;
  const RecentOrdersItem({
    super.key,
    required this.type,
    required this.contentItemsList,
    required this.totalCost,
    required this.cartData,
  });

  @override
  Widget build(BuildContext context) {
    final formatted = DateFormat("dd MMM, hh:mm a").format(DateTime.now());

    Color typeColor = Colors.transparent;
    return Card(
      color: Theme.of(context).colorScheme.onSecondaryFixed,
      elevation: 0,
      child: Stack(
        alignment: context.isArabic ? Alignment.topRight : Alignment.topLeft,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: context.isSmallDevice ? 20 : 10,
              horizontal: 5,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: 120, maxHeight: 130),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 20,
                children: [
                  Column(
                    spacing: 5,
                    children: [
                      Text(
                        context.l10n.orderItems,
                        style: Theme.of(
                          context,
                        ).textTheme.labelLarge?.copyWith(fontSize: 10),
                      ),
                      Expanded(
                        child: Container(
                          width: 154,
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Theme.of(context).colorScheme.onSurface
                                .withValues(
                                  alpha: context.isDarkMode ? .15 : .05,
                                ),
                          ),
                          child: Scrollbar(
                            scrollbarOrientation: context.isArabic
                                ? ScrollbarOrientation.right
                                : ScrollbarOrientation.left,
                            thumbVisibility: true, // 👈 Always show scrollbar
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: List.generate(
                                    contentItemsList.length,
                                    (index) => AlignedText(
                                      text: contentItemsList[index],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        formatted,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      Container(
                        width: 150,
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onSurface
                              .withValues(alpha: context.isDarkMode ? .15 : .1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Column(
                          children: [
                            Text(
                              " ${context.l10n.itemsCount} ${contentItemsList.length}",
                              style: Theme.of(context).textTheme.titleSmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                            ),
                            Text(
                              "$totalCost ${context.l10n.itemPriceType}",
                              style: Theme.of(context).textTheme.titleSmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: context.isSmallDevice ? 130 : 150,
                        height: context.isSmallDevice ? 25 : 30,
                        child: Consumer(
                          builder: (context, ref, child) {
                            return FormSubmitButtom(
                              textChild: Text(
                                type == "preparing"
                                    ? context.isArabic
                                          ? "إالغاء"
                                          : "Cancel"
                                    : context.l10n.orderdAgainButton,
                                style: TextStyle(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onPrimary,
                                  fontSize: context.isSmallDevice ? 14 : 16,
                                ),
                              ),
                              onPressed: () async => {
                                ref
                                    .watch(cartProvider.notifier)
                                    .extractToCart(cartData),
                                await Future.delayed(
                                  const Duration(milliseconds: 200),
                                ),

                                if (context.mounted) {context.go("/cart")},
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            decoration: BoxDecoration(
              color: typeColor,
              borderRadius: BorderRadius.only(
                topLeft: context.isArabic
                    ? Radius.circular(0)
                    : Radius.circular(12),
                bottomLeft: context.isArabic
                    ? Radius.circular(6)
                    : Radius.circular(0),
                topRight: context.isArabic
                    ? Radius.circular(12)
                    : Radius.circular(0),
                bottomRight: context.isArabic
                    ? Radius.circular(0)
                    : Radius.circular(6),
              ),
            ),
            child: Text(type, style: Theme.of(context).textTheme.labelSmall),
          ),
        ],
      ),
    );
  }
}
