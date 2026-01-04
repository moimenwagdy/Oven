import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'cart_comment_notifier.g.dart';

@Riverpod(keepAlive: true)
class CartComment extends _$CartComment {
  @override
  String build() => "";

  void setCartComment(String comment) => state = comment;
}
