import 'package:oven/models/branch.dart';
import 'package:oven/models/manager.dart';
import 'package:oven/models/personal_user.dart';
import 'package:oven/models/trademark.dart';
import 'package:oven/providers/branches_provider/branches_provider.dart';
import 'package:oven/providers/managers_provider/managers_provider.dart';
import 'package:oven/providers/personal_user/personal_user.dart';
import 'package:oven/providers/trademark_proivder/trademark_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fake_database.g.dart';

/// In-memory stand-in for the backend. Only repositories should touch it.
/// The lists start as copies of the seed data, so the seeds stay untouched.
/// To edit a record, replace it in the list (never mutate the object).
class FakeDatabase {
  final List<Manager> managers = [...fakeManagers];
  final List<PersonalUser> personalUsers = [...fakePersonalUsers];
  final List<Branch> branches = [...fakeBranches];
  final List<TradeMark> trademarks = [...fakeTradeMarks];
}

@Riverpod(keepAlive: true)
FakeDatabase fakeDatabase(Ref ref) => FakeDatabase();
