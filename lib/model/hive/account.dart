import 'package:hive/hive.dart';

part 'account.g.dart';

@HiveType(typeId: 1)
class Person {
  @HiveField(0)
  late String firstname;

  @HiveField(1)
  late String middlename;

  @HiveField(2)
  late String lastname;

  @HiveField(3)
  late String username;

  @HiveField(4)
  late String password;
}