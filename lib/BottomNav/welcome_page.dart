import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../Sign-in/google_sign_in.dart';
import '../Username.dart';

class WelcomePge extends StatefulWidget {
  const WelcomePge({Key? key}) : super(key: key);

  @override
  State<WelcomePge> createState() => _WelcomePgeState();
}

class _WelcomePgeState extends State<WelcomePge> {


  @override
  Widget build(BuildContext context) {
     double screenWidth = MediaQuery.of(context).size.width;
     double screenheight = MediaQuery.of(context).size.height;
    final user = FirebaseAuth.instance.currentUser!;
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showMyDialog();
        return shouldPop ?? false;
      },
      child: Scaffold(
        //resizeToAvoidBottomInset: false,
        //backgroundColor: Colors.black26,
        body:
        SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                        margin: EdgeInsets.only(bottom: 135),
                        child: buildCoverImage()),
                    Positioned(top: 295,
                        child:
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 4, color: Colors.deepOrangeAccent),
                            shape: BoxShape.circle,

                          ),

                          child: CircleAvatar(
                            radius: 130,
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
                margin: EdgeInsets.symmetric(horizontal: 16),
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
                    Icon(Icons.email, color: Colors.deepOrangeAccent,size: 30,),
                    // Text("e-mail: ",
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.bold,
                    //     fontSize: 26,
                    //   ),
                    // ),
                    SizedBox(width: 6,),
                    Text(user.email == null ? 'user1@gmail.com' : user.email!,
                      style: TextStyle(
                          fontSize: 19,
                          fontFamily: 'Trajan Pro'
                      ),)
                  ],
                ),

              ),
              SizedBox(
                height: 20,
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
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
                    Icon(Icons.phone, color: Colors.deepOrangeAccent,size: 30,),
                    // Text("Phone: ",
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.bold,
                    //     fontSize: 26,
                    //   ),
                    // ),
                    SizedBox(width: 10,),
                    Text("8928463454", style: TextStyle(
                        fontSize: 19,
                        fontFamily: 'Trajan Pro'
                    ),)
                  ],
                ),

              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
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
                    //Icon(Icons.pets_rounded, color: Colors.deepPurple,),
                    Icon(FontAwesomeIcons.bowlFood,color: Colors.deepOrangeAccent,),
                    // Text("Favourites: ",
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.bold,
                    //     fontSize: 26,
                    //   ),
                    // ),
                    SizedBox(width: 13,),
                    Text("Noodles", style: TextStyle(
                        fontSize: 19,
                        fontFamily: 'Trajan Pro'
                    ),)
                  ],
                ),

              ),

            ],
          ),
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
        child: Image.asset('assets/profileback.png',fit: BoxFit.cover,),

          height: 475,
        );

        //width: double.infinity,
        //margin: EdgeInsets.only(bottom: 600),

  fetch() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser;
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

  Future<bool?> showMyDialog() => showDialog<bool>(
      context : context,
      builder: (context) => AlertDialog(
        title: Text('Do you want to Log-Out?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context,false), child: Text('Cancel')),
          TextButton(onPressed: () {
            final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
            provider.logout();
            Navigator.pop(context,true);
          }, child: Text('Yes')),
        ],
      )

  );
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
