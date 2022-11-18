

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Contact_us extends StatelessWidget {
  const Contact_us({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
           Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/img.jpg",
                ),
                colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.9),
                  BlendMode.modulate,
                ),
                fit: BoxFit.cover,
              ),
            ),
             child: Scaffold(
               backgroundColor: Colors.transparent,
               appBar: AppBar(
                 backgroundColor: Colors.deepOrangeAccent,
                 title: Text(
                   "Contact Us",
                   style: TextStyle(
                     color: Colors.white,
                   ),
                 ),
               ),
               body: Column(
                 children: [
                   Text("What's Cooking? ",style: TextStyle(color: Colors.white,fontSize: 76,fontWeight: FontWeight.bold),),
                   SizedBox(
                     height: 10,
                   ),
                   Padding(
                     padding: const EdgeInsets.only(right: 78.0),
                     child: Text("Feel free to share with us",style: TextStyle(color: Colors.grey[100],fontSize: 26,fontStyle: FontStyle.italic),),
                   ),
                   SizedBox(
                     height: 20,
                   ),
                   Container(
                     height: 400,
                     width: 400,
                     decoration: BoxDecoration(
                     color: Colors.white70,
                       borderRadius: BorderRadius.circular(26),
                     ),
                     child: Row(
                       children: [
                         SizedBox(
                           width: 8,
                         ),
                         Icon(
                           Icons.email_outlined,color: Colors.deepOrangeAccent,size: 110,
                         ),
                         SizedBox(
                           width: 29,
                         ),
                         Icon(
                           Icons.facebook,color: Colors.blue,size: 110,
                         ),
                         SizedBox(
                           width: 29,
                         ),
                         Container(
                           child: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Instagram_logo_2016.svg/2048px-Instagram_logo_2016.svg.png',scale: 21,),
                         )  
                         
                         

                       ],
                     ),

                   )
                 ],
               ),
             ),
          );





  }
}
