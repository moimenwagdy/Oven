import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/home_page_widgets/home_page_favorites/home_page_favorite_items.dart';

class StarOfFavoriteItem extends StatefulWidget {
  final bool activeFavoriteStyle;
  final String id;
  const StarOfFavoriteItem({
    super.key,
    required this.activeFavoriteStyle,
    required this.id,
  });

  @override
  State<StarOfFavoriteItem> createState() => _StarOfFavoriteItemState();
}

class _StarOfFavoriteItemState extends State<StarOfFavoriteItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnim;
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

  @override
  Widget build(BuildContext context) {
    final iconSize = context.isSmallDevice ? 20.0 : 20.0;
    return Consumer(
      builder: (data, ref, child) {
        final itemIdList = ref.watch(favoriteItemsProProvider);
        final isFavoriteItem = itemIdList.any((ele) => ele == widget.id);
        return GestureDetector(
          onTap: () => {
            if (isFavoriteItem)
              {
                ref
                    .watch(favoriteItemsProProvider.notifier)
                    .removeFromFavorites(widget.id),
              }
            else
              {
                ref
                    .watch(favoriteItemsProProvider.notifier)
                    .addToFavorites(widget.id),
                _controller.forward(from: 0),
              },
          },
          child: AnimatedBuilder(
            animation: _scaleAnim,
            builder: (context, child) {
              return Transform.scale(
                scale: _scaleAnim.value,
                child: Icon(
                  isFavoriteItem ? Icons.favorite : Icons.favorite_outline,
                  color: isFavoriteItem ? Color(0xFFA00000) : Colors.white,
                  size: iconSize,
                  shadows: const [
                    BoxShadow(color: Colors.black, offset: Offset(0, 1)),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
