import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'search_provider.g.dart';

@Riverpod(keepAlive: true)
class SearchNotifier extends _$SearchNotifier {
  @override
  String build() => "";

  void setSearchQuery(String query) => state = query;
}
