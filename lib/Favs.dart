import 'package:cloud_firestore/cloud_firestore.dart';

class Favs{
   String id;
   String? title;
   int? time;
   int? servings;
  String? image;

  Favs({
    required this.id ,
    required this.title,
    required this.time,
    required this.servings,
    required this.image,
  });



  Map<String,dynamic> toJson()=>{
     'id':id,
    'title':title,
    'servings':servings,
    'time':time,
    'image': image,


  };

  static Favs fromJson(Map<String,dynamic>json)=>Favs(
    title:json["title"],
    time:json["time"],
    servings:json["servings"],
    image: json['image'],
    id: json['id'],

  );

}