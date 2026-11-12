import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/models/auth_session.dart';
import 'package:oven/models/manager_role.dart';
import 'package:oven/providers/current_session_provider/current_session_provider.dart';
import 'package:oven/providers/current_session_provider/manager_access_provider.dart';
import 'package:oven/utils/constants/colors.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';

class ProfilePageHeader extends ConsumerWidget {
  const ProfilePageHeader({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(currentSessionProvider);
    return Container(
      decoration: BoxDecoration(
        color: primary.withValues(alpha: .2),
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              width: context.isSmallDevice ? 90 : 110,
              height: context.isSmallDevice ? 90 : 110,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSecondaryFixed,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Image.asset(
                  fit: BoxFit.contain,
                  "lib/assets/logo_larg.png",
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 10, 15),
              child: switch (session) {
                null => const SizedBox.shrink(),
                PersonalSession s => _PersonalLines(name: s.name),
                ManagerSession() => const _ManagerLines(),
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _PersonalLines extends StatelessWidget {
  const _PersonalLines({required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name, style: Theme.of(context).textTheme.displaySmall),
        const SizedBox(height: 10),
        Text('Personal account', style: Theme.of(context).textTheme.titleSmall),
      ],
    );
  }
}

class _ManagerLines extends ConsumerWidget {
  const _ManagerLines();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trademarkName = ref.watch(currentTrademarkProvider).value?.name;
    final role = ref.watch(managerRoleProvider).value;
    final branches = ref.watch(accessibleBranchesProvider).value ?? const [];

    final roleLabel = switch (role) {
      TrademarkAdminRole() => 'Trademark admin',
      TrademarkManagerRole() => 'Trademark manager',
      BranchManagerRole() => 'Branch manager',
      NoAccessRole() || null => null,
    };
    final branchesLabel = switch (role) {
      BranchManagerRole() => branches.map((b) => b.name).join(', '),
      TrademarkAdminRole() || TrademarkManagerRole() => 'All branches',
      NoAccessRole() || null => null,
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (trademarkName != null)
          Text(trademarkName, style: Theme.of(context).textTheme.displaySmall),
        const SizedBox(height: 10),
        if (branchesLabel != null)
          Text(
            branchesLabel,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        if (roleLabel != null)
          Text(roleLabel, style: Theme.of(context).textTheme.titleSmall),
      ],
    );
  }
}
