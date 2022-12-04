import 'package:cloud_firestore/cloud_firestore.dart';

class Favs{
   String id;
   String? title;
   int? time;
   int? servings;
  String? image;
  String? summary;

  Favs({
   required this.id ,
    required this.title,
    required this.time,
    required this.servings,
    required this.image,
    required this.summary,
  });



  Map<String,dynamic> toJson()=>{
     'id':id,
    'title':title,
    'servings':servings,
    'time':time,
    'image': image,
    'summary': summary,


  };

  static Favs fromJson(Map<String,dynamic>json)=>Favs(
    title:json["title"],
    time:json["time"],
    servings:json["servings"],
    image: json['image'],
    id: json['id'],
    summary: json['summary']

  );

}