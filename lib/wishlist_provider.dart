import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:login_ui/models/RecipeModel.dart';
import 'package:login_ui/models/wishlistmodel.dart';

class Wishlist_provider with ChangeNotifier {
  void addWishlistData({
    required String wishlisttitle,
    required int wishlistservings,
    required String wishlistimage,
    required int wishlisttime,
  }) async {
    FirebaseFirestore.instance
        .collection('favourites')
        .doc()
        .set(
      {
        'title': wishlisttitle,
        'servings': wishlistservings,
        'image': wishlistimage,
        'time': wishlisttime,
        'wishlist': true,
      },
    );
  }
 List<WishlistModel> wishlist = [];
  getWishlistData() async {
    List<WishlistModel> newlist = [];
    QuerySnapshot value = (await FirebaseFirestore.instance
        .collection('favourites')
        .doc()
        .get()) as QuerySnapshot<Object?>;
    value.docs.forEach((element) {
      WishlistModel wishlistModel = WishlistModel(

            wishlisttitle: element.get("wishlisttitle"),
            wishlisttime: element.get("wishlisttime"),
            wishlistservings: element.get("wishlistservings"),
            wishlistimage: element.get("wishlistimage"),

      );
      newlist.add(wishlistModel);
    });
    wishlist = newlist;
    notifyListeners();
  }
   List<WishlistModel> get getWishlist{
    return wishlist;
  }
}
