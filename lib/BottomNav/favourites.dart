import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../SideBar/contact_us.dart';
import '../SideBar/setting.dart';
import '../login_page.dart';

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
      drawer: Drawer(child: Material(
        color: Colors.deepPurple[200],
        child: ListView(
          children: [
            Container(
              height: 50,
              color: Colors.deepPurple,
              child: Center(
                  child: Text('Foodies',
                    style: TextStyle(
                        fontSize: 42,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Dancingscript'
                    ),
                  )
              ),
            ),
            SizedBox(height: 20,),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,),
                  child: ListTile(
                    leading: Icon(Icons.settings,color: Colors.white,size: 35,),
                    title: Text('Settings',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20),
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Setting()));
                    },
                  ),
                ),
                //SizedBox(height: 10.0,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,),
                  child: ListTile(
                    leading: Image.asset('assets/support.png',color: Colors.white,scale: 15,),
                    title: Text('Contact us',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20),
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Contact_us()));
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,),
                  child: ListTile(
                    leading: Icon(Icons.logout_rounded,color: Colors.white,size: 35,),
                    title: Text('Log_out',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20),
                    ),
                    onTap: (){

                      Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),),

    );
  }
}
