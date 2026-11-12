// import 'package:oven/providers/authentication_provider/auth_provider.dart';
import 'package:oven/models/address_info.dart';
import 'package:oven/models/delivery_location_info.dart';
import 'package:oven/models/manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'managers_provider.g.dart';

@riverpod
class ManagersList extends _$ManagersList {
  @override
  List<Manager> build() {
    return fakeManagers;
  }

  void updateName(String managerId, String newName) {
    state = [
      for (final manager in state)
        if (manager.id == managerId)
          manager.copyWith(name: newName)
        else
          manager,
    ];

    print(newName);
  }

  void updateEmail(String managerId, String newEmail) {
    state = [
      for (final manager in state)
        if (manager.id == managerId)
          manager.copyWith(email: newEmail)
        else
          manager,
    ];
  }

  void updatePhoneNumber(String managerId, String newPhoneNumber) {
    state = [
      for (final manager in state)
        if (manager.id == managerId)
          manager.copyWith(phone: newPhoneNumber)
        else
          manager,
    ];
  }

  void updateManagerPersonalAddress(
    String managerId,
    DeliveryLocationInfo newDeliverLocation,
  ) {
    state = [
      for (final manager in state)
        if (manager.id == managerId)
          manager.copyWith(address: newDeliverLocation)
        else
          manager,
    ];
  }
}

final List<Manager> fakeManagers = [
  Manager(
    id: "MG001",
    name: "Mostafa G",
    email: "mostafa@gmail.com",
    password: "123456",
    phone: "01200000001",
    address: DeliveryLocationInfo(
      latitude: 30.122,
      longitude: 31.548,
      address: AddressInfo(
        label: "Home",
        city: "Cairo",
        area: "New Cairo",
        street: "Syria ST",
        building: "41",
        flat: "4",
        floor: "6",
        details: "",
      ),
    ),
  ),
  Manager(
    id: "MG002",
    name: "Omar E",
    email: "omar@gmail.com",
    password: "123456",
    phone: "01200000002",
    address: DeliveryLocationInfo(
      latitude: 30.122,
      longitude: 31.548,
      address: AddressInfo(
        city: "Cairo",
        area: "New Cairo",
        street: "Syria ST",
        building: "41",
        flat: "4",
        floor: "6",
        details: "",
      ),
    ),
  ),

  Manager(
    id: "MG003",
    name: "Adam Hassan",
    email: "test@gmial.com",
    password: "123456",
    phone: "01200000003",
    address: DeliveryLocationInfo(
      latitude: 30.122,
      longitude: 31.548,
      address: AddressInfo(
        city: "Cairo",
        area: "New Cairo",
        street: "Syria ST",
        building: "41",
        flat: "4",
        floor: "6",
        details: "",
      ),
    ),
  ),
  Manager(
    id: "MG004",
    name: "Omar Khaled",
    email: "test@gmial.com",
    password: "123456",
    phone: "01200000004",
    address: DeliveryLocationInfo(
      latitude: 30.122,
      longitude: 31.548,
      address: AddressInfo(
        city: "Cairo",
        area: "New Cairo",
        street: "Syria ST",
        building: "41",
        flat: "4",
        floor: "6",
        details: "",
      ),
    ),
  ),

  Manager(
    id: "MG005",
    name: "Youssef Nabil",
    email: "test@gmial.com",
    password: "123456",
    phone: "01200000005",
    address: DeliveryLocationInfo(
      latitude: 30.122,
      longitude: 31.548,
      address: AddressInfo(
        city: "Cairo",
        area: "New Cairo",
        street: "Syria ST",
        building: "41",
        flat: "4",
        floor: "6",
        details: "",
      ),
    ),
  ),
  Manager(
    id: "MG006",
    name: "Karim Samir",
    email: "test@gmial.com",
    password: "123456",
    phone: "01200000006",
  ),

  // TM002
  Manager(
    id: "MG007",

    name: "Ahmed Tarek",
    email: "test@gmial.com",
    password: "123456",
    phone: "01200000007",
    address: DeliveryLocationInfo(
      latitude: 30.122,
      longitude: 31.548,
      address: AddressInfo(
        city: "Cairo",
        area: "New Cairo",
        street: "Syria ST",
        building: "41",
        flat: "4",
        floor: "6",
        details: "",
      ),
    ),
  ),
  Manager(
    id: "MG008",

    name: "Mohamed Adel",
    email: "test@gmial.com",
    password: "123456",
    phone: "01200000008",
    address: DeliveryLocationInfo(
      latitude: 30.122,
      longitude: 31.548,
      address: AddressInfo(
        city: "Cairo",
        area: "New Cairo",
        street: "Syria ST",
        building: "41",
        flat: "4",
        floor: "6",
        details: "",
      ),
    ),
  ),

  Manager(
    id: "MG009",

    name: "Mostafa Fathy",
    email: "test@gmial.com",
    password: "123456",
    phone: "01200000009",
    address: DeliveryLocationInfo(
      latitude: 30.122,
      longitude: 31.548,
      address: AddressInfo(
        city: "Cairo",
        area: "New Cairo",
        street: "Syria ST",
        building: "41",
        flat: "4",
        floor: "6",
        details: "",
      ),
    ),
  ),
  Manager(
    id: "MG010",

    name: "Ali Mahmoud",
    email: "test@gmial.com",
    password: "123456",
    phone: "01200000010",
    address: DeliveryLocationInfo(
      latitude: 30.122,
      longitude: 31.548,
      address: AddressInfo(
        city: "Cairo",
        area: "New Cairo",
        street: "Syria ST",
        building: "41",
        flat: "4",
        floor: "6",
        details: "",
      ),
    ),
  ),

  // TM003
  Manager(
    id: "MG011",

    name: "Ibrahim Hany",
    email: "test@gmial.com",
    password: "123456",
    phone: "01200000011",
    address: DeliveryLocationInfo(
      latitude: 30.122,
      longitude: 31.548,
      address: AddressInfo(
        city: "Cairo",
        area: "New Cairo",
        street: "Syria ST",
        building: "41",
        flat: "4",
        floor: "6",
        details: "",
      ),
    ),
  ),

  Manager(
    id: "MG012",

    name: "Mahmoud Saeed",
    email: "test@gmial.com",
    password: "123456",
    phone: "01200000012",
    address: DeliveryLocationInfo(
      latitude: 30.122,
      longitude: 31.548,
      address: AddressInfo(
        city: "Cairo",
        area: "New Cairo",
        street: "Syria ST",
        building: "41",
        flat: "4",
        floor: "6",
        details: "",
      ),
    ),
  ),

  Manager(
    id: "MG013",

    name: "Khaled Gamal",
    email: "test@gmial.com",
    password: "123456",
    phone: "01200000013",
    address: DeliveryLocationInfo(
      latitude: 30.122,
      longitude: 31.548,
      address: AddressInfo(
        city: "Cairo",
        area: "New Cairo",
        street: "Syria ST",
        building: "41",
        flat: "4",
        floor: "6",
        details: "",
      ),
    ),
  ),

  Manager(
    id: "MG014",

    name: "Tamer Yassin",
    email: "test@gmial.com",
    password: "123456",
    phone: "01200000014",
    address: DeliveryLocationInfo(
      latitude: 30.122,
      longitude: 31.548,
      address: AddressInfo(
        city: "Cairo",
        area: "New Cairo",
        street: "Syria ST",
        building: "41",
        flat: "4",
        floor: "6",
        details: "",
      ),
    ),
  ),

  Manager(
    id: "MG015",

    name: "Amr Ashraf",
    email: "test@gmial.com",
    password: "123456",
    phone: "01200000015",
    address: DeliveryLocationInfo(
      latitude: 30.122,
      longitude: 31.548,
      address: AddressInfo(
        city: "Cairo",
        area: "New Cairo",
        street: "Syria ST",
        building: "41",
        flat: "4",
        floor: "6",
        details: "",
      ),
    ),
  ),

  Manager(
    id: "MG016",

    name: "Hossam Nader",
    email: "test@gmial.com",
    password: "123456",
    phone: "01200000016",
    address: DeliveryLocationInfo(
      latitude: 30.122,
      longitude: 31.548,
      address: AddressInfo(
        city: "Cairo",
        area: "New Cairo",
        street: "Syria ST",
        building: "41",
        flat: "4",
        floor: "6",
        details: "",
      ),
    ),
  ),

  Manager(
    id: "MG017",

    name: "Sherif Adel",
    email: "test@gmial.com",
    password: "123456",
    phone: "01200000017",
    address: DeliveryLocationInfo(
      latitude: 30.122,
      longitude: 31.548,
      address: AddressInfo(
        city: "Cairo",
        area: "New Cairo",
        street: "Syria ST",
        building: "41",
        flat: "4",
        floor: "6",
        details: "",
      ),
    ),
  ),

  Manager(
    id: "MG018",

    name: "Wael Samy",
    email: "test@gmial.com",
    password: "123456",
    phone: "01200000018",
    address: DeliveryLocationInfo(
      latitude: 30.122,
      longitude: 31.548,
      address: AddressInfo(
        city: "Cairo",
        area: "New Cairo",
        street: "Syria ST",
        building: "41",
        flat: "4",
        floor: "6",
        details: "",
      ),
    ),
  ),

  // TM004
  Manager(
    id: "MG019",

    name: "Bassem Fares",
    email: "test@gmial.com",
    password: "123456",
    phone: "01200000019",
    address: DeliveryLocationInfo(
      latitude: 30.122,
      longitude: 31.548,
      address: AddressInfo(
        city: "Cairo",
        area: "New Cairo",
        street: "Syria ST",
        building: "41",
        flat: "4",
        floor: "6",
        details: "",
      ),
    ),
  ),

  Manager(
    id: "MG020",

    name: "Sameh Reda",
    email: "test@gmial.com",
    password: "123456",
    phone: "01200000020",
    address: DeliveryLocationInfo(
      latitude: 30.122,
      longitude: 31.548,
      address: AddressInfo(
        city: "Cairo",
        area: "New Cairo",
        street: "Syria ST",
        building: "41",
        flat: "4",
        floor: "6",
        details: "",
      ),
    ),
  ),

  // TM005
  Manager(
    id: "MG021",

    name: "Nader Farouk",
    email: "test@gmial.com",
    password: "123456",
    phone: "01200000021",
    address: DeliveryLocationInfo(
      latitude: 30.122,
      longitude: 31.548,
      address: AddressInfo(
        city: "Cairo",
        area: "New Cairo",
        street: "Syria ST",
        building: "41",
        flat: "4",
        floor: "6",
        details: "",
      ),
    ),
  ),

  Manager(
    id: "MG022",

    name: "Emad Lotfy",
    email: "test@gmial.com",
    password: "123456",
    phone: "01200000022",
    address: DeliveryLocationInfo(
      latitude: 30.122,
      longitude: 31.548,
      address: AddressInfo(
        city: "Cairo",
        area: "New Cairo",
        street: "Syria ST",
        building: "41",
        flat: "4",
        floor: "6",
        details: "",
      ),
    ),
  ),

  Manager(
    id: "MG023",

    name: "Hany Ehab",
    email: "test@gmial.com",
    password: "123456",
    phone: "01200000023",
    address: DeliveryLocationInfo(
      latitude: 30.122,
      longitude: 31.548,
      address: AddressInfo(
        city: "Cairo",
        area: "New Cairo",
        street: "Syria ST",
        building: "41",
        flat: "4",
        floor: "6",
        details: "",
      ),
    ),
  ),

  Manager(
    id: "MG024",

    name: "Rami Fouad",
    email: "test@gmial.com",
    password: "123456",
    phone: "01200000024",
    address: DeliveryLocationInfo(
      latitude: 30.122,
      longitude: 31.548,
      address: AddressInfo(
        city: "Cairo",
        area: "New Cairo",
        street: "Syria ST",
        building: "41",
        flat: "4",
        floor: "6",
        details: "",
      ),
    ),
  ),

  // TM006
  Manager(
    id: "MG025",

    name: "Ziad Ragab",
    email: "test@gmial.com",
    password: "123456",
    phone: '01200000025',
    address: DeliveryLocationInfo(
      latitude: 30.122,
      longitude: 31.548,
      address: AddressInfo(
        city: "Cairo",
        area: "New Cairo",
        street: "Syria ST",
        building: "41",
        flat: "4",
        floor: "6",
        details: "",
      ),
    ),
  ),

  Manager(
    id: "MG026",

    name: "Walid Kamel",
    email: "test@gmial.com",
    password: "123456",
    phone: "01200000026",
    address: DeliveryLocationInfo(
      latitude: 30.122,
      longitude: 31.548,
      address: AddressInfo(
        city: "Cairo",
        area: "New Cairo",
        street: "Syria ST",
        building: "41",
        flat: "4",
        floor: "6",
        details: "",
      ),
    ),
  ),

  Manager(
    id: "MG027",

    name: "Fady Naguib",
    email: "test@gmial.com",
    password: "123456",
    phone: "01200000027",
    address: DeliveryLocationInfo(
      latitude: 30.122,
      longitude: 31.548,
      address: AddressInfo(
        city: "Cairo",
        area: "New Cairo",
        street: "Syria ST",
        building: "41",
        flat: "4",
        floor: "6",
        details: "",
      ),
    ),
  ),

  Manager(
    id: "MG028",

    name: "Sara Mohamed",
    email: "test@gmial.com",
    password: "123456",
    phone: "01200000028",
    address: DeliveryLocationInfo(
      latitude: 30.122,
      longitude: 31.548,
      address: AddressInfo(
        city: "Cairo",
        area: "New Cairo",
        street: "Syria ST",
        building: "41",
        flat: "4",
        floor: "6",
        details: "",
      ),
    ),
  ),

  Manager(
    id: "MG029",

    name: "Nour Ahmed",
    email: "test@gmial.com",
    password: "123456",
    phone: "01200000029",
    address: DeliveryLocationInfo(
      latitude: 30.122,
      longitude: 31.548,
      address: AddressInfo(
        city: "Cairo",
        area: "New Cairo",
        street: "Syria ST",
        building: "41",
        flat: "4",
        floor: "6",
        details: "",
      ),
    ),
  ),

  Manager(
    id: "MG030",

    name: "Mariam Hassan",
    email: "mariam@gmail.com",
    password: "123456",
    phone: "0120000030",
    address: DeliveryLocationInfo(
      latitude: 30.122,
      longitude: 31.548,
      address: AddressInfo(
        city: "Cairo",
        area: "New Cairo",
        street: "Syria ST",
        building: "41",
        flat: "4",
        floor: "6",
        details: "",
      ),
    ),
  ),

  // TM007
  Manager(
    id: "MG031",

    name: "Salma Khaled",
    email: "test@gmial.com",
    password: "123456",
    phone: "01200000031",
    address: DeliveryLocationInfo(
      latitude: 30.122,
      longitude: 31.548,
      address: AddressInfo(
        city: "Cairo",
        area: "New Cairo",
        street: "Syria ST",
        building: "41",
        flat: "4",
        floor: "6",
        details: "",
      ),
    ),
  ),

  Manager(
    id: "MG032",

    name: "Aya Mahmoud",
    email: "test@gmial.com",
    password: "123456",
    phone: "01200000032",
    address: DeliveryLocationInfo(
      latitude: 30.122,
      longitude: 31.548,
      address: AddressInfo(
        city: "Cairo",
        area: "New Cairo",
        street: "Syria ST",
        building: "41",
        flat: "4",
        floor: "6",
        details: "",
      ),
    ),
  ),

  Manager(
    id: "MG033",

    name: "Huda Tarek",
    email: "test@gmial.com",
    password: "123456",
    phone: "01200000033",
    address: DeliveryLocationInfo(
      latitude: 30.122,
      longitude: 31.548,
      address: AddressInfo(
        city: "Cairo",
        area: "New Cairo",
        street: "Syria ST",
        building: "41",
        flat: "4",
        floor: "6",
        details: "",
      ),
    ),
  ),

  Manager(
    id: "MG034",

    name: "Rania Adel",
    email: "test@gmial.com",
    password: "123456",
    phone: "01200000034",
    address: DeliveryLocationInfo(
      latitude: 30.122,
      longitude: 31.548,
      address: AddressInfo(
        city: "Cairo",
        area: "New Cairo",
        street: "Syria ST",
        building: "41",
        flat: "4",
        floor: "6",
        details: "",
      ),
    ),
  ),

  // TM008
  Manager(
    id: "MG035",

    name: "Heba Mostafa",
    email: "test@gmial.com",
    password: "123456",
    phone: "01200000035",
    address: DeliveryLocationInfo(
      latitude: 30.122,
      longitude: 31.548,
      address: AddressInfo(
        city: "Cairo",
        area: "New Cairo",
        street: "Syria ST",
        building: "41",
        flat: "4",
        floor: "6",
        details: "",
      ),
    ),
  ),

  Manager(
    id: "MG036",

    name: "Nada Youssef",
    email: "test@gmial.com",
    password: "123456",
    phone: "01200000036",
    address: DeliveryLocationInfo(
      latitude: 30.122,
      longitude: 31.548,
      address: AddressInfo(
        city: "Cairo",
        area: "New Cairo",
        street: "Syria ST",
        building: "41",
        flat: "4",
        floor: "6",
        details: "",
      ),
    ),
  ),

  Manager(
    id: "MG037",

    name: "Dalia Hany",
    email: "test@gmial.com",
    password: "123456",
    phone: "01200000037",
    address: DeliveryLocationInfo(
      latitude: 30.122,
      longitude: 31.548,
      address: AddressInfo(
        city: "Cairo",
        area: "New Cairo",
        street: "Syria ST",
        building: "41",
        flat: "4",
        floor: "6",
        details: "",
      ),
    ),
  ),

  Manager(
    id: "MG038",

    name: "Amal Kamel",
    email: "test@gmial.com",
    password: "123456",
    phone: "01200000038",
    address: DeliveryLocationInfo(
      latitude: 30.122,
      longitude: 31.548,
      address: AddressInfo(
        city: "Cairo",
        area: "New Cairo",
        street: "Syria ST",
        building: "41",
        flat: "4",
        floor: "6",
        details: "",
      ),
    ),
  ),

  Manager(
    id: "MG039",

    name: "Samar Emad",
    email: "test@gmial.com",
    password: "123456",
    phone: "01200000039",
    address: DeliveryLocationInfo(
      latitude: 30.122,
      longitude: 31.548,
      address: AddressInfo(
        city: "Cairo",
        area: "New Cairo",
        street: "Syria ST",
        building: "41",
        flat: "4",
        floor: "6",
        details: "",
      ),
    ),
  ),

  Manager(
    id: "MG040",

    name: "Iman Samy",
    email: "test@gmial.com",
    password: "123456",
    phone: "01200000040",
    address: DeliveryLocationInfo(
      latitude: 30.122,
      longitude: 31.548,
      address: AddressInfo(
        city: "Cairo",
        area: "New Cairo",
        street: "Syria ST",
        building: "41",
        flat: "4",
        floor: "6",
        details: "",
      ),
    ),
  ),

  // TM009
  Manager(
    id: "MG041",

    name: "Noha Wael",
    email: "test@gmial.com",
    password: "123456",
    phone: "01200000041",
    address: DeliveryLocationInfo(
      latitude: 30.122,
      longitude: 31.548,
      address: AddressInfo(
        city: "Cairo",
        area: "New Cairo",
        street: "Syria ST",
        building: "41",
        flat: "4",
        floor: "6",
        details: "",
      ),
    ),
  ),

  Manager(
    id: "MG042",

    name: "Rasha Sherif",
    email: "test@gmial.com",
    password: "123456",
    phone: "01200000042",
    address: DeliveryLocationInfo(
      latitude: 30.122,
      longitude: 31.548,
      address: AddressInfo(
        city: "Cairo",
        area: "New Cairo",
        street: "Syria ST",
        building: "41",
        flat: "4",
        floor: "6",
        details: "",
      ),
    ),
  ),

  // TM0010
  Manager(
    id: "MG043",

    name: "Donia Fares",
    email: "test@gmial.com",
    password: "123456",
    phone: "01200000043",
    address: DeliveryLocationInfo(
      latitude: 30.122,
      longitude: 31.548,
      address: AddressInfo(
        city: "Cairo",
        area: "New Cairo",
        street: "Syria ST",
        building: "41",
        flat: "4",
        floor: "6",
        details: "",
      ),
    ),
  ),

  Manager(
    id: "MG044",
    name: "Huda Tarek",
    email: "huda@gmail.com",
    password: "123456",
    phone: "01200000044",
    address: DeliveryLocationInfo(
      latitude: 30.122,
      longitude: 31.548,
      address: AddressInfo(
        city: "Cairo",
        area: "New Cairo",
        street: "Syria ST",
        building: "41",
        flat: "4",
        floor: "6",
        details: "",
      ),
    ),
  ),

  Manager(
    id: "MG045",

    name: "Salma Khaled",
    email: "test@gmial.com",
    password: "123456",
    phone: "01200000045",
    address: DeliveryLocationInfo(
      latitude: 30.122,
      longitude: 31.548,
      address: AddressInfo(
        city: "Cairo",
        area: "New Cairo",
        street: "Syria ST",
        building: "41",
        flat: "4",
        floor: "6",
        details: "",
      ),
    ),
  ),

  Manager(
    id: "MG046",

    name: "Mona Fathy",
    email: "test@gmial.com",
    password: "123456",
    phone: "01200000046",
    address: DeliveryLocationInfo(
      latitude: 30.122,
      longitude: 31.548,
      address: AddressInfo(
        city: "Cairo",
        area: "New Cairo",
        street: "Syria ST",
        building: "41",
        flat: "4",
        floor: "6",
        details: "",
      ),
    ),
  ),

  Manager(
    id: "MG047",
    name: "Yasmin Ashraf",
    email: "yasmin@gmail.com",
    password: "123456",
    phone: "01200000047",
    address: DeliveryLocationInfo(
      latitude: 30.122,
      longitude: 31.548,
      address: AddressInfo(
        city: "Cairo",
        area: "New Cairo",
        street: "Syria ST",
        building: "41",
        flat: "4",
        floor: "6",
        details: "",
      ),
    ),
  ),

  Manager(
    id: "MG048",

    name: "Laila Ibrahim",
    email: "test@gmial.com",
    password: "123456",
    phone: "01200000048",
    address: DeliveryLocationInfo(
      latitude: 30.122,
      longitude: 31.548,
      address: AddressInfo(
        city: "Cairo",
        area: "New Cairo",
        street: "Syria ST",
        building: "41",
        flat: "4",
        floor: "6",
        details: "",
      ),
    ),
  ),
];
