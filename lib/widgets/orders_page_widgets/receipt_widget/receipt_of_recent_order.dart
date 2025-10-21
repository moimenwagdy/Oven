import 'package:flutter/material.dart';
import 'package:oven/utils/constants/colors.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/orders_page_widgets/receipt_widget/receipt_buttons.dart';
import 'package:oven/widgets/orders_page_widgets/receipt_widget/receipt_counter.dart';
import 'package:oven/widgets/orders_page_widgets/receipt_widget/receipt_data_item.dart';
import 'package:oven/widgets/orders_page_widgets/receipt_widget/receipt_header.dart';

void receiptOfRecentOrder(BuildContext context) {
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
      return Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReceiptHeader(),
                    SizedBox(height: 10),
                    Column(
                      children: [
                        ReceiptDataItem(
                          quantity: 2,
                          description: "Chocolate Lava Cake",
                          price: 16,
                        ),
                        ReceiptDataItem(
                          quantity: 1,
                          description: "Strawberry Cheesecake",
                          price: 10,
                        ),
                        ReceiptDataItem(
                          quantity: 36,
                          description: "Tiramisu",
                          price: 120,
                        ),
                        ReceiptDataItem(
                          quantity: 4,
                          description: "Baklava",
                          price: 7,
                        ),
                        ReceiptDataItem(
                          quantity: 4,
                          description: "Baklava",
                          price: 7,
                        ),
                        ReceiptDataItem(
                          quantity: 4,
                          description: "Baklava",
                          price: 7,
                        ),
                        ReceiptDataItem(
                          quantity: 4,
                          description: "Baklava",
                          price: 7,
                        ),
                        ReceiptDataItem(
                          quantity: 4,
                          description: "Baklava",
                          price: 7,
                        ),
                        ReceiptDataItem(
                          quantity: 4,
                          description: "Baklava",
                          price: 7,
                        ),
                        ReceiptDataItem(
                          quantity: 4,
                          description: "Baklava",
                          price: 7,
                        ),
                        ReceiptDataItem(
                          quantity: 4,
                          description: "Baklava",
                          price: 7,
                        ),
                        ReceiptDataItem(
                          quantity: 4,
                          description: "Baklava",
                          price: 7,
                        ),
                        ReceiptDataItem(
                          quantity: 4,
                          description: "Baklava",
                          price: 7,
                        ),
                        ReceiptDataItem(
                          quantity: 4,
                          description: "Baklava",
                          price: 7,
                        ),
                        ReceiptDataItem(
                          quantity: 2,
                          description:
                              "Mango Pudding  with nuts, additional caramel sauce ",
                          price: 12,
                        ),
                      ],
                    ),
                    Container(
                      width: context.screenWidth - 16,
                      height: 1,
                      color: primary,
                    ),
                    SizedBox(height: 10),
                    ReceiptCounter(),
                    SizedBox(height: 40),
                    ReceiptButtons(),
                    SizedBox(height: 10),
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
