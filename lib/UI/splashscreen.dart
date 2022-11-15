import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/Sign-in/login_page.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {

    Future.delayed(Duration(seconds: 10),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage()));
    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        body: Center(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: 70)),
              Lottie.network(
                  'https://assets8.lottiefiles.com/temp/lf20_nXwOJj.json'),
              Text('Foodies',
                style: TextStyle(
                  color: Colors.deepOrangeAccent,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Dancingscript',
                  fontSize: 75,
                ),
              )
            ],
          ),

        )
    );
  }
}
