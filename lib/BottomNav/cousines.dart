import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../SideBar/contact_us.dart';
import '../SideBar/setting.dart';
import '../google_sign_in.dart';
import '../login_page.dart';

class Cousines extends StatelessWidget {
  const Cousines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Material(
          color: Colors.black12,
          child: ListView(
            children: [
              Container(
                height: 70,
                color: Colors.deepOrangeAccent,
                child: Center(
                    child: Text('Foodies',
                      style: TextStyle(
                        fontSize: 42,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        //fontFamily: 'Dancingscript'
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
                      leading: Icon(Icons.settings,color: Colors.black,size: 35,),
                      title: Text('Settings',
                        style: TextStyle(
                            color: Colors.black,
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
                      leading: Image.asset('assets/support.png',color: Colors.black,scale: 15,),
                      title: Text('Contact us',
                        style: TextStyle(
                            color: Colors.black,
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
                      leading: Icon(Icons.logout_rounded,color: Colors.black,size: 35,),
                      title: Text('Log_out',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20),
                      ),
                      onTap: (){
                        final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
                        provider.logout();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text("Cousines",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
