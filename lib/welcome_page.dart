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
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 48.0),
            child: Text('Welcome ',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 66,
            ),),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 98.0),
            child: Text('Back !',
            style: TextStyle(
              color: Colors.deepPurple,
              fontSize: 66,
              fontWeight: FontWeight.bold,
            ),),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(100,98.0,0,0),
              child: Container(
                child: LoadingAnimationWidget.newtonCradle(color: Colors.black, size: 200),
              ),

          )
        ],

      ),

    );
  }
}
