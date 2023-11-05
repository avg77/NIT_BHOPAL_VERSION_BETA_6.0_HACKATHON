import 'package:farmer_app/phone.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pinput/pinput.dart';

class MyOtp extends StatefulWidget {
  const MyOtp({Key? key}) : super(key: key);

  @override
  State<MyOtp> createState() => _MyOtpState();
}

class _MyOtpState extends State<MyOtp> {

  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
        width: 56,
        height: 56,
        textStyle: TextStyle(
            fontSize: 20,
            color: Color.fromRGBO(30, 60, 87, 1),
            fontWeight: FontWeight.w600),
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
          borderRadius: BorderRadius.circular(20),
        ));

    final focusedPinTheme = PinTheme(
        width: 56,
        height: 56,
        textStyle: TextStyle(
            fontSize: 20,
            color: Color.fromRGBO(30, 60, 87, 1),
            fontWeight: FontWeight.w600),
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
          borderRadius: BorderRadius.circular(8),
        ));

    final submittedPinTheme = PinTheme(
        width: 56,
        height: 56,
        textStyle: TextStyle(
            fontSize: 20,
            color: Color.fromRGBO(30, 60, 87, 1),
            fontWeight: FontWeight.w600),
        decoration: BoxDecoration(
          color: Color.fromRGBO(234, 239, 243, 1), // Background color
          border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
          borderRadius: BorderRadius.circular(20),
        ));

    var code="";

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/farmer.png',
                width: 100.0, // Adjust the width as needed
                height: 100.0, // Adjust the height as needed
              ),
              Text(
                'Verify OTP',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Add your phone number, We'll send you a verification code",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Pinput(
                showCursor: true,
                length: 6, // Set the desired pin length to 6
                onChanged: (value){
                  code=value;
                },
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () async{
                  try{
                    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: MyPhone.verify, smsCode: code);
                    await auth.signInWithCredential(credential);
                    Navigator.pushNamedAndRemoveUntil(context, "home", (route) => false);
                  }
                  catch(e){
                    print("wrong otp");
                  }
                },
                child: Text('Verify Phone Number'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, 'phone', (route) => false);
                    },
                    child: Text(
                      'Edit Phone Number?',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
