import 'package:front/models/users/ca_users.dart';

class Entreprise extends CaUsers {
  @override
  String userName;

  @override
  String email;

  @override
  String password;

  Entreprise({
    required this.email,
    required this.password,
    required this.userName,
  });
}
