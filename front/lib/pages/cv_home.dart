import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:front/models/users/c_entreprise.dart';
import 'package:front/models/widgets/cv_tile.dart';
import 'package:front/widgets/cw_button.dart';

class CvHome extends StatefulWidget {
  CvHome({super.key});

  @override
  State<CvHome> createState() => _CvHomeState();
}

class _CvHomeState extends State<CvHome> {
  CUser entreprise = CUser(
    id: "idtest",
    email: 'email_entreprise@example.com',
    password: 'mot_de_passe_entreprise',
    userName: 'limagrin',
    locate: "clermont",
    quantity: 50,
  );

  List<Widget> listEntreprise = [];

  @override
  Widget build(BuildContext context) {
    debugPrint(dotenv.env['API_URL']);

    for (int i = 0; i < 10; i++) {
      listEntreprise.add(CvTile(user: entreprise));
      listEntreprise.add(const Padding(padding: EdgeInsets.only(bottom: 15)));
    }
    debugPrint(listEntreprise.toString());
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: Text(
              "Offres Disponibles",
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 30)),
          Expanded(
            child: ListView(
              children: listEntreprise,
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 30)),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue, // Couleur de fond du pied de page
        child: Container(
          height: 50.0, // Hauteur du pied de page
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.center, // Centre les enfants horizontalement
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: FloatingActionButton(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue,
                    onPressed: () {
                      // Respond to button press
                    },
                    child: Icon(Icons.add),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
