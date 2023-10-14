import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:front/models/users/c_user.dart';
import 'package:front/pages/cv_home.dart';
import 'package:front/widgets/cw_button.dart';
import 'package:http/http.dart';

class CvLogin extends StatefulWidget {
  const CvLogin({super.key});

  @override
  State<CvLogin> createState() => _CvLoginState();
}

/*{
  "email": "testpseudo@outlook.fr",
  "password": "sgqrgegherahqgrsq"
}*/

class _CvLoginState extends State<CvLogin> {
  String form = "login";
  bool isConsumer = true;
  String? username;
  String? email;
  String? password;
  String jwt = dotenv.env['JWT']!;
  var headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ${dotenv.env["JWT"]}',
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connexion'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16.0),
          CwButton(
            "se connecter",
            onPressed: () {
              form = "login";
              setState(() {});
            },
            colorBackground:
                (form == "login") ? (Colors.blue) : (Colors.transparent),
          ),
          CwButton(
            "s'inscrire",
            onPressed: () {
              form = "register";
              setState(() {});
            },
            colorBackground:
                (form == "register") ? (Colors.blue) : (Colors.transparent),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: (form == "login")
                  ? [
                      TextFormField(
                          onChanged: (text) {
                            email = text;
                            setState(() {});
                          },
                          decoration:
                              const InputDecoration(labelText: 'Adresse Email'),
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge // Utilisation du style bodyLarge
                          ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                          onChanged: (text) {
                            password = text;
                            setState(() {});
                          },
                          decoration:
                              InputDecoration(labelText: 'Mot de passe'),
                          obscureText: true,
                          style: Theme.of(context).textTheme.bodyLarge),
                      const SizedBox(height: 32.0),
                      CwButton("Se Connecter", onPressed: () async {
                        Map<String, dynamic> requestData = {
                          'email': email,
                          'password': password,
                        };
                        final response = await post(
                            Uri.parse(
                                "${dotenv.env['API_URL']}/api/user/login"),
                            body: jsonEncode(
                                requestData), // Convertit les données en JSON
                            headers: headers);

                        Map<String, dynamic> jsonResponse =
                            json.decode(response.body);

                        if (response.statusCode == 200) {
                          CUser user = CUser(
                              id: jsonResponse['id'],
                              email: jsonResponse['email'],
                              userName: jsonResponse['pseudo']);
                        }
                      })
                    ]
                  : [
                      TextFormField(
                          onChanged: (text) {
                            email = text;
                            setState(() {});
                          },
                          decoration:
                              const InputDecoration(labelText: 'Adresse Email'),
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge // Utilisation du style bodyLarge
                          ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                          onChanged: (text) {
                            username = text;
                            setState(() {});
                          },
                          decoration: const InputDecoration(
                              labelText: "Nom d'Utilisateur"),
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge // Utilisation du style bodyLarge
                          ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                          onChanged: (text) {
                            password = text;
                            setState(() {});
                          },
                          decoration:
                              InputDecoration(labelText: 'Mot de passe'),
                          obscureText: true,
                          style: Theme.of(context).textTheme.bodyLarge),
                      const SizedBox(height: 32.0),
                      CheckboxListTile(
                        title: Text("Je suis un consommateur"),
                        value:
                            isConsumer, // Vous devez définir isConsumer comme une variable booléenne
                        onChanged: (newValue) {
                          setState(() {
                            isConsumer = newValue!;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                      CheckboxListTile(
                        title: Text("Je suis une entreprise"),
                        value:
                            !isConsumer, // Vous devez définir isBusiness comme une variable booléenne
                        onChanged: (newValue) {
                          setState(() {
                            isConsumer = !newValue!;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                      CwButton("S'inscrire", onPressed: () async {
                        Map<String, dynamic> requestData = {
                          'pseudo': username,
                          'email': email,
                          'password': password,
                        };
                        final response = await post(
                            Uri.parse(
                                "${dotenv.env['API_URL']}/api/user/register"),
                            body: jsonEncode(
                                requestData), // Convertit les données en JSON
                            headers: headers);
                      })
                    ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
