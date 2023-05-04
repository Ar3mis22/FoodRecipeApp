import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'dart:async';

import 'package:login_ui/Authentication/main_page.dart';

import 'login_page.dart';

class OtpAuth extends StatefulWidget {
  @override
  _OtpAuthState createState() => _OtpAuthState();
}

class _OtpAuthState extends State<OtpAuth> {
  String phoneNumber="", verificationId="";
  String otp="", authStatus = "";
  String countrycode = "+91";
  final TextEditingController phoneController = TextEditingController();

  Future<void> verifyPhoneNumber(BuildContext context) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: countrycode+phoneNumber,
      timeout: const Duration(seconds: 15),
      verificationCompleted: (AuthCredential authCredential) {
        setState(() {
          authStatus = "Your account is successfully verified";
        });
      },
      verificationFailed: (FirebaseAuthException authException) {
        setState(() {
          authStatus = "Authentication failed";
        });
      },
      codeSent: (String verId, int? resendToken) {
        verificationId = verId;
        setState(() {
          authStatus = "OTP has been successfully send";
        });
        otpDialogBox(context).then((value) {});
      },
      codeAutoRetrievalTimeout: (String verId) {
        verificationId = verId;
        setState(() {
          authStatus = "TIMEOUT";
        });
      },
    );
  }

  otpDialogBox(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Enter your OTP'),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(30),
                    ),
                  ),
                ),
                onChanged: (value) {
                  otp = value;
                },
              ),
            ),
            contentPadding: EdgeInsets.all(10.0),
            actions: <Widget>[
              ElevatedButton(
                onPressed: ()  {
                  Navigator.of(context).pop();
                  signIn(otp);
                },
                child: Text(
                  'Submit',
                ),
              ),
            ],
          );
        });
  }

  Future<void> signIn(String otp) async {
    await FirebaseAuth.instance
        .signInWithCredential(PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otp,
    ));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> MainPage()));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(
          "OTP Verification",
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => LoginPage()));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Image.asset(
              "assets/otp.jpg",
              height: 250,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Please enter valid phone number ",
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child:
              IntlPhoneField(

                controller: phoneController,
                showCountryFlag: true,
                showDropdownIcon: true,
                initialCountryCode: 'IN',
                onCountryChanged: (country) {
                  countrycode = "+" + country.dialCode;
                },
                onChanged: (phone) {
                  phoneNumber=phoneController.text.trim();
                },
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(13),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "   Phone No",

                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                    errorStyle: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w500),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(27.0),
                        borderSide: BorderSide.none)),


              )
            ),
              // TextField(
              //   keyboardType: TextInputType.phone,
              //   decoration: new InputDecoration(
              //       border: new OutlineInputBorder(
              //         borderRadius: const BorderRadius.all(
              //           const Radius.circular(30),
              //         ),
              //       ),
              //       filled: true,
              //       prefixIcon: Icon(
              //         Icons.phone_iphone,
              //         color: Colors.cyan,
              //       ),
              //       hintStyle: new TextStyle(color: Colors.grey[800]),
              //       hintText: "Enter Your Phone Number...",
              //       fillColor: Colors.white70),
              //   onChanged: (value) {
              //     phoneNumber = value;
              //   },
              // ),

            SizedBox(
              height: 10.0,
            ),
            SizedBox(
              height: 35,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrangeAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(27.0)
                  ),
                ),

                onPressed: () =>
                phoneNumber == null ? null : verifyPhoneNumber(context),
                child: Text(
                  "Request OTP",
                  style: TextStyle(color: Colors.white),
                ),

              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              authStatus == "" ? "" : authStatus,
              style: TextStyle(
                  color: authStatus.contains("fail") ||
                      authStatus.contains("TIMEOUT")
                      ? Colors.red
                      : Colors.green),
            )
          ],
        ),
      ),
    );
  }
}