import 'dart:ffi';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login_ui/BottomNav/home_pg.dart';
import 'package:login_ui/google_sign_in.dart';
import 'package:login_ui/main_page.dart';
import 'package:login_ui/sign_up.dart';
import 'package:login_ui/BottomNav/welcome_page.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:login_ui/BottomNav/nav_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passwordObscured = true;
  final formKey = GlobalKey<FormState>();
  String errorMessage = '';
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Future  signIn()  async{
  //   await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: emailController.text.trim(),
  //       password: passwordController.text.trim());
  // }
  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
 // void validate()
 // {
 //   if(formKey.currentState!.validate()){
 //     Navigator.push(context, MaterialPageRoute(builder: (context)=> Nav_bar()));
 //   }
 //   else
 //     {
 //       return null;
 //     }
 // }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(

            children: [
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 250.0,
                    autoPlay: true,
                    enlargeCenterPage: true,
                  ),
                  items: items.map((item) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text(
                                item,
                                style: TextStyle(
                                  fontSize: 56.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'DancingScript',
                                ),
                              ),
                            )));
                      },
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 156.0),
                child: Text(
                  'Sign In to Continue',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),

                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextFormField(
                    validator: MultiValidator(
                      [
                        RequiredValidator(errorText: "Required*"),
                        EmailValidator(errorText: "Enter a valid E-mail")
                      ]
                    ),
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: ' Email',
                        hintStyle: TextStyle(
                          letterSpacing: 2.0,
                          fontSize: 20,
                        ),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.deepPurple,
                        )),
                    // validator: (email) =>//*********************************** VALIDATOR FUNCTION ****************************
                    //     email != null && !EmailValidator.validate(email)
                    //         ? 'Enter a valid Email'
                    //         : null,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextFormField(
                    controller: passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '    Is Required';
                      }
                      else {
                        return null;
                      }
                    },
                    obscureText: passwordObscured,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: ' Password',
                        hintStyle: TextStyle(
                          letterSpacing: 2.0,
                          fontSize: 20,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              passwordObscured = !passwordObscured;
                            });
                          },
                          icon: Icon(
                            passwordObscured
                                ? Icons.visibility_off_sharp
                                : Icons.visibility,
                            color: Colors.deepPurple,
                          ),
                        ),
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.deepPurple,
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  height: 40,
                  width: 800,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: FlatButton(
                    onPressed: ()async{
                      if(formKey.currentState!.validate()) {
                        try {
                                await FirebaseAuth.instance.signInWithEmailAndPassword(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim());
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Nav_bar()));
                                }on FirebaseAuthException catch (error) {
                          errorMessage = error.message!;
                        }
                        setState(() {});
                      }
                    },

                    child: Center(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),

                    ),
                  ),
                ),
              ),
               Center(child: Text(errorMessage,style: TextStyle(color: Colors.red),)),

              Divider(
                color: Colors.deepPurple,
                indent: 15,
                endIndent: 15,
                thickness: 1,
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  width: 600,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurple,
                    ),
                    onPressed: (){
                      final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
                      provider.googleLogin();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> MainPage()));

                    },
                    label: Text('Sign in with google',style: TextStyle(color: Colors.white,fontSize: 22),),
                    icon: FaIcon(FontAwesomeIcons.google,color: Colors.white,),),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not a member ? '),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> sign_up()));
                    },
                    child: Text(
                      'Register now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  )

                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  final List items = [
    "Hello",
    "こんにちは",
    "Hi",
    "नमस्ते",
    "Welcome",
    "你好",
    "안녕하세요",
    "Bonjour",
    "안녕하세요",
    "नमस्कार",
  ];

}
//final form = formKey.currentState!;
//                     if (form.validate()) {
//                       Navigator.push(context, MaterialPageRoute(builder: (context)=> WelcomePge()));
