import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/Authentication/phone.dart';
import 'package:pinput/pinput.dart';

class otp extends StatefulWidget {
  const otp({Key? key}) : super(key: key);

  @override
  State<otp> createState() => _otpState();
}

class _otpState extends State<otp> {
  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP verification'),
        backgroundColor: Colors.green[200],
      ),
      body: SingleChildScrollView(

        child: Column(
          children: [
            SizedBox(
              height: 26,
            ),
            Image.asset('assets/otp3.png'),
            SizedBox(
              height: 35,
            ),
            Center(
                child: Text('OTP Verification',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),)),
            Text('Please Do NOT share your OTP with anyone!',style: TextStyle(fontSize: 15),),
            SizedBox(
              height: 5,
            ),
        Pinput(

          validator: (s) {
            return s == '2222' ? null : 'Pin is incorrect';
          },
          pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
          showCursor: true,
          onCompleted: (pin) => print(pin),

        ),

            SizedBox(
              height: 10,
            ),
            Container(

              height: screenheight/20,
              width: screenWidth/2,
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12)
              ),

              child: Center(child: Text('Verify Phone No.',style: TextStyle(color: Colors.white),)),
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PhoneNo()));
            }, child: Text('Change Phone No.?',style: TextStyle(color: Colors.red),))


          ],
        ),
      ),
    );
  }
}
