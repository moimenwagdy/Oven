import 'package:oven/models/trademark.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'trademark_provider.g.dart';

@riverpod
class Trademarks extends _$Trademarks {
  @override
  List<TradeMark> build() => fakeTradeMarks;
}

List<TradeMark> fakeTradeMarks = [
  TradeMark(
    id: 'TM001',
    name: 'Fresh Bakery',
    mainBranchId: 'BR001',
    trademarkAdminId: 'MG001',
    trademarkManagersIds: ['MG044'],
    createdAt: DateTime(2025, 1, 1),
    boxesStatus: false,
    taxesStatus: false,
    priceLayerId: null,
  ),

  TradeMark(
    id: 'TM002',
    name: 'Golden Oven',
    mainBranchId: 'BR004',
    trademarkAdminId: "MG007",
    createdAt: DateTime(2025, 1, 2),
    boxesStatus: true,
    taxesStatus: true,
    trademarkManagersIds: [],
  ),
  TradeMark(
    id: 'TM003',
    mainBranchId: 'BR006',
    trademarkAdminId: "MG011",
    name: 'Sweet House',
    createdAt: DateTime(2025, 1, 2),
    boxesStatus: false,
    taxesStatus: false,
    trademarkManagersIds: [],
  ),
  TradeMark(
    id: 'TM004',
    name: 'Daily Bread',
    mainBranchId: 'BR010',
    createdAt: DateTime(2025, 1, 2),
    boxesStatus: true,
    taxesStatus: true,
    trademarkAdminId: "MG019",
    trademarkManagersIds: [],
  ),
  TradeMark(
    id: 'TM005',
    name: 'Royal Pastry',
    mainBranchId: 'BR011',
    createdAt: DateTime(2025, 1, 2),
    boxesStatus: false,
    taxesStatus: false,
    trademarkAdminId: "MG021",
    trademarkManagersIds: [],
  ),
  TradeMark(
    id: 'TM006',
    name: 'Sunrise Bakes',
    mainBranchId: 'BR013',
    createdAt: DateTime(2025, 1, 2),
    boxesStatus: true,
    taxesStatus: true,
    trademarkAdminId: "MG025",
    trademarkManagersIds: [],
  ),
  TradeMark(
    id: 'TM007',
    name: 'City Cakes',
    mainBranchId: 'BR016',
    createdAt: DateTime(2025, 1, 2),
    boxesStatus: false,
    taxesStatus: false,
    trademarkAdminId: "MG031",
    trademarkManagersIds: [],
  ),
  TradeMark(
    id: 'TM008',
    name: 'Delight Sweets',
    mainBranchId: 'BR018',
    createdAt: DateTime(2025, 1, 2),
    boxesStatus: true,
    taxesStatus: true,
    trademarkAdminId: "MG035",
    trademarkManagersIds: [],
  ),
  TradeMark(
    id: 'TM009',
    mainBranchId: 'BR021',
    trademarkAdminId: "MG041",
    trademarkManagersIds: [],
    name: 'Prime Bites',
    createdAt: DateTime(2025, 1, 2),
    boxesStatus: false,
    taxesStatus: false,
  ),
  TradeMark(
    id: 'TM010',
    name: 'Heaven Bakery',
    mainBranchId: 'BR022',
    createdAt: DateTime(2025, 1, 2),
    boxesStatus: true,
    taxesStatus: true,
    trademarkAdminId: "MG043",
    trademarkManagersIds: [],
  ),
];
