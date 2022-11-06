
import 'package:login_ui/BottomNav/home_pg.dart';

class RecipeModel
{
  final String title;
  final String readyInMinutes;
  final double servings;
  final String image;

  RecipeModel({ required this.title,required this.readyInMinutes,required this.servings,required this.image});

  factory RecipeModel.fromJson(dynamic json)
  {
    return RecipeModel(
      title: json['title'] as String,
      readyInMinutes: json['readyInMinutes'] as String,
      servings: json['servings'] as double ,
      image:json['image'] as String,
    );
  }
  static List<RecipeModel> recipesFromSnapshot(List snapshot){
    return snapshot.map(
        (data){
          return RecipeModel.fromJson(data);
        }
    ).toList();
  }
}