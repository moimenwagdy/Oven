import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/authentication_provider/auth_provider.dart';
import 'package:oven/utils/constants/colors.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/utils/helpers/user_dispaly_info.dart';

class ProfilePageHeader extends ConsumerWidget {
  const ProfilePageHeader({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final isLoggedin = ref.watch(fakeAuthProvider).value;
    final info = extractUserInfo(isLoggedin);
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
                  // "https://cdn0.iconfinder.com/data/icons/barbershop-icons-set-cartoon-style/512/a1322-512.png",
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 10, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (info != null)
                    Text(
                      info.trademarkId!,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  SizedBox(height: 10),
                  if (info != null)
                    Text(
                      info.branchId!,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  if (info != null)
                    Text(
                      info.loggerState.name,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
