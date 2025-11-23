import 'package:flutter/material.dart';
import 'package:oven/widgets/custom%20widgets/product_item_card/product_item_card.dart';
import 'package:oven/widgets/products_page_widgets/helpers/products_dummy_data.dart';

class ProductsPageItems extends StatefulWidget {
  final List<Product> productsList;
  final bool showFavoriteButton;
  const ProductsPageItems({
    super.key,
    required this.productsList,
    required this.showFavoriteButton,
  });

  @override
  State<ProductsPageItems> createState() => _ProductsPageItemsState();
}

class _ProductsPageItemsState extends State<ProductsPageItems>
    with AutomaticKeepAliveClientMixin {
  late final List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      widget.productsList.length,
      (_) => TextEditingController(text: "0"),
    );
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
      addAutomaticKeepAlives: true,
      padding: EdgeInsets.symmetric(horizontal: 5),
      key: const PageStorageKey("ProductsPageItems"),
      itemCount: widget.productsList.length,
      itemBuilder: (context, index) {
        final product = widget.productsList[index];
        return ProductItemCard(
          key: Key("ProdcutItem$index"),
          quantityController: _controllers[index],
          title: product.title,
          description: product.description,
          showFavoriteButton: widget.showFavoriteButton,
          id: product.id,
          price: product.price,
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

// final List<Product> desserts = [
//   Product(
//     title: "Chocolate Lava Cake",
//     description: "A warm, gooey chocolate cake with a molten center.",
//     images: [],
//     video: null,
//   ),
//   Product(
//     title: "Strawberry Cheesecake",
//     description: "Creamy baked cheesecake topped with fresh strawberries.",
//     images: [],
//     video: null,
//   ),
//   Product(
//     title: "Tiramisu",
//     description: "Classic Italian dessert with espresso-soaked ladyfingers.",
//     images: [],
//     video: null,
//   ),
//   Product(
//     title: "Lemon Tart",
//     description: "Tangy lemon custard in a buttery pastry shell.",
//     images: [],
//     video: null,
//   ),
//   Product(
//     title: "Vanilla Panna Cotta",
//     description: "Smooth vanilla cream served with berry compote.",
//     images: [],
//     video: null,
//   ),
//   Product(
//     title: "Coconut Mousse",
//     description: "Light and airy coconut mousse topped with toasted flakes.",
//     images: [],
//     video: null,
//   ),
//   Product(
//     title: "Red Velvet Cupcake",
//     description: "Moist red velvet cake with cream cheese frosting.",
//     images: [],
//     video: null,
//   ),
//   Product(
//     title: "Apple Crumble",
//     description: "Warm baked apples with a crispy cinnamon topping.",
//     images: [],
//     video: null,
//   ),
//   Product(
//     title: "Raspberry Macarons",
//     description: "Delicate almond cookies filled with raspberry ganache.",
//     images: [],
//     video: null,
//   ),
//   Product(
//     title: "Caramel Éclair",
//     description:
//         "Choux pastry filled with custard and topped with caramel glaze.",
//     images: [],
//     video: null,
//   ),
// ];

// final List<Product> arabicDesserts = [
//   Product(
//     title: "كيك الشوكولاتة السائل",
//     description: "كيك شوكولاتة دافئ بحشوة لافا ذائبة في المنتصف.",
//     images: [],
//     video: null,
//   ),
//   Product(
//     title: "تشيز كيك الفراولة",
//     description: "تشيز كيك مخبوز كريمي مغطى بشرائح الفراولة الطازجة.",
//     images: [],
//     video: null,
//   ),
//   Product(
//     title: "تيراميسو",
//     description:
//         "تحلية إيطالية كلاسيكية بطبقات من البسكويت المنقوع بالإسبريسو.",
//     images: [],
//     video: null,
//   ),
//   Product(
//     title: "تارت الليمون",
//     description: "كاسترد ليمون لاذع داخل قشرة عجين زبدية.",
//     images: [],
//     video: null,
//   ),
//   Product(
//     title: "بانّا كوتا بالفانيليا",
//     description: "كريم فانيليا ناعم يُقدّم مع صوص التوت.",
//     images: [],
//     video: null,
//   ),
//   Product(
//     title: "موس جوز الهند",
//     description: "موس خفيف وهش بنكهة جوز الهند ومغطى بشرائح جوز الهند المحمصة.",
//     images: [],
//     video: null,
//   ),
//   Product(
//     title: "كب كيك الفلفت الأحمر",
//     description: "كيك أحمر مخملي رطب مع كريمة الجبن الكريمية.",
//     images: [],
//     video: null,
//   ),
//   Product(
//     title: "كرامبل التفاح",
//     description: "تفاح مخبوز دافئ مع طبقة مقرمشة بطعم القرفة.",
//     images: [],
//     video: null,
//   ),
//   Product(
//     title: "ماكرون بالتوت",
//     description: "بسكويت لوز رقيق محشو بغاناش التوت.",
//     images: [],
//     video: null,
//   ),
//   Product(
//     title: "إكلير الكراميل",
//     description: "عجينة شو محشوة بالكاسترد ومغطاة بطبقة من الكراميل اللامع.",
//     images: [],
//     video: null,
//   ),
// ];
