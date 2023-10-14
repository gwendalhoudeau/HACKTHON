import 'package:front/models/users/c_entreprise.dart';

class Post {
  final CUser author;
  final String locate;
  final int quantity;
  final int? price;

  const Post({
    required this.author,
    required this.locate,
    required this.quantity,
    this.price, // Placez cette ligne correctement
  });
}
