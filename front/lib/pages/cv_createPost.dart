import 'package:flutter/material.dart';
import 'package:front/models/c_post.dart';
import 'package:front/models/users/c_entreprise.dart';

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
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();

                  // Maintenant, vous pouvez créer un nouvel objet Post avec les données entrées
                  final newPost = CPost(
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
              child: Text('Créer le Post'),
            ),
          ],
        ),
      ),
    );
  }
}
