import 'package:oven/providers/current_session_provider/current_session_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'where_to_deliver_provider.g.dart';

/// The delivery address id the user picked, or null for "use the default".
/// Stored as a stable id, never as formatted text. It is validated against
/// the current options in `effectiveDeliveryOptionProvider`.
@Riverpod(keepAlive: true)
class RadioList extends _$RadioList {
  @override
  String? build() {
    // A different user must not inherit the previous user's pick.
    ref.watch(currentUserIdProvider);
    return null;
  }

  void selectAddress(String addressId) => state = addressId;

  void clear() => state = null;
}
