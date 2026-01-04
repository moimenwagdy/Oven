import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'cart_tooltip_notifier.g.dart';

@riverpod
class CartTooltipNotifier extends _$CartTooltipNotifier {
  @override
  bool build() => false;

  Future<void> checkTooltip() async {
    final prefs = await SharedPreferences.getInstance();
    final seen = prefs.getBool('cart_tooltip_shown') ?? false;
    if (!seen) {
      state = true;
      await Future.delayed(const Duration(seconds: 3));
      state = false;
      await prefs.setBool('cart_tooltip_shown', true);
    }
  }
}
