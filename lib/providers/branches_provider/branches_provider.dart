import 'package:oven/models/address_info.dart';
import 'package:oven/models/branch.dart';
import 'package:oven/models/delivery_location_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'branches_provider.g.dart';

@Riverpod(keepAlive: true)
class Branches extends _$Branches {
  @override
  List<Branch> build() => initialBranches();

  List<Branch> initialBranches() {
    return fakeBranches;
  }

  void updateAddress(
    String branchId,
    DeliveryLocationInfo newDeliveryLocation,
  ) {
    state = [
      for (final branch in state)
        if (branch.id == branchId)
          branch.copyWith(location: newDeliveryLocation)
        else
          branch,
    ];
  }
}

List<Branch> fakeBranches = [
  Branch(
    id: 'BR001',
    trademarkId: 'TM001',
    managerIds: ["MG001", "MG002"],
    name: 'Main Branch',
    location: DeliveryLocationInfo(
      latitude: 30.2151,
      longitude: 31.35651,
      address: AddressInfo(
        city: "Giza",
        area: "New Giza",
        street: "ELharam ST",
        building: "16",
        floor: "21",
        flat: "4",
        details: "",
      ),
    ),
  ),
  Branch(
    id: 'BR002',
    trademarkId: 'TM001',
    managerIds: ["MG003", "MG004", "MG002"],
    name: 'Branch 2',
    location: DeliveryLocationInfo(
      latitude: 30.2151,
      longitude: 31.35651,
      address: AddressInfo(
        city: "Giza",
        area: "New Giza",
        street: "ELharam ST",
        building: "16",
        floor: "21",
        flat: "4",
        details: "",
      ),
    ),
  ),

  Branch(
    id: 'BR003',
    trademarkId: 'TM001',
    name: 'Branch 3',
    managerIds: ["MG005", "MG006"],
    location: DeliveryLocationInfo(
      latitude: 30.2151,
      longitude: 31.35651,
      address: AddressInfo(
        city: "Giza",
        area: "New Giza",
        street: "ELharam ST",
        building: "16",
        floor: "21",
        flat: "4",
        details: "",
      ),
    ),
  ),

  Branch(
    id: 'BR004',
    trademarkId: 'TM002',
    name: 'Golden Oven - Main Branch',
    managerIds: ["MG007", "MG008"],
    location: DeliveryLocationInfo(
      latitude: 30.2151,
      longitude: 31.35651,
      address: AddressInfo(
        city: "Giza",
        area: "New Giza",
        street: "ELharam ST",
        building: "16",
        floor: "21",
        flat: "4",
        details: "",
      ),
    ),
  ),

  Branch(
    id: 'BR005',
    trademarkId: 'TM002',
    name: 'Golden Oven - Branch 2',
    managerIds: ["MG009", "MG010"],
    location: DeliveryLocationInfo(
      latitude: 30.2151,
      longitude: 31.35651,
      address: AddressInfo(
        city: "Giza",
        area: "New Giza",
        street: "ELharam ST",
        building: "16",
        floor: "21",
        flat: "4",
        details: "",
      ),
    ),
  ),

  Branch(
    id: 'BR006',
    trademarkId: 'TM003',
    name: 'Sweet House - Main Branch',
    managerIds: ["MG011", "MG012"],
    location: DeliveryLocationInfo(
      latitude: 30.2151,
      longitude: 31.35651,
      address: AddressInfo(
        city: "Giza",
        area: "New Giza",
        street: "ELharam ST",
        building: "16",
        floor: "21",
        flat: "4",
        details: "",
      ),
    ),
  ),

  Branch(
    id: 'BR007',
    trademarkId: 'TM003',
    name: 'Sweet House - Branch 2',
    managerIds: ["MG013", "MG014"],
    location: DeliveryLocationInfo(
      latitude: 30.2151,
      longitude: 31.35651,
      address: AddressInfo(
        city: "Giza",
        area: "New Giza",
        street: "ELharam ST",
        building: "16",
        floor: "21",
        flat: "4",
        details: "",
      ),
    ),
  ),

  Branch(
    id: 'BR008',
    trademarkId: 'TM003',
    name: 'Sweet House - Branch 3',
    managerIds: ["MG015", "MG016"],
    location: DeliveryLocationInfo(
      latitude: 30.2151,
      longitude: 31.35651,
      address: AddressInfo(
        city: "Giza",
        area: "New Giza",
        street: "ELharam ST",
        building: "16",
        floor: "21",
        flat: "4",
        details: "",
      ),
    ),
  ),
  Branch(
    id: 'BR009',
    trademarkId: 'TM003',
    name: 'Sweet House - Branch 4',
    managerIds: ["MG017", "MG018"],
    location: DeliveryLocationInfo(
      latitude: 30.2151,
      longitude: 31.35651,
      address: AddressInfo(
        city: "Giza",
        area: "New Giza",
        street: "ELharam ST",
        building: "16",
        floor: "21",
        flat: "4",
        details: "",
      ),
    ),
  ),

  Branch(
    id: 'BR010',
    trademarkId: 'TM004',
    name: 'Daily Bread - Main Branch',
    managerIds: ["MG019", "MG020"],
    location: DeliveryLocationInfo(
      latitude: 30.2151,
      longitude: 31.35651,
      address: AddressInfo(
        city: "Giza",
        area: "New Giza",
        street: "ELharam ST",
        building: "16",
        floor: "21",
        flat: "4",
        details: "",
      ),
    ),
  ),
  Branch(
    id: 'BR011',
    trademarkId: 'TM005',
    name: 'Royal Pastry - Main Branch',
    managerIds: ["MG021", "MG022"],
    location: DeliveryLocationInfo(
      latitude: 30.2151,
      longitude: 31.35651,
      address: AddressInfo(
        city: "Giza",
        area: "New Giza",
        street: "ELharam ST",
        building: "16",
        floor: "21",
        flat: "4",
        details: "",
      ),
    ),
  ),
  Branch(
    id: 'BR012',
    trademarkId: 'TM005',
    name: 'Royal Pastry - Branch 2',
    managerIds: ["MG023", "MG024"],
    location: DeliveryLocationInfo(
      latitude: 30.2151,
      longitude: 31.35651,
      address: AddressInfo(
        city: "Giza",
        area: "New Giza",
        street: "ELharam ST",
        building: "16",
        floor: "21",
        flat: "4",
        details: "",
      ),
    ),
  ),

  Branch(
    id: 'BR013',
    trademarkId: 'TM006',
    name: 'Sunrise Bakes - Main Branch',
    managerIds: ["MG025", "MG026"],
    location: DeliveryLocationInfo(
      latitude: 30.2151,
      longitude: 31.35651,
      address: AddressInfo(
        city: "Giza",
        area: "New Giza",
        street: "ELharam ST",
        building: "16",
        floor: "21",
        flat: "4",
        details: "",
      ),
    ),
  ),

  Branch(
    id: 'BR014',
    trademarkId: 'TM006',
    name: 'Sunrise Bakes - Branch 2',
    managerIds: ["MG027", "MG028"],
    location: DeliveryLocationInfo(
      latitude: 30.2151,
      longitude: 31.35651,
      address: AddressInfo(
        city: "Giza",
        area: "New Giza",
        street: "ELharam ST",
        building: "16",
        floor: "21",
        flat: "4",
        details: "",
      ),
    ),
  ),

  Branch(
    id: 'BR015',
    trademarkId: 'TM006',
    name: 'Sunrise Bakes - Branch 3',
    managerIds: ["MG029", "MG030"],
    location: DeliveryLocationInfo(
      latitude: 30.2151,
      longitude: 31.35651,
      address: AddressInfo(
        city: "Giza",
        area: "New Giza",
        street: "ELharam ST",
        building: "16",
        floor: "21",
        flat: "4",
        details: "",
      ),
    ),
  ),

  Branch(
    id: 'BR016',
    trademarkId: 'TM007',
    name: 'City Cakes - Main Branch',
    managerIds: ["MG031", "MG032"],
    location: DeliveryLocationInfo(
      latitude: 30.2151,
      longitude: 31.35651,
      address: AddressInfo(
        city: "Giza",
        area: "New Giza",
        street: "ELharam ST",
        building: "16",
        floor: "21",
        flat: "4",
        details: "",
      ),
    ),
  ),

  Branch(
    id: 'BR017',
    trademarkId: 'TM007',
    name: 'City Cakes - Branch 2',
    managerIds: ["MG033", "MG034"],
    location: DeliveryLocationInfo(
      latitude: 30.2151,
      longitude: 31.35651,
      address: AddressInfo(
        city: "Giza",
        area: "New Giza",
        street: "ELharam ST",
        building: "16",
        floor: "21",
        flat: "4",
        details: "",
      ),
    ),
  ),

  Branch(
    id: 'BR018',
    trademarkId: 'TM008',
    name: 'Delight Sweets - Main Branch',
    managerIds: ["MG035", "MG036"],
    location: DeliveryLocationInfo(
      latitude: 30.2151,
      longitude: 31.35651,
      address: AddressInfo(
        city: "Giza",
        area: "New Giza",
        street: "ELharam ST",
        building: "16",
        floor: "21",
        flat: "4",
        details: "",
      ),
    ),
  ),

  Branch(
    id: 'BR019',
    trademarkId: 'TM008',
    name: 'Delight Sweets - Branch 2',
    managerIds: ["MG037", "MG038"],
    location: DeliveryLocationInfo(
      latitude: 30.2151,
      longitude: 31.35651,
      address: AddressInfo(
        city: "Giza",
        area: "New Giza",
        street: "ELharam ST",
        building: "16",
        floor: "21",
        flat: "4",
        details: "",
      ),
    ),
  ),

  Branch(
    id: 'BR020',
    trademarkId: 'TM008',
    name: 'Delight Sweets - Branch 3',
    managerIds: ["MG039", "MG040"],
    location: DeliveryLocationInfo(
      latitude: 30.2151,
      longitude: 31.35651,
      address: AddressInfo(
        city: "Giza",
        area: "New Giza",
        street: "ELharam ST",
        building: "16",
        floor: "21",
        flat: "4",
        details: "",
      ),
    ),
  ),
  Branch(
    id: 'BR021',
    trademarkId: 'TM009',
    name: 'Prime Bites - Main Branch',
    managerIds: ["MG041", "MG042"],
    location: DeliveryLocationInfo(
      latitude: 30.2151,
      longitude: 31.35651,
      address: AddressInfo(
        city: "Giza",
        area: "New Giza",
        street: "ELharam ST",
        building: "16",
        floor: "21",
        flat: "4",
        details: "",
      ),
    ),
  ),

  Branch(
    id: 'BR022',
    trademarkId: 'TM010',
    name: 'Heaven Bakery - Main Branch',
    managerIds: ["MG043", "MG044", "MG047"],

    location: DeliveryLocationInfo(
      latitude: 30.2151,
      longitude: 31.35651,
      address: AddressInfo(
        city: "Giza",
        area: "New Giza",
        street: "ELharam ST",
        building: "16",
        floor: "21",
        flat: "4",
        details: "",
      ),
    ),
  ),

  Branch(
    id: 'BR023',
    trademarkId: 'TM010',
    name: 'Heaven Bakery - Branch 2',
    managerIds: ["MG045", "MG046", "MG047"],
    location: DeliveryLocationInfo(
      latitude: 30.2151,
      longitude: 31.35651,
      address: AddressInfo(
        city: "Giza",
        area: "New Giza",
        street: "ELharam ST",
        building: "16",
        floor: "21",
        flat: "4",
        details: "",
      ),
    ),
  ),
  Branch(
    id: 'BR024',
    trademarkId: 'TM010',
    name: 'Heaven Bakery - Branch 3',
    managerIds: ["MG047"],
    location: DeliveryLocationInfo(
      latitude: 30.2151,
      longitude: 31.35651,
      address: AddressInfo(
        city: "Giza",
        area: "New Giza",
        street: "ELharam ST",
        building: "16",
        floor: "21",
        flat: "4",
        details: "",
      ),
    ),
  ),
];
