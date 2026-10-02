import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/providers/pop_provider/pop_provider.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';

class CartIsEmptyCart extends ConsumerWidget {
  final bool? extendHeight;
  const CartIsEmptyCart({super.key, this.extendHeight = false});
  @override
  Widget build(BuildContext context, ref) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final secondaryColor = Theme.of(context).colorScheme.onPrimary;
    return Container(
      width: context.screenWidth * .95,
      constraints: BoxConstraints(maxHeight: 200),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            primaryColor.withValues(alpha: 1),
            primaryColor.withValues(alpha: .75),
          ],
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your cart is empty',
              style: TextStyle(
                color: secondaryColor,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Browse our menu and add your favorites to get started',
              style: TextStyle(
                color: secondaryColor,
                fontSize: 13,
                height: 1.3,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      context.go('/products');
                      ref
                          .read(navigationIndexProvider.notifier)
                          .setNavigationIndex(1);
                    }, // adjust to your route
                    style: ElevatedButton.styleFrom(
                      foregroundColor: primaryColor,
                      backgroundColor: secondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                    ),
                    child: const Text(
                      'Let\'s Go',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
