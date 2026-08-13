import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'managers_provider.g.dart';

@riverpod
class ManagersList extends _$ManagersList {
  @override
  List<Manager> build() => List.from(fakeManagers);
}

class Manager {
  final String id;
  final String tradeMarkId;
  final String name;
  final String address;
  final String phone;

  Manager({
    required this.id,
    required this.tradeMarkId,
    required this.name,
    required this.address,
    required this.phone,
  });
}

final List<Manager> fakeManagers = [
  Manager(
    id: "MG001",
    tradeMarkId: "TM001",
    name: "Mahmoud Samaka Mahmoud",
    address: "manager St,Cairo",
    phone: "01200000001",
  ),
  Manager(
    id: "MG002",
    tradeMarkId: "TM001",
    name: "Manar Ali",
    address: "manager St,Cairo",
    phone: "01200000002",
  ),

  Manager(
    id: "MG003",
    tradeMarkId: "TM001",
    name: "Adam Hassan",
    address: "manager St,Cairo",
    phone: "01200000003",
  ),
  Manager(
    id: "MG004",
    tradeMarkId: "TM001",
    name: "Omar Khaled",
    address: "manager St,Cairo",
    phone: "01200000004",
  ),

  Manager(
    id: "MG005",
    tradeMarkId: "TM001",
    name: "Youssef Nabil",
    address: "manager St,Cairo",
    phone: "01200000005",
  ),
  Manager(
    id: "MG006",
    tradeMarkId: "TM001",
    name: "Karim Samir",
    address: "manager St,Cairo",
    phone: "01200000006",
  ),

  // TM002
  Manager(
    id: "MG007",
    tradeMarkId: "TM002",
    name: "Ahmed Tarek",
    address: "manager St,Cairo",
    phone: "01200000007",
  ),
  Manager(
    id: "MG008",
    tradeMarkId: "TM002",
    name: "Mohamed Adel",
    address: "manager St,Cairo",
    phone: "01200000008",
  ),

  Manager(
    id: "MG009",
    tradeMarkId: "TM002",
    name: "Mostafa Fathy",
    address: "manager St,Cairo",
    phone: "01200000009",
  ),
  Manager(
    id: "MG010",
    tradeMarkId: "TM002",
    name: "Ali Mahmoud",
    address: "manager1 St,Cairo",
    phone: "01200000010",
  ),

  // TM003
  Manager(
    id: "MG011",
    tradeMarkId: "TM003",
    name: "Ibrahim Hany",
    address: "manager1 St,Cairo",
    phone: "01200000011",
  ),
  Manager(
    id: "MG012",
    tradeMarkId: "TM003",
    name: "Mahmoud Saeed",
    address: "manager1 St,Cairo",
    phone: "01200000012",
  ),

  Manager(
    id: "MG013",
    tradeMarkId: "TM003",
    name: "Khaled Gamal",
    address: "manager1 St,Cairo",
    phone: "01200000013",
  ),
  Manager(
    id: "MG014",
    tradeMarkId: "TM003",
    name: "Tamer Yassin",
    address: "manager1 St,Cairo",
    phone: "01200000014",
  ),

  Manager(
    id: "MG015",
    tradeMarkId: "TM003",
    name: "Amr Ashraf",
    address: "manager1 St,Cairo",
    phone: "01200000015",
  ),
  Manager(
    id: "MG016",
    tradeMarkId: "TM003",
    name: "Hossam Nader",
    address: "manager1 St,Cairo",
    phone: "01200000016",
  ),

  Manager(
    id: "MG017",
    tradeMarkId: "TM003",
    name: "Sherif Adel",
    address: "manager1 St,Cairo",
    phone: "01200000017",
  ),
  Manager(
    id: "MG018",
    tradeMarkId: "TM003",
    name: "Wael Samy",
    address: "manager1 St,Cairo",
    phone: "01200000018",
  ),

  // TM004
  Manager(
    id: "MG019",
    tradeMarkId: "TM004",
    name: "Bassem Fares",
    address: "manager1 St,Cairo",
    phone: "01200000019",
  ),
  Manager(
    id: "MG020",
    tradeMarkId: "TM004",
    name: "Sameh Reda",
    address: "manager2 St,Cairo",
    phone: "01200000020",
  ),

  // TM005
  Manager(
    id: "MG021",
    tradeMarkId: "TM005",
    name: "Nader Farouk",
    address: "manager2 St,Cairo",
    phone: "01200000021",
  ),
  Manager(
    id: "MG022",
    tradeMarkId: "TM005",
    name: "Emad Lotfy",
    address: "manager2 St,Cairo",
    phone: "01200000022",
  ),

  Manager(
    id: "MG023",
    tradeMarkId: "TM005",
    name: "Hany Ehab",
    address: "manager2 St,Cairo",
    phone: "01200000023",
  ),
  Manager(
    id: "MG024",
    tradeMarkId: "TM005",
    name: "Rami Fouad",
    address: "manager2 St,Cairo",
    phone: "01200000024",
  ),

  // TM006
  Manager(
    id: "MG025",
    tradeMarkId: "TM006",
    name: "Ziad Ragab",
    address: "manager2 St,Cairo",
    phone: '01200000025',
  ),
  Manager(
    id: "MG026",
    tradeMarkId: "TM006",
    name: "Walid Kamel",
    address: "manager2 St,Cairo",
    phone: "01200000026",
  ),

  Manager(
    id: "MG027",
    tradeMarkId: "TM006",
    name: "Fady Naguib",
    address: "manager2 St,Cairo",
    phone: "01200000027",
  ),
  Manager(
    id: "MG028",
    tradeMarkId: "TM006",
    name: "Sara Mohamed",
    address: "manager2 St,Cairo",
    phone: "01200000028",
  ),

  Manager(
    id: "MG029",
    tradeMarkId: "TM006",
    name: "Nour Ahmed",
    address: "manager2 St,Cairo",
    phone: "01200000029",
  ),
  Manager(
    id: "MG030",
    tradeMarkId: "TM006",
    name: "Mariam Hassan",
    address: "manager3 St,Cairo",
    phone: "01200000030",
  ),

  // TM007
  Manager(
    id: "MG031",
    tradeMarkId: "TM007",
    name: "Salma Khaled",
    address: "manager3 St,Cairo",
    phone: "01200000031",
  ),
  Manager(
    id: "MG032",
    tradeMarkId: "TM007",
    name: "Aya Mahmoud",
    address: "manager3 St,Cairo",
    phone: "01200000032",
  ),

  Manager(
    id: "MG033",
    tradeMarkId: "TM007",
    name: "Huda Tarek",
    address: "manager3 St,Cairo",
    phone: "01200000033",
  ),
  Manager(
    id: "MG034",
    tradeMarkId: "TM007",
    name: "Rania Adel",
    address: "manager3 St,Cairo",
    phone: "01200000034",
  ),

  // TM008
  Manager(
    id: "MG035",
    tradeMarkId: "TM008",
    name: "Heba Mostafa",
    address: "manager3 St,Cairo",
    phone: "01200000035",
  ),
  Manager(
    id: "MG036",
    tradeMarkId: "TM008",
    name: "Nada Youssef",
    address: "manager3 St,Cairo",
    phone: "01200000036",
  ),

  Manager(
    id: "MG037",
    tradeMarkId: "TM008",
    name: "Dalia Hany",
    address: "manager3 St,Cairo",
    phone: "01200000037",
  ),
  Manager(
    id: "MG038",
    tradeMarkId: "TM008",
    name: "Amal Kamel",
    address: "manager3 St,Cairo",
    phone: "01200000038",
  ),

  Manager(
    id: "MG039",
    tradeMarkId: "TM008",
    name: "Samar Emad",
    address: "manager3 St,Cairo",
    phone: "01200000039",
  ),
  Manager(
    id: "MG040",
    tradeMarkId: "TM008",
    name: "Iman Samy",
    address: "manager4 St,Cairo",
    phone: "01200000040",
  ),

  // TM009
  Manager(
    id: "MG041",
    tradeMarkId: "TM009",
    name: "Noha Wael",
    address: "manager4 St,Cairo",
    phone: "01200000041",
  ),
  Manager(
    id: "MG042",
    tradeMarkId: "TM009",
    name: "Rasha Sherif",
    address: "manager4 St,Cairo",
    phone: "01200000042",
  ),

  // TM0010
  Manager(
    id: "MG043",
    tradeMarkId: "TM0010",
    name: "Donia Fares",
    address: "manager4 St,Cairo",
    phone: "01200000043",
  ),
  Manager(
    id: "MG044",
    tradeMarkId: "TM0010",
    name: "Huda Tarek",
    address: "manager4 St,Cairo",
    phone: "01200000044",
  ),

  Manager(
    id: "MG045",
    tradeMarkId: "TM0010",
    name: "Salma Khaled",
    address: "manager4 St,Cairo",
    phone: "01200000045",
  ),
  Manager(
    id: "MG046",
    tradeMarkId: "TM0010",
    name: "Mona Fathy",
    address: "manager4 St,Cairo",
    phone: "01200000046",
  ),

  Manager(
    id: "MG047",
    tradeMarkId: "TM0010",
    name: "Yasmin Ashraf",
    address: "manager4 St,Cairo",
    phone: "01200000047",
  ),
  Manager(
    id: "MG048",
    tradeMarkId: "TM0010",
    name: "Laila Ibrahim",
    address: "manager4 St,Cairo",
    phone: "01200000048",
  ),
];
