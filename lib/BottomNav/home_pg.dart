
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:http/http.dart';
import 'package:login_ui/api/ApiServices.dart';
import 'package:login_ui/models/SearchRecipes.dart';
//import 'package:login_ui/recipeApi.dart';
import 'package:provider/provider.dart';
import '../models/RecipeModel.dart';
import '../SideBar/contact_us.dart';
import '../SideBar/setting.dart';
import '../api/constants.dart';
import '../Sign-in/google_sign_in.dart';
import '../Sign-in/login_page.dart';
import '../models/recipe_card.dart';


class home_pg extends StatefulWidget {
  const home_pg({Key? key}) : super(key: key);

  @override
  State<home_pg> createState() => _home_pgState();
}

class _home_pgState extends State<home_pg> {


  String?query;
  bool isLoading = true;
  List<Recipes>? _recipesList;

  getRecipeData() async
  {
    _recipesList = await ApiServices().getData(query);
    print(_recipesList!.length);
  }



  @override
  void initState() {
    getRecipeData();
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          title: Text("Home",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(onPressed: (){
              showSearch(context: context, delegate: SearchRecipes());
            },
                icon: Icon(Icons.search_rounded))
          ],
        ),
        body: SafeArea(
          child: FutureBuilder(
            future: getRecipeData(),
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
                      itemCount: _recipesList!.length,
                      itemBuilder: (BuildContext context, int index) {
                        Recipes recipe = _recipesList![index];
                        return RecipeCard(
                          title: recipe.title!,
                          image: recipe.image!,
                          servings: recipe.servings,
                          time: recipe.readyInMinutes,
                          docId: '',
                          c: 0,

                          //time: recipe.title!,

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

// class RecipeWidget extends StatelessWidget {
//   final String title;
//   final String image;
//   final int? servings;
//   final int? time;
//   const RecipeWidget(
//       {Key? key,
//         required this.title,
//         required this.image,
//         required this.servings,
//         required this.time})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return NeuBox(
//       margin: EdgeInsets.all(15),
//       child: Row(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: ClipRRect(
//                 borderRadius: BorderRadius.circular(15),
//                 child: Image.network(
//                   image,
//                   height: 115,
//                   width: 125,
//                   fit: BoxFit.cover,
//                 )),
//           ),
//           Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//
//                   Text(
//                     title,
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700,color: Colors.black),
//                   ),
//                   SizedBox(height: 5,),
//
//                   Row(
//                     children: [
//                       Text("Servings:"),
//                       Text(
//                         servings.toString(),
//                         style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700,color: Colors.black),
//                       ),
//                     ],
//                   ),
//                   Text(
//                     time.toString(),
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700,color: Colors.black),
//                   ),
//
//                 ],
//               ))
//         ],
//       ),
//     );
//   }
// }

  


