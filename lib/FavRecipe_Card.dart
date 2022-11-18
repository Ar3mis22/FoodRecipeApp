import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Favs.dart';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login_ui/wishlist_provider.dart';
import 'package:provider/provider.dart';

//import 'RecipeModel.dart';
import 'Favs.dart';
import 'RecipeInfo.dart';
import 'api/ApiServices.dart';
import 'models/RecipeModel.dart';

class FavRecipeCard extends StatelessWidget {
  String title;
  int servings;
  String image;
  int time;
  String docId;
  int c;
  String? summary;
  FavRecipeCard({
    required this.title,
    required this.image,
    required this.servings,
    required this.time,
    required this.docId,
    required this.c,
    required this.summary,
  });

  //@override
  // State<FavRecipeCard> createState() => _FavRecipeCardState();
//}

//class _FavRecipeCardState extends State<FavRecipeCard> {

  // List<Recipes>? _recipesList;

  @override
  Widget build(BuildContext context) {

    //bool liked = false;
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => RecipeInfo(
              title: title,
              image: image,
              time: time,
              summary: summary.toString(),
              servings: servings,
            )
        )
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        width: MediaQuery.of(context).size.width,
        height: 280,

        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(
                0.0,
                10.0,
              ),
              blurRadius: 10.0,
              spreadRadius: -6.0,
            ),
          ],
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.35),
              BlendMode.multiply,
            ),
            image: NetworkImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [

            // padding: const EdgeInsets.symmetric(horizontal: 330.0,vertical: 5),
            Positioned(
              top: 10,
              right: 10,
              child: StatefulBuilder(builder: (context,innerstate)
              {
                return InkWell(
                  onTap: (){

                    deleteFavorite();


                    // innerstate(() {
                    //   liked = !liked;
                    // });
                    // if(liked == true)
                    // {
                    //   // wishlist_provider.addWishlistData(
                    //   //   wishlistservings: widget.servings,
                    //   //   wishlisttime:  widget.time,
                    //   //   wishlistimage: widget.image,
                    //   //   wishlisttitle: widget.title,
                    //
                    // },
                    // (context as Element).markNeedsBuild();
                    //  if(liked == true && c==0)
                    //    {
                    //      createFavourite(Favs(
                    //        image: image,
                    //        time: time,
                    //        servings: servings,
                    //        title: title,
                    //        id: docId,
                    //
                    //      ));
                    //    }
                    //  if(liked == false  && c>0)
                    //    {
                    //      deleteFavorite();
                    //    }
                  },

                  child: Icon(
                    Icons.delete_outline_rounded,color: Colors.white,
                    //liked ? Icons.favorite_border_rounded  : Icons.favorite_rounded,
                    //color: Colors.white,
                    size: 30,
                  ),

                );
              }),
            ),

            Align(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
              alignment: Alignment.center,
            ),
            Align(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.people,
                          color: Colors.white,
                          size: 18,
                        ),
                        SizedBox(width: 7),
                        Text(servings.toString(),style: TextStyle(color: Colors.white),),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.schedule,
                          color: Colors.white,
                          size: 18,
                        ),
                        SizedBox(width: 7),
                        Text(time.toString(),style: TextStyle(color: Colors.white),),
                        SizedBox(width: 3),
                        Text('min',style: TextStyle(color: Colors.white),)
                      ],
                    ),

                  )
                ],
              ),
              alignment: Alignment.bottomLeft,
            ),
          ],
        ),
      ),
    );



  }
  Future createFavourite(Favs favs) async{
    final docFavs = FirebaseFirestore.instance.collection('favourites').doc();
    favs.id = docFavs.id;
    docId= favs.id;
    final json = favs.toJson();
    await docFavs.set(json);
    c = c + 1;
  }

  Future<void> deleteFavorite() async {
    var firebaseUser = await FirebaseAuth.instance.currentUser!;
    CollectionReference reference =
    FirebaseFirestore.instance.collection("users").doc(firebaseUser.uid)
    .collection('favourites');
    reference.doc(docId).delete();
    print(docId);
    c = c - 1;
  }
}