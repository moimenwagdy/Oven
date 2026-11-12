import 'package:oven/models/auth_session.dart';
import 'package:oven/models/delivery_location_info.dart';
import 'package:oven/models/organization_provider.dart';
import 'package:oven/providers/current_session_provider/current_session_provider.dart';
import 'package:oven/providers/current_session_provider/manager_access_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'branch_action_provider.g.dart';

/// Branch edits. Each method returns null on success, or an error message.
@Riverpod(keepAlive: true)
class BranchActions extends _$BranchActions {
  @override
  void build() {}

  Future<String?> updateLocation({
    required String branchId,
    required DeliveryLocationInfo location,
  }) async {
    final session = ref.read(currentSessionProvider);
    if (session is! ManagerSession) return 'Only managers can edit branches';

    // Read everything needed before the await.
    final repository = ref.read(organizationRepositoryProvider);

    try {
      await repository.updateBranchLocation(
        managerId: session.id,
        branchId: branchId,
        location: location,
      );
      // Branches are fetched data: refetch, so every screen that shows
      // them (modal, cart, profile) gets the new address. This runs after
      // the await, which is safe because the notifier is keepAlive.
      ref.invalidate(accessibleBranchesProvider);
      return null;
    } on OrganizationException catch (e) {
      return e.error.message;
    } catch (e) {
      return e.toString();
    }
  }
}
