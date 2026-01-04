import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:oven/providers/cart_provider/cart_tooltip_notifier.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/cart_page_widgets/cart_items_section.dart';
import 'package:oven/widgets/cart_page_widgets/cart_options_section.dart';
import 'package:oven/widgets/cart_page_widgets/cart_sugessions_list.dart';

class CartPage extends ConsumerStatefulWidget {
  const CartPage({super.key});

  @override
  ConsumerState<CartPage> createState() => _CartPageState();
}

class _CartPageState extends ConsumerState<CartPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(cartTooltipProvider.notifier).checkTooltip();
    });
  }

  @override
  Widget build(BuildContext context) {
    final showTooltip = ref.watch(cartTooltipProvider);
    if (showTooltip) {
      Fluttertoast.showToast(
        msg: context.isArabic
            ? "إسحب لليسار لإضافة تعليق او الإزالة"
            : "Swipe left on items to comment or delete",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.black.withValues(alpha: .4),
        textColor: Colors.white,
      );
    }
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: const [
              CartItemsSection(),
              SizedBox(height: 10),
              CartListSuggesionsList(),
              CartOptionsSection(),
            ],
          ),
        ),
      ],
    );
  }
}
