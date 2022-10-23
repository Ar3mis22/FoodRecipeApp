import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/cousines.dart';
import 'package:login_ui/favourites.dart';
import 'package:login_ui/home_pg.dart';
import 'package:login_ui/welcome_page.dart';
import 'package:login_ui/nav_bar.dart';

class Nav_bar extends StatefulWidget {
  const Nav_bar({Key? key}) : super(key: key);

  @override
  State<Nav_bar> createState() => _Nav_barState();
}

class _Nav_barState extends State<Nav_bar> {
  int selectedindex=0;
  List<Widget> _WidgetOptions = <Widget>
  [
    Home_page(),
    Favourites(),
    Cousines(),
    WelcomePge(),
  ];
  void onItemTap(int index){
    setState(() {
      selectedindex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // appBar: AppBar(
      //   backgroundColor: Colors.deepPurple,
      //   title: Text("Home Page",
      //     style: TextStyle(
      //       color: Colors.white,
      //     ),
      //   ),
      // ),
      body: _WidgetOptions.elementAt(selectedindex),
      bottomNavigationBar: Container(
        color: Colors.deepPurple.shade100,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 20.0),
            child:  NavigationBarTheme(
              data: NavigationBarThemeData(
                  indicatorColor: Colors.white70,
                  height: 10.0,
                  labelTextStyle: MaterialStateProperty.all(
                    TextStyle(fontSize: 14,fontWeight: FontWeight.w500),
                  )
              ),
              child: NavigationBar(
                height: 30,
                backgroundColor: Colors.deepPurple[100],
                selectedIndex: selectedindex,
                onDestinationSelected: onItemTap,
                destinations: [
                  NavigationDestination(icon: Icon(Icons.home_filled,color: Colors.deepPurple,), label: 'Home',),
                  NavigationDestination(icon: Icon(Icons.favorite_rounded,color: Colors.deepPurple,), label: 'Favourites'),
                  NavigationDestination(icon: Icon(Icons.fastfood_rounded,color: Colors.deepPurple,), label: 'Cousines'),
                  NavigationDestination(icon: Icon(Icons.person_rounded,color: Colors.deepPurple,), label: 'Profile'),
                ],



              ),
            )

        ),
      ),
    );

  }

}



