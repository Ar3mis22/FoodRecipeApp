import 'package:flutter/material.dart';
import 'package:login_ui/Sign-in/google_sign_in.dart';
import 'package:login_ui/Sign-in/main_page.dart';
import 'package:login_ui/UI/splashscreen.dart';
import 'package:login_ui/wishlist_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'Sign-in/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lottie/lottie.dart';
Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GoogleSignInProvider>(
        create: (context) => GoogleSignInProvider(),
        ),
        ChangeNotifierProvider<Wishlist_provider>(
            create: (context) => Wishlist_provider()
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: Splash()
      ),
    );
  }
}

