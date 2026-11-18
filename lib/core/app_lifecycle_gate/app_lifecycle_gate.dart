import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/utils/helpers/initial_location_based_on_updated_needed.dart';

class AppLifecycleGate extends StatefulWidget {
  const AppLifecycleGate({
    super.key,
    required this.router,
    required this.child,
  });

  final GoRouter router;
  final Widget child;

  @override
  State<AppLifecycleGate> createState() => _AppLifecycleGateState();
}

class _AppLifecycleGateState extends State<AppLifecycleGate>
    with WidgetsBindingObserver {
  static const _minGap = Duration(minutes: 10);
  DateTime? _lastCheck;
  bool _checking = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // Start the throttle from cold start, which is already checked elsewhere.
    _lastCheck = DateTime.now();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      print('AppLifecycleGate: resumed, checking for update...');
      _checkForUpdate();
    }
  }

  Future<void> _checkForUpdate() async {
    if (_checking) return;
    final last = _lastCheck;
    if (last != null && DateTime.now().difference(last) < _minGap) return;

    _checking = true;
    try {
      final update = await isUpdateAvailable();
      _lastCheck = DateTime.now();

      if (!mounted || update == null) return;

      widget.router.goNamed(
        'update',
        queryParameters: {
          'oldVersion': update.oldVersion,
          'newVersion': update.newVersion.toString(),
        },
      );
    } finally {
      _checking = false;
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
