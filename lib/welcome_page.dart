import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class WelcomePge extends StatefulWidget {
  const WelcomePge({Key? key}) : super(key: key);

  @override
  State<WelcomePge> createState() => _WelcomePgeState();
}

class _WelcomePgeState extends State<WelcomePge> {
  @override
  Widget build(BuildContext context) {
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
                      margin: EdgeInsets.only(bottom: 126), child: buildCoverImage()),
                  Positioned(top: 250,
                      child: buildProfileImage()),
                  Container(
                    child: (Text("César Rincón",style: TextStyle(fontSize: 33,fontWeight: FontWeight.bold,fontFamily: 'Dancingscript'),)),
                  ),
                ]
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
                    Icon(Icons.email,color: Colors.deepPurple,),
                    Text("e-mail: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                    ),
                    Text("cesarrincon42@gmail.com",style: TextStyle(
                      fontSize: 20,
                      fontFamily:'Trajan Pro'
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
                    Icon(Icons.phone,color: Colors.deepPurple,),
                    Text("Phone: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    Text("8928463454",style: TextStyle(
                        fontSize: 20,
                        fontFamily:'Trajan Pro'
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
                    Icon(Icons.pets_rounded,color: Colors.deepPurple,),
                    Text("Favourites: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    Text("Dog",style: TextStyle(
                        fontSize: 20,
                        fontFamily:'Trajan Pro'
                    ),)
                  ],
                ),

              ),

            ],
          ),
        ),


    );
  }

  Widget buildCoverImage() => Container(
        //color: Colors.grey,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft:Radius.zero)
        ),
        child: Image.asset(
          'background.jpg',
          fit: BoxFit.cover,
          height: 450,
        ),

        //width: double.infinity,
        //margin: EdgeInsets.only(bottom: 600),
      );

  buildProfileImage() => Container(
    decoration: BoxDecoration(
      border: Border.all(width: 4,color: Colors.deepPurple),
      shape: BoxShape.circle,

    ),

    child: CircleAvatar(
        radius: 144,
        backgroundImage: NetworkImage(
            'https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1780&q=80')
    ),
  );
}
