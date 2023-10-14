import 'package:flutter/material.dart';
import 'package:front/models/users/ca_users.dart';

class CvTile extends StatelessWidget {
  final CaUsers user;

  const CvTile({
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = screenWidth * 0.95;
    return Container(
      width: containerWidth,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black, // Couleur de la bordure
          width: 1.0, // Largeur de la bordure
        ),
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Aligner le contenu à gauche
        children: [
          Text(
            "${user.label} : ${user.userName}",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            "${user.label} : ${user.userName}",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
