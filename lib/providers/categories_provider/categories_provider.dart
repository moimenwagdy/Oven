import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:oven/widgets/categories/categories.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'categories_provider.g.dart';

@riverpod
class CategoriesNotifier extends _$CategoriesNotifier {
  @override
  FutureOr<List<Category>> build() async {
    return fetchCategories();
  }

  Future<List<Category>> fetchCategories() async {
    final response = await http.get(
      Uri.parse('https://dummyjson.com/products/categories'),
    );
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => Category.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(fetchCategories);
  }
}
