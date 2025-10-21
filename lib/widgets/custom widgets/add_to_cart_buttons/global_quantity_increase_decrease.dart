import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/custom%20widgets/add_to_cart_buttons/cyrcle_increase_decrease_quantity_button.dart';
import 'package:oven/widgets/custom%20widgets/add_to_cart_buttons/quantity_text_field.dart';

class GlobalQuantityIncreaseDecrease extends StatefulWidget {
  final TextEditingController controller;
  const GlobalQuantityIncreaseDecrease({
    super.key,
    required this.controller,
  });

  @override
  State<GlobalQuantityIncreaseDecrease> createState() =>
      _GlobalQuantityIncreaseDecreaseState();
}

class _GlobalQuantityIncreaseDecreaseState
    extends State<GlobalQuantityIncreaseDecrease> {
  bool activeQuantityBar = false;
  bool isPlusAndMinusPressed = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: context.isSmallDevice ? 10 : 15,
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
    );
  }
}
