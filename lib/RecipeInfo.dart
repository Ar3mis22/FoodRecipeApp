import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:login_ui/wishlist_provider.dart';
import 'package:provider/provider.dart';


class RecipeInfo extends StatefulWidget {
  String summary;
  String title;
  String image;
  int time;
  int servings;
  RecipeInfo(
      {Key? key,
        required this.title,
        required this.image,
        required this.time,
        required this.summary,
        required this.servings})
      : super(key: key);

  @override
  State<RecipeInfo> createState() => _RecipeInfoState();
}

class _RecipeInfoState extends State<RecipeInfo> {
  bool liked = false;
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
                liked ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                color: Colors.white,
                size: 35,
              ),
            ),
            onPressed: () {
              setState(() {
                liked=!liked;
              }
              );
              //liked=!liked;
              if(liked == true)
              {
                wishlist_provider.addWishlistData(
                  wishlistservings: widget.servings,
                  wishlisttime:  widget.time,
                  wishlistimage: widget.image,
                  wishlisttitle: widget.title,
                  wishlistsummary: widget.summary,
                );

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
}
