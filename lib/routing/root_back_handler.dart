import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/providers/pop_provider/pop_provider.dart';
import 'package:oven/utils/constants/colors.dart';

class RootBackHandler extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  final Widget child;
  final WidgetRef ref;
  const RootBackHandler({
    super.key,
    required this.navigationShell,
    required this.child,
    required this.ref,
  });

  @override
  State<RootBackHandler> createState() => _RootBackHandlerState();
}

class _RootBackHandlerState extends State<RootBackHandler> {
  DateTime? _lastPressedAt;
  final int _exitDurationSeconds = 2;

  void _onPopInvoked(bool didPop, _) {
    if (didPop) return;

    if (widget.navigationShell.currentIndex == 0) {
      final now = DateTime.now();
      if (_lastPressedAt == null ||
          now.difference(_lastPressedAt!) >
              Duration(seconds: _exitDurationSeconds)) {
        _lastPressedAt = now;
        ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(
            content: Center(
              child: Text(
                'Press BACK again to exit',
                style: TextStyle(color: primary),
              ),
            ),
            duration: Duration(seconds: 2),
            backgroundColor: Theme.of(context).colorScheme.surface,
          ),
        );
        setState(() {});
      } else {
        SystemNavigator.pop();
      }
    } else {
      widget.navigationShell.goBranch(0);
      widget.ref.read(navigationIndexProvider.notifier).setNavigationIndex(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: _onPopInvoked,
      child: widget.child,
    );
  }
}
