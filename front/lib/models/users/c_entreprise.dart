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

  final String locate;

  CEntreprise({
    required this.email,
    required this.password,
    required this.userName,
    required this.locate,
    this.quantity,
  });

  CEntreprise copyWith({
    String? userName,
    String? email,
    String? password,
    String? label,
    String? locate,
    int? quantity,
  }) {
    return CEntreprise(
      email: email ?? this.email,
      password: password ?? this.password,
      userName: userName ?? this.userName,
      quantity: quantity ?? this.quantity,
      locate: locate ?? this.locate,
    );
  }
}
