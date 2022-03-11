import 'package:hive/hive.dart';

// part 'hive_model.g.dart';

@HiveType(typeId: 1)
class HiveModel {
  @HiveField(0)
  final String token;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String surname;
  @HiveField(3)
  final String email;
  @HiveField(4)
  final String password;
  @HiveField(5)
  final int id;
  @HiveField(6)
  final String phone;

  HiveModel({
    required this.name,
    required this.email,
    required this.id,
    required this.password,
    required this.phone,
    required this.surname,
    required this.token,
  });
}
