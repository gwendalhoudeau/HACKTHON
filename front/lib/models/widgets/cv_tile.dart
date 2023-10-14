import 'package:flutter/material.dart';
import 'package:front/models/users/c_entreprise.dart';
import 'package:front/models/users/ca_users.dart';
import 'package:front/widgets/cw_button.dart';

class CvTile extends StatelessWidget {
  final CUser user;

  const CvTile({
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    String action = (user is CUser) ? ("quantité d'eau disponible") : ("");

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
            "type : ${user.label}",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            "${user.userName}",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            "$action : ${user.quantity} L",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          (user is CUser)
              ? Text(
                  "localisation : ${user.locate}",
                  style: Theme.of(context).textTheme.bodyLarge,
                )
              : (const SizedBox()),
          const Padding(padding: EdgeInsets.only(bottom: 30)),
          CwButton(
            "Voir l'offre",
            style: Theme.of(context).textTheme.bodyLarge,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
