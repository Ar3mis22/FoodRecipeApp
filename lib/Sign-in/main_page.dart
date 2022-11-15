import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/BottomNav/home_pg.dart';
import 'package:login_ui/BottomNav/nav_bar.dart';
import 'package:login_ui/Sign-in/login_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator(color: Colors.deepPurple,),);
          else if (snapshot.hasError)
            {
              return Center(child: Text('Something went wrong!'),);
            }
          else if(snapshot.hasData){
            return Nav_bar();
          }
          else{
            return LoginPage();
          }
        },
      ),
    );
  }
}
