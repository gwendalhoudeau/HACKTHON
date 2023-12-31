import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:front/models/c_post.dart';
import 'package:front/models/users/c_user.dart';
import 'package:front/models/widgets/cv_tile.dart';
import 'package:front/pages/cv_createPost.dart';
import 'package:front/utils/c_distance.dart';
import 'package:front/utils/c_theme_provider.dart';
import 'package:front/widgets/cw_button.dart';
import 'package:provider/provider.dart';

class CvHome extends StatefulWidget {
  final CUser user;
  List<CPost> postlist;
  CvHome({required this.user, required this.postlist, Key? key})
      : super(key: key);
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

List<CPost> sortPostsByQuantityDescending(List<CPost> posts) {
  List<CPost> sortedPosts =
      List.from(posts); // Crée une copie de la liste d'origine
  sortedPosts.sort((a, b) => b.quantity.compareTo(a.quantity)); // Trie la copie
  return sortedPosts; // Renvoie la liste triée
}

List<CPost> filterPostsByLocate(List<CPost> posts, String targetLocate) {
  List<CPost> filteredPosts =
      posts.where((post) => post.locate.contains(targetLocate)).toList();
  return filteredPosts;
}

Future<double> getDistance(String locate) async {
  debugPrint("lkjlkxmlkdsfmlksdmlkfmlkfdskf");

  String address1 = "Clermont-Ferrand";
  String address2 = locate;
  List<double>? coordAdress1 = await CDistance.getCoordinates(address1);
  List<double>? coordAdress2 = await CDistance.getCoordinates(address2);
  late double distance;

  double lat1 = coordAdress1![0];
  double lng1 = coordAdress1![1];
  double lat2 = coordAdress2![0];
  double lng2 = coordAdress2![1];
  distance = CDistance.calculateDistance(lat1, lng1, lat2, lng2);
  return distance;
}

class _CvHomeState extends State<CvHome> {
  late CPost randompost;
  late CPost randompost2;
  late CPost randompost3;
  late CPost randompost4;
  late List<Widget> listwidget;
  late List<CPost> listpost;
  CUser user2 = CUser(
    id: "idtest",
    email: 'email_entreprise@example.com',
    password: 'mot_de_passe_entreprise',
    userName: 'Sapro Starie',
    locate: "clermont",
    quantity: 50,
  );

  Future<void> fonctionintermediaire() async {
    for (int i = 0; i < widget.postlist.length; i++) {
      final distance = await getDistance(widget.postlist[i].locate);
      widget.postlist[i] = widget.postlist[i].copyWith(distance: distance);
    }
  }

  @override
  void initState() {
    super.initState();
    debugPrint(widget.user.toString());

    // Initialiser randompost avec widget.user dans initState
    randompost = CPost(
      id: "id5",
      user: widget.user,
      locate: "Paris",
      distance: 450,
      quantity: 10,
    );
    randompost2 = CPost(
      id: "id6",
      user: user2,
      locate: "Clermont-Ferrand",
      distance: 10,
      quantity: 30,
    );
    randompost3 = CPost(
      id: "id7",
      user: widget.user,
      locate: "Clermont-Ferrand",
      distance: 5,
      quantity: 40,
    );
    randompost4 = CPost(
      id: "id8",
      user: user2,
      locate: "Lyon",
      distance: 300,
      quantity: 20,
    );
    listpost = [randompost, randompost2, randompost3, randompost4];

    debugPrint(widget.postlist[0].distance.toString());
    fonctionintermediaire().then((value) => setState(() {}));
    Future.delayed(Duration(seconds: 2));
    debugPrint(widget.postlist[0].distance.toString());

    debugPrint(listpost.toString());
    setState(() {});
    listwidget = postsToWidgets(listpost);
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(dotenv.env['API_URL']);

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
      body: Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 25.0),
              child: Text(
                "Offres Disponibles",
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(fontFamily: 'Arial'),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 30)),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center, // Centre les éléments horizontalement
            children: [
              Text(
                "Trier par : ",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontFamily: 'Arial'),
              ),
              Container(
                width: 150,
                height: 50,
                margin: EdgeInsets.only(right: 5.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Couleur de la bordure
                    width: 2.0, // Épaisseur de la bordure
                  ),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: CwButton(
                  "Quantité",
                  style: Theme.of(context).textTheme.bodySmall,
                  onPressed: () {
                    listwidget =
                        postsToWidgets(sortPostsByQuantityDescending(listpost));
                    setState(() {});
                  },
                ),
              ),
              Container(
                width: 150,
                height: 50,
                margin: EdgeInsets.only(right: 5.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Couleur de la bordure
                    width: 2.0, // Épaisseur de la bordure
                  ),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: CwButton("Clermont-Fd",
                    style: Theme.of(context).textTheme.bodySmall,
                    onPressed: () {
                  listwidget = postsToWidgets(
                      filterPostsByLocate(listpost, "Clermont-Ferrand"));
                  setState(() {});
                }),
              ),
              Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Couleur de la bordure
                    width: 2.0, // Épaisseur de la bordure
                  ),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: CwButton("Distance",
                    style: Theme.of(context).textTheme.bodySmall,
                    onPressed: () {}),
              ),
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
          margin: EdgeInsets.only(bottom: 10.0, top: 10.0),
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
