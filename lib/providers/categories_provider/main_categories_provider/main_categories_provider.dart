import 'package:oven/providers/locale_provider/locale_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'main_categories_provider.g.dart';

@Riverpod(keepAlive: true)
class MainCategories extends _$MainCategories {
  @override
  FutureOr<List<MainCategory>> build() async {
    return _initialMainCategories();
  }

  Future<List<MainCategory>> _initialMainCategories() async {
    final locale = await ref.watch(appLocaleProvider.future);

    return locale.languageCode == 'ar' ? arabicMainCatsList : mainCatsList;
  }
}

class MainCategory {
  final String id;
  final String title;
  final int deadline;
  final List<String>? products;
  const MainCategory({
    required this.id,
    required this.title,
    required this.deadline,
    this.products,
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
  MainCategory(
    id: "600",
    title: "Frozen stuff",
    deadline: 1200,
    products: ["P5", "P7", "P9"],
  ),
  MainCategory(
    id: "620",
    title: "New stuff",
    deadline: 1200,
    products: ["P4", "P6", "P8"],
  ),
  MainCategory(
    id: "640",
    title: "Hot Drinks",
    deadline: 1200,
    products: ["P11", "P13", "P15"],
  ),
];
List<MainCategory> arabicMainCatsList = [
  MainCategory(id: "12", title: "الكيك", deadline: 900),
  MainCategory(id: "45", title: "الكب كيك", deadline: 600),
  MainCategory(id: "65", title: "البسكويت", deadline: 400),
  MainCategory(id: "78", title: "المعجنات", deadline: 200),
  MainCategory(id: "31", title: "التارت والفطائر", deadline: 500),
  MainCategory(id: "46", title: "الشوكولاتة", deadline: 700),
  MainCategory(id: "28", title: "علب الحلويات", deadline: 1350),
  MainCategory(id: "39", title: "الخبز", deadline: 800),
  MainCategory(id: "17", title: "الكرواسون والمخبوزات الفرنسية", deadline: 900),
  MainCategory(id: "11", title: "الحلويات التقليدية", deadline: 1200),
  MainCategory(id: "23", title: "الحلويات المثلجة", deadline: 1200),
  MainCategory(id: "89", title: "حلويات موسمية", deadline: 1200),
  MainCategory(
    id: "600",
    title: "منتجات مجمدة",
    deadline: 1200,
    products: ["P5", "P7", "P9"],
  ),
  MainCategory(
    id: "620",
    title: "منتجات حديثة",
    deadline: 1200,
    products: ["P4", "P6", "P8"],
  ),
  MainCategory(
    id: "640",
    title: "مشروبات ساخنة",
    deadline: 1200,
    products: ["P11", "P13", "P15"],
  ),
];
