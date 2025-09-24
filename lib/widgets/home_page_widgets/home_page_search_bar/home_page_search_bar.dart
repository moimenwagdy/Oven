import 'package:flutter/material.dart';
import 'package:oven/widgets/home_page_widgets/home_page_search_bar/search_view.dart';

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

class HomePageSearchBar extends StatelessWidget {
  const HomePageSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: SearchBar(
        onChanged: null,
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onSurface,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            Icons.search,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        hintText: 'Search...',
        hintStyle: WidgetStateProperty.all(
          Theme.of(context).textTheme.labelLarge,
        ),
        padding: WidgetStateProperty.all(EdgeInsets.symmetric(horizontal: 10)),
        focusNode: AlwaysDisabledFocusNode(),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.zero),
        ),
        onTap: () {
          showSearch(context: context, delegate: SearchView());
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';
