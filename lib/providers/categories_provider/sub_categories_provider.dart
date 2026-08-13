import 'dart:typed_data';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sub_categories_provider.g.dart';

@riverpod
class CategoriesNotifier extends _$CategoriesNotifier {
  @override
  FutureOr<List<SubCategory>> build() async {
    return fetchCategories();
  }

  Future<List<SubCategory>> fetchCategories() async {
    return subCategoriesList;
  }

  Future refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(fetchCategories);
  }
}

class SubCategory {
  final String id;
  final String name;
  final Uint8List? thumbnail;
  final MainCategoryData mainCategory;
  final int? order;

  SubCategory({
    required this.id,
    required this.name,
    required this.thumbnail,
    required this.mainCategory,
    required this.order,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      id: json['id'] as String,
      name: json['name'] as String,
      order: json['order'] as int?,
      thumbnail: json['thumbnail'] as Uint8List?,
      mainCategory: json['mainCategory'] as MainCategoryData,
    );
  }
}

class MainCategoryData {
  final String id;
  final String title;
  const MainCategoryData({required this.id, required this.title});
}

List<SubCategory> subCategoriesList = [
  // Cakes (12)
  SubCategory(
    id: "12-1",
    name: "Birthday Cakes",
    thumbnail: null,
    mainCategory: MainCategoryData(id: "12", title: "Cakes"),
    order: 1,
  ),
  SubCategory(
    id: "12-2",
    name: "Wedding Cakes",
    thumbnail: null,
    mainCategory: MainCategoryData(id: "12", title: "Cakes"),
    order: 2,
  ),
  SubCategory(
    id: "12-3",
    name: "Custom Cakes",
    thumbnail: null,
    mainCategory: MainCategoryData(id: "12", title: "Cakes"),
    order: 3,
  ),

  // Cupcakes (45)
  SubCategory(
    id: "45-1",
    name: "Classic Cupcakes",
    thumbnail: null,
    mainCategory: MainCategoryData(id: "45", title: "Cupcakes"),
    order: 1,
  ),
  SubCategory(
    id: "45-2",
    name: "Filled Cupcakes",
    thumbnail: null,
    mainCategory: MainCategoryData(id: "45", title: "Cupcakes"),
    order: 2,
  ),
  SubCategory(
    id: "45-3",
    name: "Mini Cupcakes",
    thumbnail: null,
    mainCategory: MainCategoryData(id: "45", title: "Cupcakes"),
    order: 3,
  ),
  SubCategory(
    id: "12-4",
    name: "Birthday Cakes",
    thumbnail: null,
    mainCategory: MainCategoryData(id: "12", title: "Cakes"),
    order: 1,
  ),
  SubCategory(
    id: "12-5",
    name: "Wedding Cakes",
    thumbnail: null,
    mainCategory: MainCategoryData(id: "12", title: "Cakes"),
    order: 2,
  ),
  SubCategory(
    id: "12-6",
    name: "Custom Cakes",
    thumbnail: null,
    mainCategory: MainCategoryData(id: "12", title: "Cakes"),
    order: 3,
  ),

  // Cupcakes (45)
  SubCategory(
    id: "45-4",
    name: "Classic Cupcakes",
    thumbnail: null,
    mainCategory: MainCategoryData(id: "45", title: "Cupcakes"),
    order: 1,
  ),
  SubCategory(
    id: "45-5",
    name: "Filled Cupcakes",
    thumbnail: null,
    mainCategory: MainCategoryData(id: "45", title: "Cupcakes"),
    order: 2,
  ),
  SubCategory(
    id: "45-6",
    name: "Mini Cupcakes",
    thumbnail: null,
    mainCategory: MainCategoryData(id: "45", title: "Cupcakes"),
    order: 3,
  ),

  // Cookies (65)
  SubCategory(
    id: "65-1",
    name: "Chocolate Chip Cookies",
    thumbnail: null,
    mainCategory: MainCategoryData(id: "65", title: "Cookies"),
    order: 1,
  ),
  SubCategory(
    id: "65-2",
    name: "Butter Cookies",
    thumbnail: null,
    mainCategory: MainCategoryData(id: "65", title: "Cookies"),
    order: 2,
  ),
  SubCategory(
    id: "65-3",
    name: "Stuffed Cookies",
    thumbnail: null,
    mainCategory: MainCategoryData(id: "65", title: "Cookies"),
    order: 3,
  ),
  SubCategory(
    id: "65-1",
    name: "Chocolate Chip Cookies",
    thumbnail: null,
    mainCategory: MainCategoryData(id: "65", title: "Cookies"),
    order: 1,
  ),
  SubCategory(
    id: "65-2",
    name: "Butter Cookies",
    thumbnail: null,
    mainCategory: MainCategoryData(id: "65", title: "Cookies"),
    order: 2,
  ),
  SubCategory(
    id: "65-3",
    name: "Stuffed Cookies",
    thumbnail: null,
    mainCategory: MainCategoryData(id: "65", title: "Cookies"),
    order: 3,
  ),
  SubCategory(
    id: "65-1",
    name: "Chocolate Chip Cookies",
    thumbnail: null,
    mainCategory: MainCategoryData(id: "65", title: "Cookies"),
    order: 1,
  ),
  SubCategory(
    id: "65-2",
    name: "Butter Cookies",
    thumbnail: null,
    mainCategory: MainCategoryData(id: "65", title: "Cookies"),
    order: 2,
  ),
  SubCategory(
    id: "65-3",
    name: "Stuffed Cookies",
    thumbnail: null,
    mainCategory: MainCategoryData(id: "65", title: "Cookies"),
    order: 3,
  ),
  SubCategory(
    id: "65-1",
    name: "Chocolate Chip Cookies",
    thumbnail: null,
    mainCategory: MainCategoryData(id: "65", title: "Cookies"),
    order: 1,
  ),
  SubCategory(
    id: "65-2",
    name: "Butter Cookies",
    thumbnail: null,
    mainCategory: MainCategoryData(id: "65", title: "Cookies"),
    order: 2,
  ),
  SubCategory(
    id: "65-3",
    name: "Stuffed Cookies",
    thumbnail: null,
    mainCategory: MainCategoryData(id: "65", title: "Cookies"),
    order: 3,
  ),
  SubCategory(
    id: "65-1",
    name: "Chocolate Chip Cookies",
    thumbnail: null,
    mainCategory: MainCategoryData(id: "65", title: "Cookies"),
    order: 1,
  ),
  SubCategory(
    id: "65-2",
    name: "Butter Cookies",
    thumbnail: null,
    mainCategory: MainCategoryData(id: "65", title: "Cookies"),
    order: 2,
  ),
  SubCategory(
    id: "65-3",
    name: "Stuffed Cookies",
    thumbnail: null,
    mainCategory: MainCategoryData(id: "65", title: "Cookies"),
    order: 3,
  ),

  // Pastries (78)
  SubCategory(
    id: "78-1",
    name: "Danish Pastries",
    thumbnail: null,
    mainCategory: MainCategoryData(id: "78", title: "Pastries"),
    order: 1,
  ),
  SubCategory(
    id: "78-2",
    name: "Puff Pastries",
    thumbnail: null,
    mainCategory: MainCategoryData(id: "78", title: "Pastries"),
    order: 2,
  ),
  SubCategory(
    id: "78-3",
    name: "Savory Pastries",
    thumbnail: null,
    mainCategory: MainCategoryData(id: "78", title: "Pastries"),
    order: 3,
  ),

  // Tarts & Pies (31)
  SubCategory(
    id: "31-1",
    name: "Fruit Tarts",
    thumbnail: null,
    mainCategory: MainCategoryData(id: "31", title: "Tarts & Pies"),
    order: 1,
  ),
  SubCategory(
    id: "31-2",
    name: "Cream Pies",
    thumbnail: null,
    mainCategory: MainCategoryData(id: "31", title: "Tarts & Pies"),
    order: 2,
  ),
  SubCategory(
    id: "31-3",
    name: "Chocolate Pies",
    thumbnail: null,
    mainCategory: MainCategoryData(id: "31", title: "Tarts & Pies"),
    order: 3,
  ),

  // Chocolates (46)
  SubCategory(
    id: "46-1",
    name: "Chocolate Bars",
    thumbnail: null,
    mainCategory: MainCategoryData(id: "46", title: "Chocolates"),
    order: 1,
  ),
  SubCategory(
    id: "46-2",
    name: "Truffles",
    thumbnail: null,
    mainCategory: MainCategoryData(id: "46", title: "Chocolates"),
    order: 2,
  ),
  SubCategory(
    id: "46-3",
    name: "Gift Chocolate Boxes",
    thumbnail: null,
    mainCategory: MainCategoryData(id: "46", title: "Chocolates"),
    order: 3,
  ),

  // Dessert Boxes (28)
  SubCategory(
    id: "28-1",
    name: "Mixed Dessert Boxes",
    thumbnail: null,
    mainCategory: MainCategoryData(id: "28", title: "Dessert Boxes"),
    order: 1,
  ),
  SubCategory(
    id: "28-2",
    name: "Mini Treat Boxes",
    thumbnail: null,
    mainCategory: MainCategoryData(id: "28", title: "Dessert Boxes"),
    order: 2,
  ),
  SubCategory(
    id: "28-3",
    name: "Party Boxes",
    thumbnail: null,
    mainCategory: MainCategoryData(id: "28", title: "Dessert Boxes"),
    order: 3,
  ),

  // Breads (39)
  SubCategory(
    id: "39-1",
    name: "White Bread",
    thumbnail: null,
    mainCategory: MainCategoryData(id: "39", title: "Breads"),
    order: 1,
  ),
  SubCategory(
    id: "39-2",
    name: "Whole Wheat Bread",
    thumbnail: null,
    mainCategory: MainCategoryData(id: "39", title: "Breads"),
    order: 2,
  ),
  SubCategory(
    id: "39-3",
    name: "Artisan Bread",
    thumbnail: null,
    mainCategory: MainCategoryData(id: "39", title: "Breads"),
    order: 3,
  ),

  // Croissants & Viennoiserie (17)
  SubCategory(
    id: "17-1",
    name: "Butter Croissants",
    thumbnail: null,
    mainCategory: MainCategoryData(
      id: "17",
      title: "Croissants & Viennoiserie",
    ),
    order: 1,
  ),
  SubCategory(
    id: "17-2",
    name: "Chocolate Croissants",
    thumbnail: null,
    mainCategory: MainCategoryData(
      id: "17",
      title: "Croissants & Viennoiserie",
    ),
    order: 2,
  ),
  SubCategory(
    id: "17-3",
    name: "Almond Croissants",
    thumbnail: null,
    mainCategory: MainCategoryData(
      id: "17",
      title: "Croissants & Viennoiserie",
    ),
    order: 3,
  ),

  // Traditional Sweets (11)
  SubCategory(
    id: "11-1",
    name: "Basbousa",
    thumbnail: null,
    mainCategory: MainCategoryData(id: "11", title: "Traditional Sweets"),
    order: 1,
  ),
  SubCategory(
    id: "11-2",
    name: "Kunafa",
    thumbnail: null,
    mainCategory: MainCategoryData(id: "11", title: "Traditional Sweets"),
    order: 2,
  ),
  SubCategory(
    id: "11-3",
    name: "Baklava",
    thumbnail: null,
    mainCategory: MainCategoryData(id: "11", title: "Traditional Sweets"),
    order: 3,
  ),

  // Frozen Desserts (23)
  SubCategory(
    id: "23-1",
    name: "Ice Cream",
    thumbnail: null,
    mainCategory: MainCategoryData(id: "23", title: "frozen Desserts"),
    order: 1,
  ),
  SubCategory(
    id: "23-2",
    name: "Gelato",
    thumbnail: null,
    mainCategory: MainCategoryData(id: "23", title: "frozen Desserts"),
    order: 2,
  ),
  SubCategory(
    id: "23-3",
    name: "Ice Cream Cakes",
    thumbnail: null,
    mainCategory: MainCategoryData(id: "23", title: "frozen Desserts"),
    order: 3,
  ),

  // Seasonal Specials (89)
  SubCategory(
    id: "89-1",
    name: "Ramadan Specials",
    thumbnail: null,
    mainCategory: MainCategoryData(id: "89", title: "Seasonal Specials"),
    order: 1,
  ),
  SubCategory(
    id: "89-2",
    name: "Christmas Specials",
    thumbnail: null,
    mainCategory: MainCategoryData(id: "89", title: "Seasonal Specials"),
    order: 2,
  ),
  SubCategory(
    id: "89-3",
    name: "Valentine Specials",
    thumbnail: null,
    mainCategory: MainCategoryData(id: "89", title: "Seasonal Specials"),
    order: 3,
  ),
];
