// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class sign_up extends StatefulWidget {
  const sign_up({Key? key}) : super(key: key);

  @override
  State<sign_up> createState() => _sign_upState();
}

class _sign_upState extends State<sign_up> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        title: Text(
          'Register Yourself',
          style: TextStyle(color: Colors.white),
        ),
        shadowColor: Colors.black,
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            padding: EdgeInsets.fromLTRB(0.0, 10.0, 100.0, 0.0),
            child: const Text(
              'Welcome to the',
              style: TextStyle(
                color: Colors.black,
                fontSize: 62.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(right: 180.0),
              child: const Text(
                'Family!',
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 62.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 120.0,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
            child: Container(

              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.deepPurple),
              ),
              child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: ' Email',
                      hintStyle: TextStyle(
                        letterSpacing: 2.0,
                        fontSize: 20,
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.deepPurple,
                      ))),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const TextField(
                  obscureText: true,
                  obscuringCharacter: '*',
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: ' Password',
                      hintStyle: TextStyle(
                        letterSpacing: 2.0,
                        fontSize: 20,
                      ),
                      prefixIcon: Icon(
                        Icons.lock_outline_sharp,
                        color: Colors.deepPurple,
                      ))),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Phone_no.',
                      hintStyle: TextStyle(
                        letterSpacing: 2.0,
                        fontSize: 20,
                      ),
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Colors.deepPurple,
                      ))),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Favourites',
                      hintStyle: TextStyle(
                        letterSpacing: 2.0,
                        fontSize: 20,
                      ),
                      prefixIcon: Icon(
                        Icons.pets_rounded,
                        color: Colors.deepPurple,
                      ))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 20),
            child: Container(
              height: 40,
              width: 500,
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(12.0)),
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
