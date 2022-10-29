import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../Username.dart';

class WelcomePge extends StatefulWidget {
  const WelcomePge({Key? key}) : super(key: key);

  @override
  State<WelcomePge> createState() => _WelcomePgeState();
}

class _WelcomePgeState extends State<WelcomePge> {


  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blueGrey[100],
      body:
      SingleChildScrollView(
        child: Column(
          children: [
            Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                      margin: EdgeInsets.only(bottom: 126),
                      child: buildCoverImage()),
                  Positioned(top: 230,
                      child:
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 4, color: Colors.deepPurple),
                          shape: BoxShape.circle,

                        ),

                        child: CircleAvatar(
                          radius: 144,
                          backgroundImage: user.photoURL == null ? NetworkImage(
                              "https://image.shutterstock.com/image-vector/person-icon-260nw-282598823.jpg",
                              scale: 40) as ImageProvider
                              : NetworkImage(user.photoURL!),

                        ),
                      )
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      child: (Text(
                        user.displayName == null ? 'Steve Rogers' : user
                            .displayName!,
                        style: TextStyle(fontSize: 33,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Dancingscript'),)),
                    ),
                  ),

                ]

            ),

            Container(
              width: double.maxFinite,
              height: 40,
              //child: Padding(padding: EdgeInsets.fromLTRB(10,0,10,0)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[300],
              ),
              child: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Icon(Icons.email, color: Colors.deepPurple,),
                  Text("e-mail: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                  Text(user.email == null ? 'user1@gmail.com' : user.email!,
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Trajan Pro'
                    ),)
                ],
              ),

            ),
            SizedBox(
              height: 20,
            ),

            Container(
              width: double.maxFinite,
              height: 40,
              //child: Padding(padding: EdgeInsets.fromLTRB(10,0,10,0)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[300],
              ),
              child: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Icon(Icons.phone, color: Colors.deepPurple,),
                  Text("Phone: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                  Text("8928463454", style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Trajan Pro'
                  ),)
                ],
              ),

            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.maxFinite,
              height: 40,
              //child: Padding(padding: EdgeInsets.fromLTRB(10,0,10,0)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[300],
              ),
              child: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Icon(Icons.pets_rounded, color: Colors.deepPurple,),
                  Text("Favourites: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                  Text("Dog", style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Trajan Pro'
                  ),)
                ],
              ),

            ),

          ],
        ),
      ),


    );
  }

  Widget buildCoverImage() =>
      Container(
        //color: Colors.grey,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.zero)
        ),
        child: Image.asset(
          'background.jpg',
          fit: BoxFit.cover,
          height: 450,
        ),

        //width: double.infinity,
        //margin: EdgeInsets.only(bottom: 600),
      );

  fetch() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser!;
    if (firebaseUser != null) {
      await FirebaseFirestore.instance.collection('users')
          .doc(firebaseUser.uid)
          .get()
          .then((ds) {
        username = ds.get('username');
        print(username);
      }
      );
    }
  }
  String?username;
}

//   Future getCurrentUserData() async{
//     var firebaseUser = await FirebaseAuth.instance.currentUser!;
//     var userCollection =  await FirebaseFirestore.instance.collection("user") ;
//
//     DocumentSnapshot ds = await userCollection.doc(firebaseUser.uid).get();
//     username = ds.get('username');
//     print(username);
//     return[username];
//
//   }
//   String?username;
// }
