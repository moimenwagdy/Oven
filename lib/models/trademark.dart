import 'dart:typed_data';

class TradeMark {
  final String id;
  final String name;
  final String mainBranchId;
  final DateTime createdAt;
  final bool boxesStatus;
  final bool taxesStatus;
  final String? priceLayerId;
  final String trademarkAdminId;
  final List<String> trademarkManagersIds;
  final Uint8List? trademarkLogo;

  const TradeMark({
    required this.id,
    required this.name,
    required this.mainBranchId,
    required this.createdAt,
    required this.boxesStatus,
    required this.taxesStatus,
    required this.trademarkAdminId,
    required this.trademarkManagersIds,
    this.priceLayerId,
    this.trademarkLogo,
  });

  TradeMark copyWith({
    String? id,
    String? name,
    String? mainBranchId,
    DateTime? createdAt,
    bool? boxesStatus,
    bool? taxesStatus,
    String? trademarkAdminId,
    List<String>? trademarkManagersIds,
    String? priceLayerId,
    Uint8List? trademarkLogo,
  }) => TradeMark(
    id: id ?? this.id,
    name: name ?? this.name,
    mainBranchId: mainBranchId ?? this.mainBranchId,
    createdAt: createdAt ?? this.createdAt,
    boxesStatus: boxesStatus ?? this.boxesStatus,
    taxesStatus: taxesStatus ?? this.taxesStatus,
    trademarkAdminId: trademarkAdminId ?? this.trademarkAdminId,
    trademarkManagersIds: trademarkManagersIds ?? this.trademarkManagersIds,
    priceLayerId: priceLayerId ?? this.priceLayerId,
    trademarkLogo: trademarkLogo ?? this.trademarkLogo,
  );
}
