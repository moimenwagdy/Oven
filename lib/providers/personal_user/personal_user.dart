import 'package:oven/models/address_info.dart';
import 'package:oven/models/alexandria_areas.dart';
import 'package:oven/models/personal_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'personal_user.g.dart';

@Riverpod(keepAlive: true)
class PersonalUsers extends _$PersonalUsers {
  @override
  List<PersonalUser> build() => initialPersonalUSers();

  List<PersonalUser> initialPersonalUSers() {
    return fakePersonalUsers;
  }
}

final fakePersonalUsers = [
  PersonalUser(
    id: 'PU001',
    name: 'John Doe',
    email: 'john@gmail.com',
    password: '123456',
    phone: '1234567890',
    address: AddressInfo(
      city: 'Alexandria',
      street: '123 Main St',
      building: '1A',
      area: alexandriaAreas[3],
      floor: "4",
      flat: "7",
      details: "",
    ),
  ),
];
