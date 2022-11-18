import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login_ui/BottomNav/home_pg.dart';
import 'package:login_ui/Sign-in/google_sign_in.dart';
import 'package:login_ui/Sign-in/main_page.dart';
import 'package:login_ui/UI/sign_up.dart';
import 'package:login_ui/BottomNav/welcome_page.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:login_ui/BottomNav/nav_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_ui/main.dart';
import 'package:login_ui/phone.dart';
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
  void dispose() {
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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
        return WillPopScope(
          onWillPop: () async {
            final shouldPop = await showMyDialog();
            return shouldPop ?? false;
          },
          child: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/wasabibeans.jpg'),
                  colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.5),
                    BlendMode.modulate,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Scaffold(
                backgroundColor: Colors.transparent,
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
                                            color: Colors.white,
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
                        SizedBox(
                          height: 30,
                        ),
                        Text('Foodies',style: TextStyle(color: Colors.deepOrangeAccent,fontWeight: FontWeight.bold,fontSize: 56,fontStyle: FontStyle.italic),),
                        SizedBox(
                          height: 40,
                        ),
                        // const SizedBox(
                        //   height: 140,
                        // ),
                        const Padding(
                          padding: EdgeInsets.only(right: 156.0),
                          child: Text(
                            'Sign In to Continue',
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
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
                              validator: MultiValidator([
                                RequiredValidator(errorText: "  Required*"),
                                EmailValidator(errorText: "Enter a valid E-mail")
                              ]),
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
                                    color: Colors.deepOrangeAccent,
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
                                  return '   Required*';
                                } else {
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
                                      color: Colors.deepOrangeAccent,
                                    ),
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    color: Colors.deepOrangeAccent,
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
                            height: 50,
                            width: 800,
                            decoration: BoxDecoration(
                              color: Colors.deepOrangeAccent[200],
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: FlatButton(
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  try {
                                    await FirebaseAuth.instance
                                        .signInWithEmailAndPassword(
                                            email: emailController.text.trim(),
                                            password: passwordController.text.trim());
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Nav_bar()));
                                  } on FirebaseAuthException catch (error) {
                                    errorMessage = error.message!;
                                  }
                                }

                                setState(() {});
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
                        Center(
                            child: Text(
                          errorMessage,
                          style: TextStyle(color: Colors.white),
                        )),
                        Divider(
                          color: Colors.deepOrange,
                          indent: 15,
                          endIndent: 15,
                          thickness: 1,
                        ),
                        SizedBox(
                          height: 10,
                        ),

                          //padding: const EdgeInsets.symmetric(horizontal: 25.0),

                                Center(
                                  child: ElevatedButton(

                                   style: ElevatedButton.styleFrom(
                                       primary: Colors.white,
                                       shape: RoundedRectangleBorder(
                                         borderRadius: BorderRadius.circular(35),
                                       )

                                   ),
                                   onPressed: () {
                                     final provider = Provider.of<GoogleSignInProvider>(
                                         context,
                                         listen: false);
                                     provider.googleLogin();
                                     Navigator.push(
                                         context,
                                         MaterialPageRoute(
                                             builder: (context) => Nav_bar()));
                                   },
                                   child: Image.asset('assets/google1.png',scale: 20,),

                            ),
                                ),



                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            //color: Colors.grey.shade400.withOpacity(0.8),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          margin: EdgeInsets.symmetric(horizontal: 35),
                          height: 20,
                          width: 600,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Not a member ? ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => sign_up()));
                                },
                                child: Text(
                                  'Register now',
                                  style: TextStyle(
                                    color: Colors.deepOrangeAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
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
    "hola",
    "nǐn hǎo",
  ];

  Future<bool?> showMyDialog() => showDialog<bool>(
      context : context,
      builder: (context) => AlertDialog(
        title: Text('Do you want to Quit?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context,false), child: Text('Cancel',style: TextStyle(color: Colors.red),)),
          TextButton(onPressed: () {
            final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
            provider.logout();
            Navigator.pop(context,true);
          }, child: Text('Yes')),
        ],
      )

  );

}
//final form = formKey.currentState!;
//                     if (form.validate()) {
//                       Navigator.push(context, MaterialPageRoute(builder: (context)=> WelcomePge()));
