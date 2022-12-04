import 'package:flutter/material.dart';
import 'package:login_ui/models/recipe_card.dart';

import '../api/ApiServices.dart';
import 'RecipeModel.dart';

class SearchRecipes extends SearchDelegate{
  List<Recipes>? _recipesList;
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: (){
        query = '';
      },
                icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      Navigator.pop(context);
    },
        icon: Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    return
      SafeArea(
      child: FutureBuilder(
        future: getRecipeData(query:query),
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
                      c: 0,
                      docId: '',
                      summary: recipe.summary,

                    );
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    return
      SafeArea(

      child: FutureBuilder(
        future: getRecipeData(query:query),
        builder: (context, snapshot) {
          if(query.isEmpty){
            return Center(
                child: Text("Search Recipes",
                  style: TextStyle(
                      color: Colors.deepOrangeAccent,fontSize: 26),));
          }
           if(snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          // if(snapshot.data==null){
          //   return Center(
          //       child: Text("No recipes found",
          //         style: TextStyle(
          //             color: Colors.deepOrangeAccent,fontSize: 26),));
          // }
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
                      c: 0,
                      docId: '',
                      summary: removeAllHtmlTags(recipe.summary),
                      //time: recipe.title!,

                    );
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }

  getRecipeData({required String? query}) async {
    _recipesList = await ApiServices().getData(query);
    print(_recipesList!.length);
  }

  removeAllHtmlTags(String? htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlText?.replaceAll(exp, '');
  }
}