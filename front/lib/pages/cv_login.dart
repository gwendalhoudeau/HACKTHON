import 'package:flutter/material.dart';
import 'package:front/pages/cv_home.dart';
import 'package:front/widgets/cw_button.dart';

class CvLogin extends StatefulWidget {
  const CvLogin({super.key});

  @override
  State<CvLogin> createState() => _CvLoginState();
}

class _CvLoginState extends State<CvLogin> {
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
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge // Utilisation du style bodyLarge
                ),
            const SizedBox(height: 16.0),
            TextFormField(
                onChanged: (text) {
                  setState(() {});
                },
                decoration: InputDecoration(labelText: 'Mot de passe'),
                obscureText: true,
                style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 32.0),
            CwButton("Se Connecter", onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CvHome()),
              );
            })
          ],
        ),
      ),
    );
  }
}
