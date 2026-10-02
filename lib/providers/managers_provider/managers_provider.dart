import 'package:oven/providers/authentication_provider/auth_provider.dart';
import 'package:oven/utils/helpers/user_dispaly_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'managers_provider.g.dart';

@riverpod
class ManagersList extends _$ManagersList {
  @override
  List<Manager> build() {
    final loggedIn = ref.watch(fakeAuthProvider).value;
    final loggedData = extractUserInfo(loggedIn);
    final thisTradeMarkID = loggedData?.trademarkId;
    for (final manager in fakeManagers) {
      print(
        'manager trademark: "${manager.tradeMarkId}" '
        'type: ${manager.tradeMarkId.runtimeType} | '
        'logged trademark: "$thisTradeMarkID" '
        'type: ${thisTradeMarkID.runtimeType} | '
        'equal: ${manager.tradeMarkId == thisTradeMarkID}',
      );
    }
    final managersList = fakeManagers
        .where((manager) => manager.tradeMarkId == thisTradeMarkID)
        .toList();
    return managersList;
  }

  void deleteManager(String id) {
    state = state.where((manager) => manager.id != id).toList();
  }

  void deleteMultiManager(List<String> ids) {
    state = state.where((manager) => !ids.contains(manager.id)).toList();
  }
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
    tradeMarkId: "TM-001",
    name: "Mahmoud Samaka Mahmoud",
    address: "manager St,Cairo",
    phone: "01200000001",
  ),
  Manager(
    id: "MG002",
    tradeMarkId: "TM-001",
    name: "Manar Ali",
    address: "manager St,Cairo",
    phone: "01200000002",
  ),

  Manager(
    id: "MG003",
    tradeMarkId: "TM-001",
    name: "Adam Hassan",
    address: "manager St,Cairo",
    phone: "01200000003",
  ),
  Manager(
    id: "MG004",
    tradeMarkId: "TM-001",
    name: "Omar Khaled",
    address: "manager St,Cairo",
    phone: "01200000004",
  ),

  Manager(
    id: "MG005",
    tradeMarkId: "TM-001",
    name: "Youssef Nabil",
    address: "manager St,Cairo",
    phone: "01200000005",
  ),
  Manager(
    id: "MG006",
    tradeMarkId: "TM-001",
    name: "Karim Samir",
    address: "manager St,Cairo",
    phone: "01200000006",
  ),

  // TM-002
  Manager(
    id: "MG007",
    tradeMarkId: "TM-002",
    name: "Ahmed Tarek",
    address: "manager St,Cairo",
    phone: "01200000007",
  ),
  Manager(
    id: "MG008",
    tradeMarkId: "TM-002",
    name: "Mohamed Adel",
    address: "manager St,Cairo",
    phone: "01200000008",
  ),

  Manager(
    id: "MG009",
    tradeMarkId: "TM-002",
    name: "Mostafa Fathy",
    address: "manager St,Cairo",
    phone: "01200000009",
  ),
  Manager(
    id: "MG010",
    tradeMarkId: "TM-002",
    name: "Ali Mahmoud",
    address: "manager1 St,Cairo",
    phone: "01200000010",
  ),

  // TM-003
  Manager(
    id: "MG011",
    tradeMarkId: "TM-003",
    name: "Ibrahim Hany",
    address: "manager1 St,Cairo",
    phone: "01200000011",
  ),
  Manager(
    id: "MG012",
    tradeMarkId: "TM-003",
    name: "Mahmoud Saeed",
    address: "manager1 St,Cairo",
    phone: "01200000012",
  ),

  Manager(
    id: "MG013",
    tradeMarkId: "TM-003",
    name: "Khaled Gamal",
    address: "manager1 St,Cairo",
    phone: "01200000013",
  ),
  Manager(
    id: "MG014",
    tradeMarkId: "TM-003",
    name: "Tamer Yassin",
    address: "manager1 St,Cairo",
    phone: "01200000014",
  ),

  Manager(
    id: "MG015",
    tradeMarkId: "TM-003",
    name: "Amr Ashraf",
    address: "manager1 St,Cairo",
    phone: "01200000015",
  ),
  Manager(
    id: "MG016",
    tradeMarkId: "TM-003",
    name: "Hossam Nader",
    address: "manager1 St,Cairo",
    phone: "01200000016",
  ),

  Manager(
    id: "MG017",
    tradeMarkId: "TM-003",
    name: "Sherif Adel",
    address: "manager1 St,Cairo",
    phone: "01200000017",
  ),
  Manager(
    id: "MG018",
    tradeMarkId: "TM-003",
    name: "Wael Samy",
    address: "manager1 St,Cairo",
    phone: "01200000018",
  ),

  // TM-004
  Manager(
    id: "MG019",
    tradeMarkId: "TM-004",
    name: "Bassem Fares",
    address: "manager1 St,Cairo",
    phone: "01200000019",
  ),
  Manager(
    id: "MG020",
    tradeMarkId: "TM-004",
    name: "Sameh Reda",
    address: "manager2 St,Cairo",
    phone: "01200000020",
  ),

  // TM-005
  Manager(
    id: "MG021",
    tradeMarkId: "TM-005",
    name: "Nader Farouk",
    address: "manager2 St,Cairo",
    phone: "01200000021",
  ),
  Manager(
    id: "MG022",
    tradeMarkId: "TM-005",
    name: "Emad Lotfy",
    address: "manager2 St,Cairo",
    phone: "01200000022",
  ),

  Manager(
    id: "MG023",
    tradeMarkId: "TM-005",
    name: "Hany Ehab",
    address: "manager2 St,Cairo",
    phone: "01200000023",
  ),
  Manager(
    id: "MG024",
    tradeMarkId: "TM-005",
    name: "Rami Fouad",
    address: "manager2 St,Cairo",
    phone: "01200000024",
  ),

  // TM-006
  Manager(
    id: "MG025",
    tradeMarkId: "TM-006",
    name: "Ziad Ragab",
    address: "manager2 St,Cairo",
    phone: '01200000025',
  ),
  Manager(
    id: "MG026",
    tradeMarkId: "TM-006",
    name: "Walid Kamel",
    address: "manager2 St,Cairo",
    phone: "01200000026",
  ),

  Manager(
    id: "MG027",
    tradeMarkId: "TM-006",
    name: "Fady Naguib",
    address: "manager2 St,Cairo",
    phone: "01200000027",
  ),
  Manager(
    id: "MG028",
    tradeMarkId: "TM-006",
    name: "Sara Mohamed",
    address: "manager2 St,Cairo",
    phone: "01200000028",
  ),

  Manager(
    id: "MG029",
    tradeMarkId: "TM-006",
    name: "Nour Ahmed",
    address: "manager2 St,Cairo",
    phone: "01200000029",
  ),
  Manager(
    id: "MG030",
    tradeMarkId: "TM-006",
    name: "Mariam Hassan",
    address: "manager3 St,Cairo",
    phone: "01200000030",
  ),

  // TM-007
  Manager(
    id: "MG031",
    tradeMarkId: "TM-007",
    name: "Salma Khaled",
    address: "manager3 St,Cairo",
    phone: "01200000031",
  ),
  Manager(
    id: "MG032",
    tradeMarkId: "TM-007",
    name: "Aya Mahmoud",
    address: "manager3 St,Cairo",
    phone: "01200000032",
  ),

  Manager(
    id: "MG033",
    tradeMarkId: "TM-007",
    name: "Huda Tarek",
    address: "manager3 St,Cairo",
    phone: "01200000033",
  ),
  Manager(
    id: "MG034",
    tradeMarkId: "TM-007",
    name: "Rania Adel",
    address: "manager3 St,Cairo",
    phone: "01200000034",
  ),

  // TM-008
  Manager(
    id: "MG035",
    tradeMarkId: "TM-008",
    name: "Heba Mostafa",
    address: "manager3 St,Cairo",
    phone: "01200000035",
  ),
  Manager(
    id: "MG036",
    tradeMarkId: "TM-008",
    name: "Nada Youssef",
    address: "manager3 St,Cairo",
    phone: "01200000036",
  ),

  Manager(
    id: "MG037",
    tradeMarkId: "TM-008",
    name: "Dalia Hany",
    address: "manager3 St,Cairo",
    phone: "01200000037",
  ),
  Manager(
    id: "MG038",
    tradeMarkId: "TM-008",
    name: "Amal Kamel",
    address: "manager3 St,Cairo",
    phone: "01200000038",
  ),

  Manager(
    id: "MG039",
    tradeMarkId: "TM-008",
    name: "Samar Emad",
    address: "manager3 St,Cairo",
    phone: "01200000039",
  ),
  Manager(
    id: "MG040",
    tradeMarkId: "TM-008",
    name: "Iman Samy",
    address: "manager4 St,Cairo",
    phone: "01200000040",
  ),

  // TM-009
  Manager(
    id: "MG041",
    tradeMarkId: "TM-009",
    name: "Noha Wael",
    address: "manager4 St,Cairo",
    phone: "01200000041",
  ),
  Manager(
    id: "MG042",
    tradeMarkId: "TM-009",
    name: "Rasha Sherif",
    address: "manager4 St,Cairo",
    phone: "01200000042",
  ),

  // TM-0010
  Manager(
    id: "MG043",
    tradeMarkId: "TM-0010",
    name: "Donia Fares",
    address: "manager4 St,Cairo",
    phone: "01200000043",
  ),
  Manager(
    id: "MG044",
    tradeMarkId: "TM-0010",
    name: "Huda Tarek",
    address: "manager4 St,Cairo",
    phone: "01200000044",
  ),

  Manager(
    id: "MG045",
    tradeMarkId: "TM-0010",
    name: "Salma Khaled",
    address: "manager4 St,Cairo",
    phone: "01200000045",
  ),
  Manager(
    id: "MG046",
    tradeMarkId: "TM-0010",
    name: "Mona Fathy",
    address: "manager4 St,Cairo",
    phone: "01200000046",
  ),

  Manager(
    id: "MG047",
    tradeMarkId: "TM-0010",
    name: "Yasmin Ashraf",
    address: "manager4 St,Cairo",
    phone: "01200000047",
  ),
  Manager(
    id: "MG048",
    tradeMarkId: "TM-0010",
    name: "Laila Ibrahim",
    address: "manager4 St,Cairo",
    phone: "01200000048",
  ),
];
