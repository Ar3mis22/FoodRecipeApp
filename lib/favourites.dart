import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Favourites extends StatelessWidget {
  const Favourites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text("Favourites",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
    );
  }
}
