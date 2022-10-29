// ignore_for_file: deprecated_member_use

// import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/login_page.dart';

class sign_up extends StatefulWidget {
  const sign_up({Key? key}) : super(key: key);

  @override
  State<sign_up> createState() => _sign_upState();
}

class _sign_upState extends State<sign_up> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final phoneController = TextEditingController();
  final favouritesController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    phoneController.dispose();
    favouritesController.dispose();
    super.dispose();
  }

  Future signUp() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),

    );
    addUserDetails(usernameController.text.trim(),
        emailController.text.trim(),
        int.parse(phoneController.text.trim()),
        favouritesController.text.trim());
  }

  Future addUserDetails(String username, String Email, int phone_no,
      String favourites) async {
    var firebaseUser = await FirebaseAuth.instance.currentUser!;
    await FirebaseFirestore.instance.collection('users')
        .doc(firebaseUser.uid)
        .set({
      'username': username,
      'Email': Email,
      'phone_no': phone_no,
      'favourites': favourites,
      'uid': firebaseUser.uid,
    });
  }


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
                  controller: usernameController,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: ' Username',
                      hintStyle: TextStyle(
                        letterSpacing: 2.0,
                        fontSize: 20,
                      ),
                      prefixIcon: Icon(
                        Icons.person_rounded,
                        color: Colors.deepPurple,
                      ))),
            ),
          ),
          // SizedBox(
          //   height: 120.0,
          // ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 13.0, 20.0, 0.0),
            child: Container(

              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.deepPurple),
              ),
              child: TextFormField(
                  controller: emailController,
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
              child: TextFormField(
                  controller: passwordController,
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
                  controller: phoneController,
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
                  controller: favouritesController,
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
                onPressed: () {
                  signUp();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
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

  // Future getCurrentUserData() async{
  //   var firebaseUser = await FirebaseAuth.instance.currentUser!;
  //   var userCollection =  await FirebaseFirestore.instance.collection("user") ;
  //
  //     DocumentSnapshot ds = await userCollection.doc(firebaseUser.uid).get();
  //     username = ds.get('username');
  //     print(username);
  //
  // }
  // String?username;
  fetch() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser!;
    if (firebaseUser != null) {
      await FirebaseFirestore.instance.collection('users')
          .doc(firebaseUser.uid)
          .get()
          .then((ds) {
        username = ds.get('username');
       }
      );
    }
  }
  String?username;
}
