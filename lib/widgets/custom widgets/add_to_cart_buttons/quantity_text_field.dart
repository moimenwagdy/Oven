import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';

class QuantityTextField extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback editingEnd;
  const QuantityTextField({
    super.key,
    required this.controller,
    required this.editingEnd,
  });

  @override
  State<QuantityTextField> createState() => _QuantityTextFieldState();
}

class _QuantityTextFieldState extends State<QuantityTextField>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RepaintBoundary(
      child: Container(
        width: context.isSmallDevice ? 35 : 45,
        height: context.isSmallDevice ? 20 : 25,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary.withValues(alpha: .4),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: TextField(
            textAlignVertical: TextAlignVertical.center,
            strutStyle: const StrutStyle(forceStrutHeight: true, height: 1),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
              fontFamily: "Poppins",
              fontSize: 12,
            ),
            onTapUpOutside: (value) => {
              print("value ********************* ${widget.controller.text}"),
              widget.editingEnd(),
              FocusScope.of(context).unfocus(),
            },
            onEditingComplete: () => widget.editingEnd(),
            controller: widget.controller,
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
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
