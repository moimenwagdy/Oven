import 'package:flutter/material.dart';

class SearchView extends SearchDelegate<String> {
  final List<String> data = ["Apple", "Banana", "Mango", "Orange"];

  @override
  ThemeData appBarTheme(BuildContext context) {
    final theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: theme.appBarTheme.copyWith(
        elevation: 0,
        backgroundColor: theme.colorScheme.surface,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: InputBorder.none,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        hintStyle: theme.textTheme.labelLarge,
      ),
      textTheme: theme.textTheme.copyWith(
        titleLarge: theme.textTheme.labelLarge?.copyWith(),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(icon: const Icon(Icons.clear), onPressed: () => query = ''),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, ''),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    ///////////// to make API Calls And return Widgets
    // return FutureBuilder<List<String>>(
    //   future: ,
    //   builder:  (context, snapshot) {
    // if (snapshot.connectionState == ConnectionState.waiting) {
    //   return const Center(child: CircularProgressIndicator());
    // } else if (snapshot.hasError) {
    //   return Center(child: Text("Error: ${snapshot.error}"));
    // } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
    //   return const Center(child: Text("No results found"));
    // }
    // );
    ///////////////////
    // final results = data
    //     .where((item) => item.toLowerCase().contains(query.toLowerCase()))
    //     .toList();
    // return ListView(
    //   children: results.map((e) => ListTile(title: Text(e))).toList(),
    // );

    return SizedBox(width: double.infinity, child: Text(query));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = data
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView(
      children: suggestions
          .map(
            (e) => ListTile(
              title: Text(e),
              onTap: () {
                query = e;
                showResults(context);
              },
            ),
          )
          .toList(),
    );
  }
}
