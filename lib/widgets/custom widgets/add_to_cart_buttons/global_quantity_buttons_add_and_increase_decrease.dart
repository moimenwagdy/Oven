import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/custom%20widgets/add_to_cart_buttons/add_to_cart_button.dart';
import 'package:oven/widgets/custom%20widgets/add_to_cart_buttons/cyrcle_increase_decrease_quantity_button.dart';
import 'package:oven/widgets/custom%20widgets/add_to_cart_buttons/quantity_text_field.dart';

class GlobalQuantityButtonsAddAndIncreaseDecrease extends StatefulWidget {
  final TextEditingController controller;
  final bool? isDetails;
  const GlobalQuantityButtonsAddAndIncreaseDecrease({
    super.key,
    required this.controller,
    this.isDetails,
  });

  @override
  State<GlobalQuantityButtonsAddAndIncreaseDecrease> createState() =>
      _QuantityAddButtonAndIncreaseDecreaseState();
}

class _QuantityAddButtonAndIncreaseDecreaseState
    extends State<GlobalQuantityButtonsAddAndIncreaseDecrease> {
  bool activeQuantityBar = false;
  bool isPlusAndMinusPressed = true;
  @override
  Widget build(BuildContext context) {
    final controllerIsEmpty = widget.controller.text == "0";

    return Padding(
      padding: EdgeInsets.only(right: context.isSmallDevice ? 0 : 0),
      child: activeQuantityBar
          ? SizedBox(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: context.isSmallDevice ? 10 : 10,
                textDirection: TextDirection.ltr,

                children: [
                  CyrcleIncreaseDecreaseQuantityButton(
                    key: Key("remove"),
                    icon: Icons.remove,
                    controler: widget.controller,
                    isIncrement: false,
                    editingEnd: () => {
                      Future.delayed(const Duration(seconds: 5), () {
                        setState(() {
                          activeQuantityBar = false;
                        });
                      }),
                    },
                  ),
                  QuantityTextField(
                    key: const ValueKey('quantityField'),
                    controller: widget.controller,
                    editingEnd: () => {
                      if (isPlusAndMinusPressed == false)
                        {
                          setState(() {
                            activeQuantityBar = false;
                          }),
                        },
                    },
                  ),
                  CyrcleIncreaseDecreaseQuantityButton(
                    key: Key("add"),
                    icon: Icons.add,
                    controler: widget.controller,
                    isIncrement: true,
                    editingEnd: () => {
                      Future.delayed(const Duration(seconds: 5), () {
                        setState(() {
                          activeQuantityBar = false;
                        });
                      }),
                    },
                  ),
                ],
              ),
            )
          : controllerIsEmpty
          ? AddToCartButton(
              textChild: Text(
                context.l10n.addToCart,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontSize: 10,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                textAlign: TextAlign.center,
              ),
              onPressed: () => {
                setState(() {
                  activeQuantityBar = true;
                  widget.controller.text = 1.toString();
                }),
              },
            )
          // )
          : ConstrainedBox(
              constraints: BoxConstraints(minWidth: 80),
              child: AddToCartButton(
                textChild: Text(
                  textDirection: TextDirection.ltr,
                  "${widget.controller.text} ${context.l10n.itemsCountOfAddToCartButton}",
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontSize: 10,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
                onPressed: () => {
                  setState(() {
                    activeQuantityBar = true;
                  }),
                },
              ),
            ),
    );
  }
}
