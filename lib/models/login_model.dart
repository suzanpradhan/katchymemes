import 'package:hive/hive.dart';
part 'login_model.g.dart';

@HiveType(typeId: 0)
class Login {
  @HiveField(0)
  final String? apikey;
  @HiveField(1)
  final String? username;
  Login(
    this.apikey,
    this.username,
  );
}
