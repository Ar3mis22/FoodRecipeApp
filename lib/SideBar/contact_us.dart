import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Contact_us extends StatelessWidget {
  const Contact_us({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Contact Us",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),

    );
  }
}
