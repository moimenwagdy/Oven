import 'package:flutter/material.dart';

class QuantityTextField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback editingEnd;
  const QuantityTextField({
    super.key,
    required this.controller,
    required this.editingEnd,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 25,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary.withValues(alpha: .4),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Center(
        child: TextField(
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
            fontFamily: "Poppins",
          ),
          onTapUpOutside: (value) => {
            print("value ********************* ${controller.text}"),
            editingEnd(),
            FocusScope.of(context).unfocus(),
          },
          onEditingComplete: () => editingEnd(),
          controller: controller,
          keyboardType: TextInputType.number,
          showCursor: false,
          maxLength: 2,
          decoration: const InputDecoration(
            counterText: "",
            // hintText: "1",
            counter: null,
            hintStyle: TextStyle(fontFamily: "Poppins", fontSize: 12),
            isDense: true,
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          ),
        ),
      ),
    );
  }
}
