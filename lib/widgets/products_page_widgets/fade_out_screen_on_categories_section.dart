import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';

class FadeOutScreenOnCategoriesSection extends StatefulWidget {
  final ScrollController scrollControler;
  const FadeOutScreenOnCategoriesSection({
    super.key,
    required this.scrollControler,
  });

  @override
  State<FadeOutScreenOnCategoriesSection> createState() =>
      _FadeOutScreenOnCategoriesSectionState();
}

class _FadeOutScreenOnCategoriesSectionState
    extends State<FadeOutScreenOnCategoriesSection> {
  double _scrollOffset = 0.0;

  @override
  void initState() {
    super.initState();
    widget.scrollControler.addListener(() {
      setState(() {
        _scrollOffset = widget.scrollControler.offset.clamp(0, 310);
      });
    });
  }

  @override
  void dispose() {
    widget.scrollControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double startFadeAfter = 90;
    final double fadeRange = 200 - startFadeAfter;
    final double opacity = ((_scrollOffset - startFadeAfter) / fadeRange).clamp(
      0,
      1,
    );
    return IgnorePointer(
      ignoring: _scrollOffset < 100,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: context.isDarkMode
                  ? Colors.black.withValues(alpha: opacity)
                  : Colors.white.withValues(alpha: opacity),
              offset: Offset(0, 0),
              spreadRadius: 8,
              blurStyle: BlurStyle.outer,
            ),
          ],
          color: context.isDarkMode
              ? Colors.black.withValues(alpha: opacity)
              : Colors.white.withValues(alpha: opacity),
        ),
      ),
    );
  }
}
