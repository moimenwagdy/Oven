import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/favorite_items_provider/favorite_items_provider.dart';

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
    final iconSize = 20.0;
    return Consumer(
      builder: (data, ref, child) {
        final favoriteProvider = ref.watch(favoriteItemsProProvider);
        final isFavoriteItem = favoriteProvider.when(
          data: (isFavoriteItem) {
            return isFavoriteItem.any((ele) => ele == widget.id);
          },
          error: (e, _) => false,
          loading: () => false,
        );

        return GestureDetector(
          onTap: () => {
            if (isFavoriteItem)
              {
                ref
                    .read(favoriteItemsProProvider.notifier)
                    .removeFromFavorites(widget.id),
              }
            else
              {
                ref
                    .read(favoriteItemsProProvider.notifier)
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
                  color: isFavoriteItem
                      ? Color(0xFFA00000)
                      : Colors.white,
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
