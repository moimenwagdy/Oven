import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'recent_order_filter_provider.g.dart';

@riverpod
class OrdersFilter extends _$OrdersFilter {
  @override
  String? build() => null;

  void selectedFilter(String? value) {
    state = value;
  }
}
