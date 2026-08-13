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

// import 'dart:async';
// import 'package:app_links/app_links.dart';
// import 'package:go_router/go_router.dart';

// class AppLinksHandler {
//   final GoRouter router;
//   AppLinksHandler(this.router);
//   final AppLinks _appLinks = AppLinks();
//   StreamSubscription<Uri>? _subscription;

//   void init() {
//     // When app is already running
//     _subscription = _appLinks.uriLinkStream.listen((uri) {
//       handleUri(uri);
//     });

//     // When app was closed and opened by a link
//     _handleInitialLink();
//   }

//   Future<void> _handleInitialLink() async {
//     final uri = await _appLinks.getInitialLink();

//     print("Initial URI: $uri");

//     if (uri != null) {
//       handleUri(uri);
//     }
//   }

//   void handleUri(Uri uri) {
//     final segments = uri.pathSegments; // e.g. ['external', 'abc123']

//     if (segments.length == 2 && segments[0] == 'external') {
//       final trademarkId = segments[1];
//       router.go('/external/$trademarkId');
//       return;
//     }

//     // fallback for any other/unrecognized link shape
//     final path = uri.path.isEmpty ? '/home' : uri.path;
//     router.go(path);
//   }

//   void dispose() {
//     _subscription?.cancel();
//   }
// }
