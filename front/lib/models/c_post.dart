import 'package:front/models/users/c_user.dart';

class CPost {
  final String id;
  final CUser user;
  final String locate;
  final int quantity;
  final double distance;
  final int? price;

  const CPost({
    required this.id,
    required this.user,
    required this.locate,
    required this.quantity,
    required this.distance,
    this.price, // Placez cette ligne correctement
  });

  CPost copyWith({
    String? id,
    CUser? user,
    String? locate,
    int? quantity,
    double? distance,
  }) {
    return CPost(
      id: id ?? this.id,
      user: user ?? this.user,
      locate: locate ?? this.locate,
      quantity: quantity ?? this.quantity,
      distance: distance ?? this.distance,
    );
  }
}
