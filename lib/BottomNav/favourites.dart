import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/models/RecipeModel.dart';
import 'package:login_ui/models/wishlistmodel.dart';
import 'package:login_ui/wishlist_provider.dart';
import 'package:provider/provider.dart';

import '../SideBar/contact_us.dart';
import '../SideBar/setting.dart';
import '../Sign-in/google_sign_in.dart';
import '../Sign-in/login_page.dart';
import '../models/recipe_card.dart';

class Favourites extends StatefulWidget {
  const Favourites({Key? key}) : super(key: key);

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  late Wishlist_provider wishlist_provider;
  @override
  Widget build(BuildContext context) {
    wishlist_provider = Provider.of(context);
    wishlist_provider.getWishlistData();
    return Scaffold(
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0,),
                    child: ListTile(
                      leading: Icon(Icons.settings,color: Colors.black,size: 35,),
                      title: Text('Settings',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20),
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Setting()));
                      },
                    ),
                  ),
                  //SizedBox(height: 10.0,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0,),
                    child: ListTile(
                      leading: Image.asset('assets/support.png',color: Colors.black,scale: 15,),
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
                      title: Text('Log_out',
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
       body:
      SafeArea(
        child: FutureBuilder(
          future: wishlist_provider.getWishlistData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Recipes",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: wishlist_provider.getWishlist.length,
                    itemBuilder: (BuildContext context, int index) {
                      WishlistModel data = wishlist_provider.getWishlist[index]  ;
                      return RecipeCard(
                        title: data.wishlisttitle,
                        image: data.wishlistimage,
                        servings: data.wishlistservings,
                        time: data.wishlisttime,
                      );
                    },
                  ),
                )
              ],
            );
          },
        ),
      ),

    );
  }
}
