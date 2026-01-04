import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'scheduled_order_date_provider.g.dart';

@riverpod
class ScheduledOrderDate extends _$ScheduledOrderDate {
  @override
  DateTime? build() => null;

  void updateDate(DateTime? val) => state = val;
}
