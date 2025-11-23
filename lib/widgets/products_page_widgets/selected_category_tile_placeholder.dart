import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';

class SelectedCategoryTilePlaceholder extends StatefulWidget {
  const SelectedCategoryTilePlaceholder({super.key});

  @override
  State<SelectedCategoryTilePlaceholder> createState() =>
      _SelectedCategoryTilePlaceholderState();
}

class _SelectedCategoryTilePlaceholderState
    extends State<SelectedCategoryTilePlaceholder>
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
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          color: Theme.of(
            context,
          ).colorScheme.onSecondaryFixed.withValues(alpha: _animation.value),
          width: context.screenWidth * .8,
          height: 40,
          margin: const EdgeInsets.symmetric(vertical: 5),
        );
      },
    );
  }
}
