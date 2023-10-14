class CUser {
  String id;
  String get label => "entreprise";
  String userName;

  String email;

  String? password;

  final int? quantity;

  final String? locate;

  CUser({
    required this.id,
    required this.email,
    this.password,
    required this.userName,
    this.locate,
    this.quantity,
  });

  CUser copyWith({
    String? id,
    String? userName,
    String? email,
    String? password,
    String? label,
    String? locate,
    int? quantity,
  }) {
    return CUser(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      userName: userName ?? this.userName,
      quantity: quantity ?? this.quantity,
      locate: locate ?? this.locate,
    );
  }
}
