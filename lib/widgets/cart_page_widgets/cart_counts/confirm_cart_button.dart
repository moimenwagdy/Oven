import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/providers/authentication_provider/auth_provider.dart';
import 'package:oven/providers/cart_provider/cart_comment_notifier.dart';
import 'package:oven/providers/cart_provider/cart_notifier.dart';
import 'package:oven/providers/pop_provider/pop_provider.dart';
import 'package:oven/providers/recent_orders_provider/recent_orders_provider.dart';
import 'package:oven/providers/schedule_order_provider/scheduled_order_date_provider.dart';
import 'package:oven/utils/helpers/delete_cart_images_folder.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/custom_widgets/custom_global_button.dart';
import 'package:oven/widgets/orders_page_widgets/recent_orders_items.dart';
import 'package:uuid/uuid.dart';

class ConfirmCartButton extends ConsumerWidget {
  const ConfirmCartButton({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final isLoggedIn = ref.watch(fakeAuthProvider).value != null;
    final cartList = ref.watch(cartProvider).value;
    final caaart = ref.watch(cartProvider);

    final itemWithImage = caaart.whenData((date) {
      return date.indexWhere((item) => item.image != null);
    });
    final hasImage = itemWithImage.value != -1;

    final orderContentList = cartList?.map((ele) {
      return ele.title;
    }).toList();
    final random = Random();
    final cartComment = ref.watch(cartCommentProvider);
    final scheduledDate = ref.watch(scheduledOrderDateProvider);
    final now = DateTime.now();
    final deliveryDate = scheduledDate != null
        ? DateTime(scheduledDate.year, scheduledDate.month, scheduledDate.day)
        : DateTime(now.year, now.month, now.day + 1);
    final totalCost = cartList?.fold<double>(
      0,
      (sum, item) => sum + item.quantity * item.price,
    );
    final taxes = (totalCost! * .10);
    final netTotal = (totalCost + taxes + 15);
    return Container(
      width: context.screenWidth * .65,
      height: context.isSmallDevice ? 40 : 50,
      margin: EdgeInsets.only(top: 5),
      child: CustomGlobalButton(
        child: context.l10n.placeOrder,
        onPressed: () {
          if (!isLoggedIn) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Theme.of(context).colorScheme.error,
                duration: const Duration(milliseconds: 1200),
                content: Text(
                  context.isArabic ? 'الرجاء تسجيل الدخول' : 'Please Login',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Theme.of(context).colorScheme.surface,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
            return;
          }
          ref
              .read(recentOrdersListProvider.notifier)
              .addOrder(
                OrderItem(
                  id: const Uuid().v4(),
                  itemsList: orderContentList!,
                  totalCost: netTotal,
                  cartData: cartList!,
                  status: scheduledDate != null
                      ? "Scheduled"
                      : filteringvalues[random.nextInt(filteringvalues.length)],

                  date: DateTime.now(),
                  deliveryDate: deliveryDate,
                  orderComment: cartComment,
                ),
              );

          ref.read(cartProvider.notifier).clearCart();
          if (hasImage) {
            deleteCartImageFolder(
              cartList[itemWithImage.value!].image!.path.toString(),
            );
          }
          ref.read(scheduledOrderDateProvider.notifier).updateDate(null);

          ref.read(navigationIndexProvider.notifier).setNavigationIndex(2);
          ref.read(cartCommentProvider.notifier).setCartComment("comment");
          context.go("/orders");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              duration: const Duration(milliseconds: 1200),
              content: Text(
                context.isArabic ? 'تم تأكيد الطلب' : 'Order Placed',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Theme.of(context).colorScheme.surface,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
    );
  }
}

final List<String> filteringvalues = ['Delivered', 'Preparing', 'Cancelled'];
