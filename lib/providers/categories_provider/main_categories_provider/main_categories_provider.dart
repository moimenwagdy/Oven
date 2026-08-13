import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'main_categories_provider.g.dart';

@Riverpod(keepAlive: true)
class MainCategories extends _$MainCategories {
  @override
  FutureOr<List<MainCategory>> build() async {
    return _initialMainCategories();
  }

  Future<List<MainCategory>> _initialMainCategories() async {
    return mainCatsList;
  }
}

class MainCategory {
  final String id;
  final String title;
  final int deadline;
  const MainCategory({
    required this.id,
    required this.title,
    required this.deadline,
  });
}

List<MainCategory> mainCatsList = [
  MainCategory(id: "12", title: "Cakes", deadline: 900),
  MainCategory(id: "45", title: "Cupcakes", deadline: 600),
  MainCategory(id: "65", title: "Cookies", deadline: 400),
  MainCategory(id: "78", title: "Pastries", deadline: 200),
  MainCategory(id: "31", title: "Tarts & Pies", deadline: 500),
  MainCategory(id: "46", title: "Chocolates", deadline: 700),
  MainCategory(id: "28", title: "Dessert Boxes", deadline: 1350),
  MainCategory(id: "39", title: "Breads", deadline: 800),
  MainCategory(id: "17", title: "Croissants & Viennoiserie", deadline: 900),
  MainCategory(id: "11", title: "Traditional Sweets", deadline: 1200),
  MainCategory(id: "23", title: "Frozen Desserts", deadline: 1200),
  MainCategory(id: "89", title: "Seasonal Specials", deadline: 1200),
];
