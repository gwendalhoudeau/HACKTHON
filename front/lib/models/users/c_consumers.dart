import 'package:front/models/users/ca_users.dart';

class Consumers extends CaUsers {
  @override
  String id;
  @override
  String get label => "particulier";
  @override
  String userName;

  @override
  String email;

  @override
  String password;

  @override
  final int? quantity;

  Consumers({
    required this.id,
    required this.email,
    required this.password,
    required this.userName,
    this.quantity,
  });
}
