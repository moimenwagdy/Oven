import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/utils/constants/colors.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

class HomePageSearchBar extends StatelessWidget {
  const HomePageSearchBar({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth * .9,
      height: context.isSmallDevice ? 35 : 40,
      child: SearchBar(
        overlayColor: WidgetStatePropertyAll(Colors.transparent),
        shadowColor: WidgetStatePropertyAll(Colors.transparent),
        surfaceTintColor: WidgetStatePropertyAll(Colors.transparent),
        focusNode: AlwaysDisabledFocusNode(),
        autoFocus: false,
        backgroundColor: WidgetStatePropertyAll(Colors.transparent),
        elevation: WidgetStateProperty.all(0),
        onChanged: null,
        leading: Icon(Icons.search, color: primary),
        hintText: '${context.l10n.search}...',
        hintStyle: WidgetStateProperty.all(
          Theme.of(context).textTheme.labelLarge?.copyWith(color: primary),
        ),
        padding: WidgetStateProperty.all(EdgeInsets.symmetric(horizontal: 10)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16),
            side: BorderSide(color: primary, width: 1),
          ),
        ),
        onTap: () {
          context.push("/search");
        },
      ),
    );
  }
}
