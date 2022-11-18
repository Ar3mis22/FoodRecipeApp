import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/otp.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:form_validator/form_validator.dart';

class PhoneNo extends StatefulWidget {
  const PhoneNo({Key? key}) : super(key: key);

  @override
  State<PhoneNo> createState() => _PhoneState();
}

class _PhoneState extends State<PhoneNo> {
  TextEditingController countrycode = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var _text = '';
  bool _submitted = false;

  void _submit() {
    setState(() => _submitted = true);
    // validate all the form fields
    if (_formKey.currentState!.validate()) {
      // on success, notify the parent widget
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> otp()));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    countrycode.text = '+91';
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone No. Verfication'),
        backgroundColor: Colors.green[200],
      ),
      body: Form(
        key: _formKey,
        //autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 26,
              ),
              Image.asset('assets/otp2.png'),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: Text('Phone Verification',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),)),
              Text('Please Enter your phone no. to get started!!',style: TextStyle(fontSize: 15),),
              SizedBox(
                height: 5,
              ),
              Container(
                margin: EdgeInsets.only(left: 12,right: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.green)
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      child: TextFormField(
                         keyboardType: TextInputType.number,
                        controller: countrycode,
                        decoration: InputDecoration(border: InputBorder.none),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Can\'t be empty';
                          }
                           if (text.length < 4) {
                            return 'Too short';
                          }
                           if (text.length > 10) {
                            return 'Too long';
                          }
                          else {
                            return null;
                          }
                        },
                        // onChanged: (text) => setState(() => _text = text),
                      ),

                      width: 40,
                    ),

                    Text("|",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 33,color: Colors.green),),
                    Expanded(child: TextField(

                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(border: InputBorder.none,hintText: 'Phone No.',),

                    ))

                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: (){
                  final isValidForm = _formKey.currentState!.validate();
                  if(isValidForm) {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => otp()));
                  }
                },
                child: Container(

                  height: screenheight/20,
                  width: screenWidth/2,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12)
                  ),

                  child: Center(child: Text('Send',style: TextStyle(color: Colors.white),)),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
