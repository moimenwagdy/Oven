import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/date_reformate.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/custom_form_submit_button.dart';

class RecentOrderDateInformation extends StatelessWidget {
  final DateTime date;
  final DateTime deliveryDate;
  final String status;
  const RecentOrderDateInformation({
    super.key,
    required this.date,
    required this.deliveryDate,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final orderPlacedDate = reformatDate(context, date);
    final orderEstinatedDeleveryDate = reformatDate(context, deliveryDate);
    final disableButton = status == "Cancelled";
    String? buttonTextChild;

    switch (status) {
      case "Delivered":
        buttonTextChild = context.isArabic ? "تاريخ التوصيل" : "Delivery Info";
        break;
      case "Scheduled":
      case "Preparing":
      case "Cancelled":
        buttonTextChild = context.l10n.trackOrder;
        break;
      default:
        buttonTextChild = context.l10n.trackOrder;
    }

    return SizedBox(
      width: context.isSmallDevice ? 130 : 150,
      height: context.isSmallDevice ? 25 : 30,
      child: FormSubmitButtom(
        onPressed: disableButton
            ? null
            : () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Column(
                        spacing: 5,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "${context.l10n.orderDate}:",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                orderPlacedDate,
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "${context.l10n.orderDeliveryEstimatedDate}:",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                orderEstinatedDeleveryDate,
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "${context.l10n.orderDeliveryDate}:",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                context.l10n.dateWillAppearHere,
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
        textChild: Text(
          buttonTextChild,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: context.isSmallDevice ? 12 : 14,
          ),
        ),
      ),
    );
  }
}

