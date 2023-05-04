import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../SideBar/contact_us.dart';
import '../SideBar/setting.dart';
import '../Authentication/google_sign_in.dart';
import '../Authentication/login_page.dart';
import 'cuisinesInfo.dart';

class Cousines extends StatefulWidget {
  const Cousines({Key? key}) : super(key: key);

  @override
  State<Cousines> createState() => _CousinesState();
}

class _CousinesState extends State<Cousines> {
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
                      // leading: Icon(Icons.settings,color: Colors.black,size: 35,),
                      // title: Text('Settings',
                      //   style: TextStyle(
                      //       color: Colors.black,
                      //       fontSize: 20),
                      // ),
                      // onTap: (){
                      //   //Navigator.push(context, MaterialPageRoute(builder: (context)=> Setting()));
                      // },
                    ),
                  ),
                  //SizedBox(height: 10.0,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0,),
                    child: ListTile(
                      leading: Icon(Icons.phone,color: Colors.black,),
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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> CuisineDisplay(
                  name:'Indian',
                )
                )
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.shade900,
                  image: DecorationImage(image: AssetImage('assets/indian.jpg'),fit: BoxFit.cover),
                ),
                height: 190,
                child: Center(
                  child: Container(

                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Text(
                      'Indian',style: TextStyle(
                      color: Colors.black,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 29
                    ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> CuisineDisplay(name: 'Chinese')));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.shade900,
                  image: DecorationImage(image: AssetImage('assets/chinese.jpeg'),fit: BoxFit.cover),
                ),
                height: 190,
                child: Center(
                  child: Container(

                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Text(
                      'Chinese',style: TextStyle(
                        color: Colors.black,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 29
                    ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> CuisineDisplay(name: 'Mexican')));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.shade900,
                  image: DecorationImage(image: AssetImage('assets/mexican.jpg'),fit: BoxFit.cover),
                ),
                height: 190,
                child: Center(
                  child: Container(

                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Text(
                      'Mexican',style: TextStyle(
                        color: Colors.black,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 29
                    ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> CuisineDisplay(name: 'Italian')));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.shade900,
                  image: DecorationImage(image: AssetImage('assets/italian.png'),fit: BoxFit.cover),
                ),
                height: 190,
                child: Center(
                  child: Container(

                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Text(
                      'Italian',style: TextStyle(
                        color: Colors.black,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 29
                    ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> CuisineDisplay(name: 'Japanese')));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.shade900,
                  image: DecorationImage(image: AssetImage('assets/japanese.jpg'),fit: BoxFit.cover),
                ),
                height: 190,
                child: Center(
                  child: Container(

                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Text(
                      'Japanese',style: TextStyle(
                        color: Colors.black,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 29
                    ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> CuisineDisplay(name: 'French')));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.shade900,
                  image: DecorationImage(image: AssetImage('assets/french.jpg'),fit: BoxFit.cover),
                ),
                height: 190,
                child: Center(
                  child: Container(

                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Text(
                      'French',style: TextStyle(
                        color: Colors.black,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 29
                    ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> CuisineDisplay(name: 'Thai')));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.shade900,
                  image: DecorationImage(image: AssetImage('assets/thai.jpeg'),fit: BoxFit.cover),
                ),
                height: 190,
                child: Center(
                  child: Container(

                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Text(
                      'Thai',style: TextStyle(
                        color: Colors.black,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 29
                    ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),

        ],
      ),
    );
  }

}
