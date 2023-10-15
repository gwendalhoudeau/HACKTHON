import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:front/models/c_post.dart';
import 'package:front/models/users/c_user.dart';
import 'package:front/pages/cv_home.dart';
import 'package:front/pages/cv_post.dart';
import 'package:front/utils/c_theme_provider.dart';
import 'package:front/widgets/cw_button.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  CUser user = CUser(
    id: "id",
    email: "email",
    password: "password",
    userName: "gwendal",
    locate: "locate",
  );
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
    final String assetname = "assets/logo_waterhub.svg";
    final Widget mySvg = SvgPicture.asset('assets/logo_waterhub.svg');
    debugPrint(assetname);
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
            "assets/logo.png"), // Icône de profil (remplacez 'chemin_vers_votre_image' par le chemin de votre image)
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
      body: Column(
        children: [
          const SizedBox(height: 16.0),
          CwButton(
            "se connecter",
            style: Theme.of(context).textTheme.bodySmall,
            onPressed: () {
              form = "login";
              setState(() {});
            },
            colorBackground: (form == "login")
                ? (Theme.of(context).primaryColor)
                : (Colors.transparent),
          ),
          CwButton(
            "s'inscrire",
            style: Theme.of(context).textTheme.bodySmall,
            onPressed: () {
              form = "register";
              setState(() {});
            },
            colorBackground: (form == "register")
                ? (Theme.of(context).primaryColor)
                : (Colors.transparent),
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
                          decoration: const InputDecoration(
                            labelText: 'Adresse Email',
                          ),
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontFamily: "Arial",
                                  ) // Utilisation du style bodyLarge
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
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontFamily: "Arial",
                                  )),
                      const SizedBox(height: 32.0),
                      CwButton("Se Connecter",
                          style: Theme.of(context).textTheme.bodySmall,
                          onPressed: () async {
                        CPost randompost = CPost(
                          id: "id5",
                          user: user,
                          locate: "Paris",
                          distance: 450,
                          quantity: 10,
                        );
                        CPost randompost2 = CPost(
                          id: "id6",
                          user: user,
                          locate: "Clermont-Ferrand",
                          distance: 10,
                          quantity: 30,
                        );
                        CPost randompost3 = CPost(
                          id: "id7",
                          user: user,
                          locate: "Clermont-Ferrand",
                          distance: 5,
                          quantity: 40,
                        );
                        CPost randompost4 = CPost(
                          id: "id8",
                          user: user,
                          locate: "Lyon",
                          distance: 300,
                          quantity: 20,
                        );
                        List<CPost> listPost = [
                          randompost,
                          randompost2,
                          randompost3,
                          randompost4
                        ];
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CvHome(
                                    user: user,
                                    postlist: listPost,
                                  )),
                        );
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
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontFamily: "Arial",
                                  ) // Utilisation du style bodyLarge
                          ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                          onChanged: (text) {
                            username = text;
                            setState(() {});
                          },
                          decoration: const InputDecoration(
                              labelText: "Nom d'Utilisateur"),
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontFamily: "Arial",
                                  ) // Utilisation du style bodyLarge
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
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontFamily: "Arial",
                                  )),
                      const SizedBox(height: 32.0),
                      CheckboxListTile(
                        title: Text(
                          "Je suis un consommateur",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
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
                        title: Text(
                          "Je suis une entreprise",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        value:
                            !isConsumer, // Vous devez définir isBusiness comme une variable booléenne
                        onChanged: (newValue) {
                          setState(() {
                            isConsumer = !newValue!;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                      CwButton("S'inscrire",
                          style: Theme.of(context).textTheme.bodySmall,
                          onPressed: () async {
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
