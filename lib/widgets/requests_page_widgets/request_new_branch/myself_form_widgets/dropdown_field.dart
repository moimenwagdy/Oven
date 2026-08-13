import 'package:flutter/material.dart';
import 'package:oven/utils/constants/colors.dart';

class FieldOfDropdownLists extends StatefulWidget {
  final TextEditingController controller;
  final String placeholder;
  final FocusNode? focusNode;

  const FieldOfDropdownLists({
    super.key,
    required this.controller,
    required this.placeholder,
    this.focusNode,
  });

  @override
  State<FieldOfDropdownLists> createState() => _FieldOfDropdownListsState();
}

class _FieldOfDropdownListsState extends State<FieldOfDropdownLists> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onControllerChanged);
  }

  void _onControllerChanged() => setState(() {});

  @override
  void dispose() {
    widget.controller.removeListener(_onControllerChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.labelLarge,
      controller: widget.controller,
      focusNode: widget.focusNode,
      decoration: InputDecoration(
        labelText: widget.placeholder,
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        prefixIcon: GestureDetector(
          onTap: () {
            if (widget.focusNode?.hasFocus ?? false) {
              widget.focusNode?.unfocus();
            } else {
              widget.focusNode?.requestFocus();
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(Icons.arrow_drop_down),
          ),
        ),
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.controller.text.isNotEmpty)
              SizedBox(
                width: 25,
                height: 25,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    widget.controller.clear();
                    widget.focusNode?.requestFocus();
                  },
                  icon: Icon(Icons.close, size: 15),
                ),
              ),
          ],
        ),
        labelStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: .5),
        ),
        floatingLabelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Theme.of(context).colorScheme.secondary,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: primary),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primary),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
