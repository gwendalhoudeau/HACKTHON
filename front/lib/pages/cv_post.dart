import 'package:flutter/material.dart';
import 'package:front/models/c_post.dart';
import 'package:front/models/users/c_user.dart';
import 'package:front/models/widgets/cv_tile.dart';
import 'package:front/utils/c_theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CvPost extends StatefulWidget {
  final CPost post;
  final CUser user;

  CvPost({
    Key? key,
    required this.post,
    required this.user,
  }) : super(key: key);

  @override
  State<CvPost> createState() => _CvPostState();
}

class _CvPostState extends State<CvPost> {
  final TextEditingController messageController = TextEditingController();
  List<String> messages = [];

  @override
  void initState() {
    super.initState();
    // Chargez les messages depuis les préférences partagées lors de l'initialisation de la page.
    _loadMessages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails de l\'offre'),
      ),
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.only(bottom: 30)),
          Expanded(
            child: ListView(
              children: [
                CvTile(
                  user: widget.user,
                  post: widget.post,
                  afficheVoirButton: false,
                ),
              ],
            ),
          ),
          Divider(),
          Expanded(
            child: _buildChatBox(),
          ),
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

  Widget _buildChatBox() {
    return Column(
      children: [
        TextField(
          controller: messageController,
          decoration: InputDecoration(labelText: 'Nouveau message'),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context)
                .primaryColor), // Couleur de fond personnalisée
          ),
          onPressed: () {
            String newMessage =
                "${widget.user.userName} : ${messageController.text}";
            if (newMessage.isNotEmpty) {
              setState(() {
                messages.add(newMessage);
                messageController.clear();
                _saveMessages(); // Sauvegardez les messages après ajout.
              });
            }
          },
          child: Text('Envoyer'),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  messages[index],
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Future<void> _loadMessages() async {
    final prefs = await SharedPreferences.getInstance();
    final savedMessages = prefs.getStringList('${widget.post.id}');
    debugPrint(savedMessages.toString());
    if (savedMessages != null) {
      setState(() {
        messages = savedMessages;
      });
    }
  }

  Future<void> _saveMessages() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('${widget.post.id}', messages);
  }

  @override
  void dispose() {
    super.dispose();
    // Sauvegardez les messages lorsque la page est fermée ou que l'utilisateur quitte la page.
    _saveMessages();
  }
}
