import 'package:front/models/users/ca_users.dart';

class CEntreprise extends CaUsers {
  @override
  String get label => "entreprise";
  @override
  String userName;

  @override
  String email;

  @override
  String password;

  @override
  final int? quantity;

  CEntreprise({
    required this.email,
    required this.password,
    required this.userName,
    this.quantity,
  });

  CEntreprise copyWith({
    String? userName,
    String? email,
    String? password,
    String? label,
    int? quantity,
  }) {
    return CEntreprise(
      email: email ?? this.email,
      password: password ?? this.password,
      userName: userName ?? this.userName,
      quantity: quantity ?? this.quantity,
    );
  }
}
