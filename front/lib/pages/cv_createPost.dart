import 'package:flutter/material.dart';
import 'package:front/models/c_post.dart';
import 'package:front/models/users/c_user.dart';
import 'package:front/pages/cv_home.dart';
import 'package:front/utils/c_theme_provider.dart';
import 'package:provider/provider.dart';

class CvCreatePost extends StatefulWidget {
  final CUser user;

  CvCreatePost({required this.user});
  @override
  _CvCreatePostState createState() => _CvCreatePostState();
}

class _CvCreatePostState extends State<CvCreatePost> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  CUser? _selectedAuthor;
  String _locate = '';
  int _quantity = 0;
  int? _price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WaterHub'), // Titre de l'AppBar
        actions: [
          IconButton(
            icon: Icon(Icons
                .person), // Remplacez 'profile' par l'icône que vous souhaitez utiliser
            onPressed: () {
              // Action à exécuter lorsque l'icône de profil est cliquée
            },
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            TextFormField(
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontFamily: "Arial",
                  ),
              decoration: InputDecoration(labelText: 'Localisation'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez entrer un emplacement';
                }
                return null;
              },
              onSaved: (value) {
                _locate = value!;
              },
            ),
            TextFormField(
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontFamily: "Arial",
                  ),
              decoration: InputDecoration(labelText: 'Quantité'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez entrer une quantité';
                }
                return null;
              },
              onSaved: (value) {
                _quantity = int.parse(value!);
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();

                  // Maintenant, vous pouvez créer un nouvel objet Post avec les données entrées
                  final newPost = CPost(
                    id: "id",
                    user: widget.user,
                    locate: _locate,
                    quantity: _quantity,
                    distance: 0,
                    price: _price,
                  );

                  // Vous pouvez faire quelque chose avec le nouvel objet Post ici, comme l'envoyer à un serveur, le stocker localement, etc.

                  // Réinitialisez le formulaire après la soumission
                  _formKey.currentState!.reset();
                  Navigator.pop(context);
                }
              },
              child: Text(
                'Créer le Post',
                style: TextStyle(
                  fontFamily: 'Arial', // Utilise la police Arial
                  // Autres propriétés de style comme fontSize, fontWeight, etc.
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Theme.of(context)
                        .primaryColor), // Couleur de fond personnalisée
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color:
            Theme.of(context).primaryColor, // Couleur de fond du pied de page
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
                    foregroundColor: Theme.of(context).primaryColor,
                    onPressed: () {
                      Provider.of<ThemeProvider>(context, listen: false)
                          .daltonism();
                    },
                    child: Icon(Icons.remove_red_eye),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: FloatingActionButton(
                    backgroundColor: Colors.white,
                    foregroundColor: Theme.of(context).primaryColor,
                    onPressed: () {
                      Provider.of<ThemeProvider>(context, listen: false)
                          .toggleTheme();
                    },
                    child: Icon(Icons.brightness_3),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
