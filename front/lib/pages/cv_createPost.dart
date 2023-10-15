import 'package:flutter/material.dart';
import 'package:front/models/c_post.dart';
import 'package:front/models/users/c_user.dart';
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
        title: Text('Publier une offre'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            const Spacer(),
            TextFormField(
              decoration: InputDecoration(labelText: 'Emplacement'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez entrer un emplacement';
                }
                return null;
              },
              onSaved: (value) {
                _locate = value!;
              },
              style: TextStyle(
                fontFamily: 'Arial', // Utilise la police Arial
                // Autres propriétés de style comme fontSize, fontWeight, etc.
              ),
            ),
            TextFormField(
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
              style: TextStyle(
                fontFamily: 'Arial', // Utilise la police Arial
                // Autres propriétés de style comme fontSize, fontWeight, etc.
              ),
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
