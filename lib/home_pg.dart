import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home_page extends StatelessWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Home",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
