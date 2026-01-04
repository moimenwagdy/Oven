import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/schedule_order_provider/scheduled_order_date_provider.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/utils/helpers/date_reformate.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/custom_form_submit_button.dart';

class ScheduledOrder extends ConsumerWidget {
  const ScheduledOrder({super.key});

  Future<void> _pickDate(BuildContext context, WidgetRef ref) async {
    final selectedDate = ref.watch(scheduledOrderDateProvider);

    final now = DateTime.now();
    final minDate = DateTime(now.year, now.month, now.day + 1);
    final maxDate = DateTime(now.year, now.month, minDate.day + 30);

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? minDate,
      firstDate: minDate,
      lastDate: maxDate,
      helpText: "Select order date",
      cancelText: "Cancel",
      confirmText: "Confirm",
      locale: context.isArabic ? Locale("ar") : Locale("en"),
    );

    if (pickedDate != null) {
      ref.read(scheduledOrderDateProvider.notifier).updateDate(pickedDate);
    } else {
      ref.read(scheduledOrderDateProvider.notifier).updateDate(null);
    }
  }

  @override
  Widget build(BuildContext context, ref) {
    final now = DateTime.now();
    final defaultDate = DateTime(now.year, now.month, now.day + 1);
    final date = ref.watch(scheduledOrderDateProvider);
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 15, horizontal: 15),
      child: Row(
        spacing: 10,
        children: [
          SizedBox(
            width: context.isSmallDevice ? 150 : 170,
            height: context.isSmallDevice ? 30 : 35,
            child: FormSubmitButtom(
              textChild: Text(
                context.l10n.scheduleOrder,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: context.isSmallDevice ? 12 : 14,
                ),
              ),
              onPressed: () async {
                await _pickDate(context, ref);
              },
            ),
          ),
          Text(
            date != null
                ? reformatDate(context, date)
                : reformatDate(context, defaultDate),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: context.isArabic ? "ArabicFont" : "EnglishFont",
            ),
          ),
        ],
      ),
    );
  }
}
