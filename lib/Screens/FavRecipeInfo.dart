import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:login_ui/Screens/wishlist_provider.dart';
import 'package:provider/provider.dart';

import 'Favs.dart';


class FavRecipeInfo extends StatefulWidget {
  String summary;
  String title;
  String image;
  int time;
  int servings;
  late final String docId;
  int c;
  bool liked;
  FavRecipeInfo(
      {Key? key,
        required this.title,
        required this.image,
        required this.time,
        required this.summary,
        required this.servings,
        required this.docId,
        required this.c,
        required this.liked})
      : super(key: key);

  @override
  State<FavRecipeInfo> createState() => _FavRecipeInfoState();
}

class _FavRecipeInfoState extends State<FavRecipeInfo> {

  @override
  Widget build(BuildContext context) {
    Wishlist_provider wishlist_provider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipe Information"),
        backgroundColor: Colors.deepOrangeAccent,
        actions: <Widget>[
          IconButton(
            icon: Padding(
              padding: const EdgeInsets.only(right: 22.0),
              child: Icon(
                widget.liked ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                color: Colors.white,
                size: 35,
              ),
            ),
            onPressed: () {
              setState(() {
                widget.liked=!widget.liked;
              }
              );
              //liked=!liked;
              if(widget.liked == true && widget.c==0)
              {
                createFavourite(Favs(
                  image: widget.image,
                  time: widget.time,
                  servings: widget.servings,
                  title: widget.title,
                  id: widget.docId,
                  summary: widget.summary,

                ));
              }
              if(widget.liked == false  && widget.c>0)
              {
                deleteFavorite();
              }
            },
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                widget.title,
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(56),
                  ),
                  child: Image.network(widget.image)),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.deepOrangeAccent[100],
                ),
                //color: Colors.deepOrange[100],
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    removeAllHtmlTags(widget.summary),
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.0,color: Colors.white, fontStyle: FontStyle.italic),
                  ),
                ),
              )
            ],
          )),
    );
  }

  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>",multiLine: true,caseSensitive: true);
    return htmlText.replaceAll(exp, '');
  }
  Future createFavourite(Favs favs) async{
    var firebaseUser = await FirebaseAuth.instance.currentUser!;
    final docFavs = FirebaseFirestore.instance.collection('users').doc(firebaseUser.uid).collection('favourites').doc();
    favs.id = docFavs.id;
    widget.docId= favs.id;
    final json = favs.toJson();
    await docFavs.set(json);
    widget.c = widget.c + 1;
  }

  Future<void> deleteFavorite() async {
    var firebaseUser = await FirebaseAuth.instance.currentUser!;
    CollectionReference reference =
    FirebaseFirestore.instance.collection('users').doc(firebaseUser.uid)
        .collection('favourites');
    reference.doc(widget.docId).delete();
    print(widget.docId);
    widget.c = widget.c - 1;
  }
}
