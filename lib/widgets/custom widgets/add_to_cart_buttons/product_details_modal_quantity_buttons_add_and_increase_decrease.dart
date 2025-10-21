import 'package:flutter/material.dart';
import 'package:oven/widgets/custom%20widgets/add_to_cart_buttons/cyrcle_increase_decrease_quantity_button.dart';
import 'package:oven/widgets/custom%20widgets/add_to_cart_buttons/quantity_text_field.dart';
import 'package:oven/widgets/custom%20widgets/forms_custom_widgets/custom_form_submit_button.dart';

class QuantityAddButtonAndIncreaseDecreaseButtons extends StatefulWidget {
  final TextEditingController controller;
  final bool? isDetails;
  const QuantityAddButtonAndIncreaseDecreaseButtons({
    super.key,
    required this.controller,
    this.isDetails,
  });

  @override
  State<QuantityAddButtonAndIncreaseDecreaseButtons> createState() =>
      _QuantityAddButtonAndIncreaseDecreaseButtonsState();
}

class _QuantityAddButtonAndIncreaseDecreaseButtonsState
    extends State<QuantityAddButtonAndIncreaseDecreaseButtons> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        spacing: 40,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 15,
            children: [
              CyrcleIncreaseDecreaseQuantityButton(
                key: Key("remove"),
                icon: Icons.remove,
                controler: widget.controller,
                isIncrement: false,
                editingEnd: () => {},
              ),
              QuantityTextField(
                controller: widget.controller,
                editingEnd: () => {},
              ),
              CyrcleIncreaseDecreaseQuantityButton(
                key: Key("add"),
                icon: Icons.add,
                controler: widget.controller,
                isIncrement: true,
                editingEnd: () => {},
              ),
            ],
          ),
          FormSubmitButtom(
            textChild: Text(
              "Add To Cart",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
            onPressed: () => {print(_formKey.currentState)},
          ),
        ],
      ),
    );
  }
}
