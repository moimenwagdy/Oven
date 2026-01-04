import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'cart_item_comment_notifier.g.dart';

@Riverpod(keepAlive: true)
class CartItemButtonsState extends _$CartItemButtonsState {
  @override
  bool build() => false;
  void setCartItemComment() => state = !state;
}
