
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:http/http.dart';
import 'package:login_ui/recipeApi.dart';
import 'package:provider/provider.dart';
import '../RecipeModel.dart';
import '../SideBar/contact_us.dart';
import '../SideBar/setting.dart';
import '../google_sign_in.dart';
import '../login_page.dart';
import '../recipe_card.dart';


class home_pg extends StatefulWidget {
  const home_pg({Key? key}) : super(key: key);

  @override
  State<home_pg> createState() => _home_pgState();
}

class _home_pgState extends State<home_pg> {


  late List<RecipeModel> _recipes;
  bool isLoading = true;


  @override
  void initState() {
    getRecipes();
    super.initState();
  }
  
  Future <void>getRecipes() async
  {
    _recipes = await recipeApi.getRecipe();
    setState(() {
      isLoading=false;
    });
    print(_recipes);
    // data['recipes'].forEach((element){
    //   RecipeModel recipeModel = new RecipeModel(title: null, readyInMinutes: null, servings: null, image: null);
    //   recipeModel = RecipeModel.fromMap(element['recipes']);
    //   recipeList.add(recipeModel);
    //   log(recipeList.toString());
    // });

    // var responseBody;
    // String apiKey ="72dd6b8e4762414c997e61949e47d969";
    // String baseUrl= "https://api.spoonacular.com/recipes/random";
    // String Url = "$baseUrl/information?apiKey=$apiKey&random?number=5&tags=vegeterian,dessert";
    // http.Response response = await http.get(Uri.parse(Url));
    // try
    //     {
    //       if(response.statusCode == 200)
    //         {
    //           responseBody = jsonDecode(response.body);
    //         }
    //       else
    //         {
    //           print(response.statusCode);
    //         }
    //       return responseBody;
    //     }
    //     catch(e)
    // {
    //   print(e);
    // }
    // recipeList.forEach((Recipe) {
    //   print(Recipe.title);
    // });
   // log(data.toString());
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
        ),
        body: RecipeCard(title: 'My recipe', cookTime: '120 mins', servings: '2', thumbnailUrl: 'https://lh3.googleusercontent.com/ei5eF1LRFkkcekhjdR_8XgOqgdjpomf-rda_vvh7jIauCgLlEWORINSKMRR6I6iTcxxZL9riJwFqKMvK0ixS0xwnRHGMY4I5Zw=s360',),
    );
  }
  }
  


