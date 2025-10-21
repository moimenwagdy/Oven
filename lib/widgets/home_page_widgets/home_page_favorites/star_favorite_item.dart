import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';

class StarOfFavoriteItem extends StatefulWidget {
  const StarOfFavoriteItem({super.key});

  @override
  State<StarOfFavoriteItem> createState() => _StarOfFavoriteItemState();
}

class _StarOfFavoriteItemState extends State<StarOfFavoriteItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnim;
  bool isSelected = false;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _scaleAnim = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.3), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 1.3, end: 1.0), weight: 50),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggleFavorite() {
    setState(() => isSelected = !isSelected);
    if (isSelected) _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    final iconSize = context.isSmallDevice ? 20.0 : 20.0;

    return GestureDetector(
      onTap: toggleFavorite,
      child: AnimatedBuilder(
        animation: _scaleAnim,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnim.value,
            child: Icon(
              isSelected ? Icons.favorite : Icons.favorite_outline,
              color: isSelected ? Color(0xFFA00000) : Colors.white,
              size: iconSize,
              shadows: const [
                BoxShadow(color: Colors.black, offset: Offset(0, 1)),
              ],
            ),
          );
        },
      ),
    );
  }
}
