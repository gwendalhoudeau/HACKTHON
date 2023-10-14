import 'package:front/models/users/ca_users.dart';

class Consumers extends CaUsers {
  @override
  String get label => "utilisateur";
  @override
  String userName;

  @override
  String email;

  @override
  String password;

  Consumers({
    required this.email,
    required this.password,
    required this.userName,
  });
}
