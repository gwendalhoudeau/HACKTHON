import 'package:flutter/material.dart';
import 'package:front/models/c_post.dart';
import 'package:front/models/users/c_entreprise.dart';
import 'package:front/pages/cv_post.dart';
import 'package:front/widgets/cw_button.dart';

class CvTile extends StatelessWidget {
  final CPost post;
  final CUser user;
  final bool afficheVoirButton;

  const CvTile({
    required this.user,
    required this.post,
    required this.afficheVoirButton,
  });

  @override
  Widget build(BuildContext context) {
    String action = (post is CPost) ? ("quantité d'eau disponible") : ("");

    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = screenWidth * 0.95;
    return Container(
      width: containerWidth,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.symmetric(
          horizontal: 15), // Utilisez margin au lieu de padding
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
            "type : ${post.user.label}",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            "${post.user.userName}",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            "$action : ${post.quantity} L",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          (post is CPost)
              ? Text(
                  "localisation : ${post.locate}",
                  style: Theme.of(context).textTheme.bodyLarge,
                )
              : (const SizedBox()),
          const Padding(padding: EdgeInsets.only(bottom: 30)),
          afficheVoirButton
              ? CwButton(
                  "Voir l'offre",
                  style: Theme.of(context).textTheme.bodyLarge,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CvPost(
                                post: post,
                                user: user,
                              )),
                    );
                  },
                )
              : (SizedBox()),
        ],
      ),
    );
  }
}
