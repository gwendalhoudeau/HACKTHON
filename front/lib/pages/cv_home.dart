import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:front/models/c_post.dart';
import 'package:front/models/users/c_user.dart';
import 'package:front/models/widgets/cv_tile.dart';
import 'package:front/pages/cv_createPost.dart';
import 'package:front/utils/c_theme_provider.dart';
import 'package:front/widgets/cw_button.dart';
import 'package:provider/provider.dart';

class CvHome extends StatefulWidget {
  final CUser user;
  CvHome({required this.user, Key? key}) : super(key: key);
  @override
  State<CvHome> createState() => _CvHomeState();
}

List<Widget> postsToWidgets(List<CPost> postList) {
  return postList.map((post) {
    return CvTile(
      user: post.user,
      post: post,
      afficheVoirButton: true,
      vuepost: false,
    );
  }).toList();
}

void sortPostsByQuantityDescending(List<CPost> posts) {
  posts.sort((a, b) => b.quantity.compareTo(a.quantity));
}

class _CvHomeState extends State<CvHome> {
  late CPost randompost;
  late CPost randompost2;
  late CPost randompost3;
  late CPost randompost4;
  late List<Widget> listwidget;
  late List<CPost> listpost;
  CUser entreprise = CUser(
    id: "idtest",
    email: 'email_entreprise@example.com',
    password: 'mot_de_passe_entreprise',
    userName: 'limagrin',
    locate: "clermont",
    quantity: 50,
  );

  @override
  void initState() {
    super.initState();
    debugPrint(widget.user.toString());

    // Initialiser randompost avec widget.user dans initState
    randompost = CPost(
      id: "id1",
      user: widget.user,
      locate: "locate",
      quantity: 10,
    );
    randompost2 = CPost(
      id: "id2",
      user: entreprise,
      locate: "clermont",
      quantity: 30,
    );
    randompost3 = CPost(
      id: "id2",
      user: entreprise,
      locate: "clermont",
      quantity: 40,
    );
    randompost4 = CPost(
      id: "id2",
      user: entreprise,
      locate: "lyon",
      quantity: 20,
    );
    listpost = [randompost, randompost2, randompost3, randompost4];
    listwidget = postsToWidgets(listpost);
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(dotenv.env['API_URL']);

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
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center, // Centre les éléments horizontalement
            children: [
              CwButton("quantite", onPressed: () {
                sortPostsByQuantityDescending(listpost);
                listwidget = postsToWidgets(listpost);
                setState(() {});
              }),
              CwButton("Clermont-Ferrand", onPressed: () {}),
              CwButton("distance", onPressed: () {}),
            ],
          ),
          const Padding(padding: EdgeInsets.only(bottom: 30)),
          Expanded(
            child: ListView(
              children: listwidget,
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 30)),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CvCreatePost(
                                  user: widget.user,
                                )),
                      );
                    },
                    child: Icon(Icons.add),
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
