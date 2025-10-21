import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/custom%20widgets/forms_custom_widgets/custom_form_submit_button.dart';
import 'package:oven/widgets/home_page_widgets/home_page_favorites/item_details_bottom_screen_modal.dart';
import 'package:oven/widgets/orders_page_widgets/aligned_text.dart';
import 'package:oven/widgets/orders_page_widgets/receipt_widget/receipt_of_recent_order.dart';

class RecentOrdersItem extends StatefulWidget {
  final String type;
  const RecentOrdersItem({super.key, required this.type});

  @override
  State<RecentOrdersItem> createState() => _RecentOrdersItemState();
}

class _RecentOrdersItemState extends State<RecentOrdersItem> {
  final List<String> orderItems = [
    "Classic Margherita Pizza",
    "Grilled Chicken Sandwich",
    "Spicy Tuna Roll",
    "Caesar Salad with Parmesan",
    "Double Cheeseburger Combo",
    "Crispy French Fries",
    "Chocolate Lava Cake",
    "Fresh Orange Juice",
    "Iced Caramel Latte",
    "BBQ Chicken Wings (6 pcs)",
    "Beef Tacos with Salsa",
    "Vegetable Stir-Fry Bowl",
    "Garlic Bread with Cheese",
    "Vanilla Milkshake",
    "Mushroom Risotto",
    "Club Sandwich with Fries",
  ];
  final List<String> arabicOrderItems = [
    "بيتزا مارغريتا الكلاسيكية",
    "ساندويتش دجاج مشوي",
    "رول تونة حار",
    "سلطة سيزر بجبن البارميزان",
    "كومبو برجر مزدوج بالجبنة",
    "بطاطس مقلية مقرمشة",
    "كيك الشوكولاتة الساخن",
    "عصير برتقال طازج",
    "لاتيه كراميل مثلج",
    "أجنحة دجاج باربكيو (٦ قطع)",
    "تاكو لحم بقري مع صلصة السالسا",
    "طبق خضار مقلي آسيوي",
    "خبز بالثوم والجبن",
    "ميلك شيك بالفانيليا",
    "ريزوتو بالمشروم",
    "كلوب ساندويتش مع بطاطس",
  ];
  Color typeColor = Colors.transparent;
  String type = "accepted";

  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case "approved":
        typeColor = Colors.green.withValues(alpha: .4);
        type = context.l10n.orderApprovedState;
        break;
      case "cancelled":
        typeColor = Colors.red.withValues(alpha: .2);
        type = context.l10n.orderCanceledState;
        break;
      case "preparing":
        typeColor = Colors.blue.withValues(alpha: .4);
        type = context.l10n.orderPreparingState;
        break;
    }
    return Card(
      color: Theme.of(
        context,
      ).colorScheme.onSurface.withValues(alpha: context.isDarkMode ? .15 : .04),
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
                    children: [
                      Text(
                        context.l10n.orderItems,
                        style: Theme.of(
                          context,
                        ).textTheme.labelLarge?.copyWith(fontSize: 10),
                      ),
                      Expanded(
                        child: Container(
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Theme.of(context).colorScheme.onSurface
                                .withValues(
                                  alpha: context.isDarkMode ? .15 : .05,
                                ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(
                                  orderItems.length,
                                  (index) => AlignedText(
                                    text: context.isArabic
                                        ? arabicOrderItems[index]
                                        : orderItems[index],
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
                        "29 Nov, 04:35 pm",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      GestureDetector(
                        child: Container(
                          width: 150,
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onSurface
                                .withValues(
                                  alpha: context.isDarkMode ? .15 : .1,
                                ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Column(
                            children: [
                              Text(
                                " ${context.l10n.itemsCount} 622",
                                style: Theme.of(context).textTheme.titleSmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    ),
                              ),
                              Text(
                                "24000915.5 ${context.l10n.itemPriceType}",
                                style: Theme.of(context).textTheme.titleSmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () => itemDetailBottomScreenModal(
                          context,
                          " **** we can add any detils here, or navigate to specific page to show the oreder details  **** ",
                        ),
                      ),
                      SizedBox(
                        width: context.isSmallDevice ? 130 : 150,
                        height: context.isSmallDevice ? 25 : 30,
                        child: FormSubmitButtom(
                          textChild: Text(
                            widget.type == "preparing"
                                ? context.isArabic
                                      ? "إالغاء"
                                      : "Cancel"
                                : context.l10n.orderdAgainButton,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontSize: context.isSmallDevice ? 14 : 16,
                            ),
                          ),
                          onPressed: () => {receiptOfRecentOrder(context)},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            // width: 60,
            decoration: BoxDecoration(
              color: typeColor,
              borderRadius: BorderRadius.only(
                topLeft: context.isArabic
                    ? Radius.circular(6)
                    : Radius.circular(0),
                bottomLeft: context.isArabic
                    ? Radius.circular(6)
                    : Radius.circular(0),
                topRight: context.isArabic
                    ? Radius.circular(0)
                    : Radius.circular(6),
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
