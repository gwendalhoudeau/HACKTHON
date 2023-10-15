import 'package:flutter/material.dart';
import 'package:front/models/c_post.dart';
import 'package:front/models/users/c_user.dart';
import 'package:front/models/users/ca_users.dart';
import 'package:front/pages/cv_post.dart';
import 'package:front/widgets/cw_button.dart';

class CvTile extends StatelessWidget {
  final CPost post;
  final CUser user;
  final bool afficheVoirButton;
  final bool vuepost;

  const CvTile({
    required this.user,
    required this.post,
    required this.afficheVoirButton,
    required this.vuepost,
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
          color:
              Theme.of(context).secondaryHeaderColor, // Couleur de la bordure
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
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontFamily: "Arial",
                ),
          ),
          Text(
            "${post.user.userName}",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontFamily: "Arial",
                ),
          ),
          Text(
            "distance (km): ${post.distance}",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontFamily: "Arial",
                ),
          ),
          Text(
            "$action : ${post.quantity} L",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontFamily: "Arial",
                ),
          ),
          (post is CPost)
              ? Text(
                  "localisation : ${post.locate}",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontFamily: "Arial",
                      ),
                )
              : (const SizedBox()),
          const Padding(padding: EdgeInsets.only(bottom: 30)),
          (vuepost == false)
              ? ((afficheVoirButton
                  ? CwButton(
                      "Voir l'offre",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontFamily: "Arial",
                          ),
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
                  : (SizedBox())))
              : ((post.user == user)
                  ? (SizedBox())
                  : (CwButton(
                      "Demande de Réservation",
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
                    ))),
        ],
      ),
    );
  }
}
