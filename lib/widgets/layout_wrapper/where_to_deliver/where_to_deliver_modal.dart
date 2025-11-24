import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'where_to_deliver_modal.g.dart';

@riverpod
class RadioList extends _$RadioList {
  static const _storageKey = "whereToDevlicerAdress";

  @override
  String build() {
    _loadFromStorage();
    return "";
  }

  void selectedAdress(String index) {
    state = index;
    _saveToStorage();
  }

  Future<void> _loadFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_storageKey);

    if (jsonString == null) return;

    final String decoded = jsonDecode(jsonString);

    state = decoded;
  }

  Future<void> _saveToStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = jsonEncode(state);
    await prefs.setString(_storageKey, encoded);
  }
}

class WhereToDeliverModal extends ConsumerWidget {
  const WhereToDeliverModal({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final selectedAdress = ref.watch(radioListProvider);
    // final selectedValue = selectedAdress ??
    final valueToShow = selectedAdress != ""
        ? selectedAdress
        : context.l10n.whereToDeliver;
    return GestureDetector(
      onTap: () => showTopSheet(context),
      child: Text(
        limitedTextWords(valueToShow, 4), // zero-width space
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
    final options = context.isArabic ? optionsA : optionsE;
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
              },
              child: SizedBox(
                width: (context.screenWidth - 50) * .80,
                child: Wrap(
                  children: [
                    Text(
                      option,
                      style: context.isArabic
                          ? Theme.of(context).textTheme.labelMedium
                          : Theme.of(
                              context,
                            ).textTheme.labelSmall?.copyWith(fontSize: 12),
                      softWrap: true,
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
        // const SizedBox(height: 16),
        // SizedBox(
        //   width: context.screenWidth * .8,
        //   child: CustomGlobalButton(
        //     child: "Submit",
        //     onPressed: () {
        //       value != ""
        //           ? ScaffoldMessenger.of(
        //               context,
        //             ).showSnackBar(SnackBar(content: Text('Selected: $value')))
        //           : () => {};
        //       Navigator.of(context).pop();
        //     },
        //   ),
        // ),
      ],
    );
  }
}

final optionsA = [
  "١٢٣ شارع النيل، الزمالك، القاهرة، مصر",
  "٤٥ طريق الملك فهد، الرياض، المملكة العربية السعودية",
  "٧٨ شارع بكر، لندن، المملكة المتحدة ٧٨ شارع بكر، لندن، المملكة المتحدة",
];
final optionsE = [
  "123 Nile Street, Zamalek, Cairo, Egypt",
  "45 King Fahd Road, Riyadh, Saudi Arabia",
  "78 Baker Street, London, United Kingd ndon, United Kingdom",
];

String limitedTextWords(String text, int limit) {
  final words = text.trim().split(RegExp(r"\s+")); // splits by spaces
  if (words.length <= limit) return text;
  return "${words.take(limit).join(' ')}...";
}
