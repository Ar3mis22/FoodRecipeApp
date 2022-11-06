import 'dart:convert';
import 'package:http/http.dart';
import 'package:login_ui/RecipeModel.dart';

class recipeApi{

  static Future<List<RecipeModel>> getRecipe() async{
    String url = 'https://api.spoonacular.com/recipes/random?apiKey=72dd6b8e4762414c997e61949e47d969&number=5';
    Response response = await get(Uri.parse(url));
    Map data = jsonDecode(response.body);
    List _temp = [];

    for(var i in data['recipes']){
      _temp.add(i);
    }
    return RecipeModel.recipesFromSnapshot(_temp);
  }
}