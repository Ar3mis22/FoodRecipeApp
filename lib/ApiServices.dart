import 'package:http/http.dart' as http;
import 'dart:convert';

import 'RecipeModel.dart';

class ApiServices {

  String? title;
  String? imgUrl;
  bool? isVeg;
  RecipeModel? recipeModel;
  List<Recipes> _recipesList= [];

  getData(String? query) async {
    var responseBody;
    var url = "https://api.spoonacular.com/recipes/random?apiKey=c08d42a1b0084d15b5e4c9fdb408351c&number=50";
    http.Response response = await http.get(Uri.parse(url));

    try {
      if (response.statusCode == 200) {
        responseBody = jsonDecode(response.body);
        //log(responseBody.toString());
        title = responseBody['recipes'][0]['title'];
        imgUrl = responseBody['recipes'][0]['image'];
        isVeg = responseBody['recipes'][0]['vegetarian'];
        // debugPrint(title);
        // debugPrint(imgUrl);
        // debugPrint(isVeg.toString());
        var recipesMain = RecipeModel.fromJson(responseBody);
        _recipesList = recipesMain.recipes;
        if(query != null)
          {
            _recipesList = _recipesList!.where((element) => element.title!.toLowerCase().contains(query.toLowerCase())).toList();
          }
      } else {
        print(response.statusCode);
      }
      return _recipesList;
    } catch (e) {
      print(e);
    }
  }

}