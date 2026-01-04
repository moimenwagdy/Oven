import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/providers/search_provider/search_provider.dart';
import 'package:oven/widgets/custom_widgets/search_bar/search_result_items.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    final savedQuery = ref.read(searchProvider);
    _controller = TextEditingController(text: savedQuery);
  }

  @override
  Widget build(BuildContext context) {
    final searchProvier = ref.read(searchProvider.notifier);
    final query = ref.watch(searchProvider);
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Theme.of(context).colorScheme.onSecondary,
            alignment: Alignment.bottomCenter,
            height: 90,
            child: SearchBar(
              surfaceTintColor: WidgetStatePropertyAll(Colors.transparent),
              controller: _controller,
              leading: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => {
                    context.pop(),
                    _controller.clear(),
                    searchProvier.setSearchQuery(""),
                  },
                ),
              ),
              onChanged: (value) {
                searchProvier.setSearchQuery(value);
              },
              autoFocus: true,
              textStyle: WidgetStatePropertyAll(
                Theme.of(context).textTheme.labelLarge,
              ),
              trailing: [
                IconButton(
                  onPressed: () {
                    _controller.clear();
                    searchProvier.setSearchQuery("");
                  },
                  icon: Icon(Icons.close),
                ),
              ],
              elevation: WidgetStatePropertyAll(0),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(0),
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(child: SearchResultItems(query: query)),
          ),
        ],
      ),
    );
  }
}
