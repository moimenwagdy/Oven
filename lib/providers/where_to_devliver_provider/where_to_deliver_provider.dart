import 'package:oven/providers/authentication_provider/auth_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'where_to_deliver_provider.g.dart';

// Which address the user picked as their delivery default.
// Stored as a stable id ('branch' / 'owner'), never as formatted text,
// so an edited address is reflected immediately instead of the
// selection silently going stale.
@Riverpod(keepAlive: true)
class RadioList extends _$RadioList {
  @override
  String? build() => "branch";

  String inititate() {
    final user = ref.watch(fakeAuthProvider).value;
    if (user == null) {
      return "";
    }
    return user.loggerState == LoggerState.business ? "branch" : "personal";
  }

  void selectAddress(String addressId) => state = addressId;

  void clear() => state = null;
}
