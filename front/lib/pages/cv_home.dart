import 'package:flutter/material.dart';
import 'package:front/widgets/cw_button.dart';

class CvHome extends StatefulWidget {
  const CvHome({super.key});

  @override
  State<CvHome> createState() => _CvHomeState();
}

class _CvHomeState extends State<CvHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connexion'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              onChanged: (text) {
                setState(() {});
              },
              decoration: const InputDecoration(labelText: 'Adresse Email'),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              onChanged: (text) {
                setState(() {});
              },
              decoration: InputDecoration(labelText: 'Mot de passe'),
              obscureText: true,
            ),
            const SizedBox(height: 32.0),
            CwButton("Se Connecter", onPressed: () {})
          ],
        ),
      ),
    );
  }
}
