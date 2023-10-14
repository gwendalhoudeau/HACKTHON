import 'package:flutter/material.dart';
import 'package:front/models/users/c_entreprise.dart';
import 'package:front/models/widgets/cv_tile.dart';

class CvHome extends StatefulWidget {
  const CvHome({super.key});

  @override
  State<CvHome> createState() => _CvHomeState();
}

class _CvHomeState extends State<CvHome> {
  CEntreprise entreprise = CEntreprise(
    email: 'email_entreprise@example.com',
    password: 'mot_de_passe_entreprise',
    userName: 'Nom de l\'entreprise',
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              // Ajoutez ici vos widgets de la liste
              Text('Widget 1'),
              Text('Widget 2'),
              CvTile(
                user: entreprise,
              ),
              // ...
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue, // Couleur de fond du pied de page
        child: Container(
          height: 50.0, // Hauteur du pied de page
          alignment: Alignment.center,
          child: const Text(
            'Pied de page',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
