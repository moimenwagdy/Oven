import 'package:flutter/material.dart';
import 'package:oven/utils/constants/colors.dart';
import 'package:oven/utils/helpers/localization_extension.dart';

class QuantityAddButtonAndIncreaseDecreaseButtons extends StatelessWidget {
  final TextEditingController controller;
  final bool? isDetails;
  const QuantityAddButtonAndIncreaseDecreaseButtons({
    super.key,
    required this.controller,
    this.isDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 2,
          children: [
            SizedBox(
              width: isDetails == true ? 120 : 50,
              height: isDetails == true ? 40 : 20,
              child: OutlinedButton(
                onPressed: () {
                  final qty = int.tryParse(controller.text) ?? 0;
                  if (qty > 0) {
                    print("Add $qty to cart");
                    FocusScope.of(context).unfocus();

                    controller.clear();
                  }
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: primary,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  padding: EdgeInsets.zero,
                  side: BorderSide.none,
                ),
                child: Center(
                  child: Text(
                    isDetails == true ? "Add to cart" : context.l10n.add,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.w900,
                      fontFamily: "Poppins",
                      fontSize: isDetails == true ? 14 : null,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 30,
              height: 25,
              child: Center(
                child: TextField(
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins",
                  ),
                  controller: controller,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  showCursor: false,
                  maxLength: 2,
                  decoration: const InputDecoration(
                    counterText: "",
                    hintText: "0",
                    counter: null,
                    hintStyle: TextStyle(fontFamily: "Poppins", fontSize: 12),
                    isDense: true,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 0),
                  ),
                ),
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 4,
          children: [
            SizedBox(
              width: isDetails == true ? 30 : 25,
              height: isDetails == true ? 30 : 25,
              child: IconButton(
                onPressed: () => {},
                icon: Icon(Icons.add, fontWeight: FontWeight.w900),
                iconSize: 12,
                color: Theme.of(context).colorScheme.onPrimary,
                padding: EdgeInsets.all(0),
                style: IconButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
            SizedBox(
              width: isDetails == true ? 30 : 25,
              height: isDetails == true ? 30 : 25,
              child: IconButton(
                onPressed: () => {},
                icon: Icon(Icons.remove, fontWeight: FontWeight.w900),
                iconSize: 12,

                padding: EdgeInsets.all(0),
                color: Theme.of(context).colorScheme.onPrimary,
                style: IconButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
