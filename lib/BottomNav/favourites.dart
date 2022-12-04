import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/models/RecipeModel.dart';
import 'package:login_ui/models/wishlistmodel.dart';
import 'package:login_ui/wishlist_provider.dart';
import 'package:provider/provider.dart';

import '../FavRecipe_Card.dart';
import '../Favs.dart';
import '../SideBar/contact_us.dart';
import '../SideBar/setting.dart';
import '../Sign-in/google_sign_in.dart';
import '../Sign-in/login_page.dart';
import '../api/ApiServices.dart';
import '../models/recipe_card.dart';

class Favourites extends StatefulWidget {
  const Favourites({Key? key}) : super(key: key);

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  // late Wishlist_provider wishlist_provider;
  @override
  Widget build(BuildContext context) {

    // wishlist_provider = Provider.of(context);
    // wishlist_provider.getWishlistData();

    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showMyDialog();
        return shouldPop ?? false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          title: Text("Favourites",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        drawer: Drawer(
          child: Material(
            color: Colors.black12,
            child: ListView(
              children: [
                Container(
                  height: 70,
                  color: Colors.deepOrangeAccent,
                  child: Center(
                      child: Text('Foodies',
                        style: TextStyle(
                          fontSize: 42,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          //fontFamily: 'Dancingscript'
                        ),
                      )
                  ),
                ),
                SizedBox(height: 20,),
                Column(
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 18.0,),
                    //   child: ListTile(
                    //     leading: Icon(Icons.settings,color: Colors.black,size: 35,),
                    //     title: Text('Settings',
                    //       style: TextStyle(
                    //           color: Colors.black,
                    //           fontSize: 20),
                    //     ),
                    //     onTap: (){
                    //      // Navigator.push(context, MaterialPageRoute(builder: (context)=> Setting()));
                    //     },
                    //   ),
                    // ),
                    //SizedBox(height: 10.0,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0,),
                      child: ListTile(
                        leading: Icon(Icons.phone,color: Colors.black,),
                        title: Text('Contact us',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20),
                        ),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Contact_us()));
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0,),
                      child: ListTile(
                        leading: Icon(Icons.logout_rounded,color: Colors.black,size: 35,),
                        title: Text('Log-out',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20),
                        ),
                        onTap: (){
                          final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
                          provider.logout();
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        body: StreamBuilder<List<Favs>>(
            stream: readFavourites(),

            builder: (context, snapshot){
              if (snapshot.hasError) {
                return Center(
                  child: Text("Error occured!"),
                );
              } else if (snapshot.hasData) {
                final favs = snapshot.data!;
                return ListView(
                  children: favs.map(buildFavs).toList(),
                );
              } else if (!snapshot.hasData) {
                return Center(
                  child: Text("You have no favorites as of yet!"),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

            }
        ),

        // SafeArea(
        //   child: FutureBuilder(
        //     future: wishlist_provider.getWishlistData(),
        //     builder: (context, snapshot) {
        //       if (snapshot.connectionState == ConnectionState.waiting) {
        //         return Center(
        //           child: CircularProgressIndicator(),
        //         );
        //       }
        //       return Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         mainAxisSize: MainAxisSize.max,
        //         children: [
        //           Padding(
        //             padding: const EdgeInsets.all(15.0),
        //             child: Text(
        //               "Recipes",
        //               style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
        //             ),
        //           ),
        //           Expanded(
        //             child: ListView.builder(
        //               shrinkWrap: true,
        //               itemCount: wishlist_provider.getWishlist.length,
        //               itemBuilder: (BuildContext context, int index) {
        //                 WishlistModel data = wishlist_provider.getWishlist[index]  ;
        //                 return RecipeCard(
        //                   title: data.wishlisttitle,
        //                   image: data.wishlistimage,
        //                   servings: data.wishlistservings,
        //                   time: data.wishlisttime,
        //                 );
        //               },
        //             ),
        //           )
        //         ],
        //       );
        //     },
        //   ),
        // ),

      ),
    );

  }

  Future<bool?> showMyDialog() => showDialog<bool>(
      context : context,
      builder: (context) => AlertDialog(
        title: Text('Do you want to Log-Out?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context,false), child: Text('Cancel')),
          TextButton(onPressed: () {
            final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
            provider.logout();
            Navigator.pop(context,true);
          }, child: Text('Yes')),
        ],
      )

  );
}
Widget buildFavs(Favs favs) {
  return FavRecipeCard(
    title: favs.title!,
    image: favs.image!,
    time: favs.time!,
    servings: favs.servings!,
    docId: favs.id,
    c: 1,
    summary: favs.summary,

  );
}
var firebaseUser =  FirebaseAuth.instance.currentUser!;
Stream<List<Favs>> readFavourites() => FirebaseFirestore.instance
    .collection('users').doc(firebaseUser.uid)
    .collection('favourites')
    .snapshots().map((snapshot) =>
    snapshot.docs.map((doc) =>Favs.fromJson(doc.data())).toList());