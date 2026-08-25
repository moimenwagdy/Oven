import 'package:chottu_link/chottu_link.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/foundation.dart';

class ChottuLinkService {
  const ChottuLinkService(this._router);
  final GoRouter _router;
  Future<void> init() async {
    await ChottuLink.init(apiKey: 'c_app_fg0NQzHvgQQhknTVNZArbomnAN1GT7bv');
    ChottuLink.onLinkReceivedWithMeta.listen((resolvedLink) {
      debugPrint('[ChottuLink] link: ${resolvedLink.link}');
      debugPrint('[ChottuLink] isDeferred: ${resolvedLink.isDeferred}');
      _handleLink(resolvedLink.link.toString());
    });
  }

  void _handleLink(String link) {
    final uri = Uri.parse(link);
    final id = uri.queryParameters['id'];
    if (id != null) {
      _router.go('/external/$id');
    }
  }
}
