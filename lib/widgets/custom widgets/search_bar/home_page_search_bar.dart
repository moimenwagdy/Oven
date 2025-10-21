import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/custom%20widgets/search_bar/search_view.dart';

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
      height: 35,
      child: SearchBar(
        overlayColor: WidgetStatePropertyAll(Colors.transparent),
        shadowColor: WidgetStatePropertyAll(Colors.transparent),
        surfaceTintColor: WidgetStatePropertyAll(Colors.transparent),
        focusNode: AlwaysDisabledFocusNode(),
        autoFocus: false,
        backgroundColor: WidgetStatePropertyAll(Colors.white),
        elevation: WidgetStateProperty.all(0),
        onChanged: null,
        leading: Icon(
          Icons.search,
          color: Theme.of(context).colorScheme.onSurface,
        ),
        hintText: '${context.l10n.search}...',
        hintStyle: WidgetStateProperty.all(
          Theme.of(context).textTheme.labelLarge,
        ),
        padding: WidgetStateProperty.all(EdgeInsets.symmetric(horizontal: 10)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16),
          ),
        ),
        onTap: () {
          showSearch(context: context, delegate: SearchView());
        },
      ),
    );
  }
}
