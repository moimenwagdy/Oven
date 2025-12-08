import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/where_to_devliver_provider/where_to_deliver_provider.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';

class WhereToDeliverModal extends ConsumerWidget {
  const WhereToDeliverModal({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final selectedAdress = ref.watch(radioListProvider);
    final valueToShow = selectedAdress != ""
        ? selectedAdress
        : context.l10n.whereToDeliver;
    return GestureDetector(
      onTap: () => showTopSheet(context),
      child: Text(
        limitedTextWords(valueToShow, 4),
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          shadows: [
            Shadow(
              offset: Offset(1, 1),
              blurRadius: 6,
              color: Colors.black.withValues(alpha: .1),
            ),
          ],
        ),
      ),
    );
  }
}

void showTopSheet(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: "Dismiss",
    barrierColor: Colors.black.withValues(alpha: 0.3),
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (context, anim1, anim2) {
      return Align(
        alignment: Alignment.topCenter,
        child: Material(
          color: Colors.transparent,
          child: Container(
            margin: EdgeInsets.only(top: 130),
            width: context.screenWidth * .9,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(16),
            ),
            child: BuildRadioList(),
          ),
        ),
      );
    },
  );
}

class BuildRadioList extends ConsumerWidget {
  const BuildRadioList({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final value = ref.watch(radioListProvider);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          children: options.map((option) {
            return RadioMenuButton<String>(
              groupValue: value,
              style: ButtonStyle(
                padding: WidgetStatePropertyAll(
                  EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                ),
              ),
              value: option,
              onChanged: (value) {
                ref.watch(radioListProvider.notifier).selectedAdress(value!);
                Navigator.of(context).pop();
              },
              child: SizedBox(
                width: (context.screenWidth - 50) * .80,
                child: Wrap(
                  children: [
                    Text(
                      option,
                      style: Theme.of(context).textTheme.labelSmall,
                      softWrap: true,
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

final options = [
  "١٢٣ شارع النيل، الزمالك، القاهرة، مصر",
  "123 Nile Street, Zamalek, Cairo, Egypt",
  "78 Baker Street, London, United Kingd ndon, United Kingdom",
];

String limitedTextWords(String text, int limit) {
  final words = text.trim().split(RegExp(r"\s+"));
  if (words.length <= limit) return text;
  return "${words.take(limit).join(' ')}...";
}
