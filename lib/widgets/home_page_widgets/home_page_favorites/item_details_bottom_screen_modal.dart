import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/custom%20widgets/add_to_cart_buttons/product_details_modal_quantity_buttons_add_and_increase_decrease.dart';

void itemDetailBottomScreenModal(BuildContext context, String item) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    enableDrag: true,
    constraints: BoxConstraints(
      minWidth: double.infinity,
      maxHeight: context.isSmallDevice
          ? context.screenHeight * .65
          : context.screenHeight * .55,
      minHeight: context.screenHeight * .25,
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      final TextEditingController quantityController = TextEditingController();

      return Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.asset(
                      "lib/assets/Cakes2-1.webp",
                      fit: BoxFit.contain,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Details for $item",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text("This is a detailed description of the item."),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              spacing: 5,
                              children: [
                                Text(
                                  "EGP",
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                Text(
                                  "120",
                                  style: Theme.of(
                                    context,
                                  ).textTheme.labelMedium,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                QuantityAddButtonAndIncreaseDecreaseButtons(
                                  controller: quantityController,
                                  isDetails: true,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}
