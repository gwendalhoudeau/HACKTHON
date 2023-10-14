import 'package:front/models/users/c_user.dart';

class CPost {
  final CUser user;
  final String locate;
  final int quantity;
  final int? price;

  const CPost({
    required this.user,
    required this.locate,
    required this.quantity,
    this.price, // Placez cette ligne correctement
  });
}
