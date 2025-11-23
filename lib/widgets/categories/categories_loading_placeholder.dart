import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';

class CategoriesLoadingPlaceholder extends StatefulWidget {
  const CategoriesLoadingPlaceholder({super.key});

  @override
  State<CategoriesLoadingPlaceholder> createState() =>
      _CategoriesLoadingPlaceholderState();
}

class _CategoriesLoadingPlaceholderState
    extends State<CategoriesLoadingPlaceholder>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 1),
  )..repeat(reverse: true);

  late final Animation<double> _animation = Tween(
    begin: 0.2,
    end: 0.5,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      key: const PageStorageKey("CategoriesGrid"),
      scrollDirection: Axis.horizontal,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: context.isSmallDevice ? 10 : 15,
        mainAxisSpacing: context.isSmallDevice ? 10 : 10,
        childAspectRatio: context.isSmallDevice ? .66 : .68,
      ),
      padding: EdgeInsets.zero,
      itemCount: 16,
      itemBuilder: (context, index) {
        return AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Theme.of(context).colorScheme.onSecondaryFixed
                          .withValues(alpha: _animation.value),
                      // color: Theme.of(context).colorScheme.onSecondaryFixed
                      //     .withValues(alpha: _animation.value),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Theme.of(context).colorScheme.onSecondaryFixed
                        .withValues(alpha: _animation.value),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
