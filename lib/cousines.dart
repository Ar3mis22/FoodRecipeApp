import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cousines extends StatelessWidget {
  const Cousines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Cousines",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
