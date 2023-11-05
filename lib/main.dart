import 'package:farmer_app/Crop_Landing_Page.dart';
import 'package:farmer_app/add_loans.dart';
import 'package:farmer_app/add_market.dart';
import 'package:farmer_app/otp.dart';
import 'package:farmer_app/phone.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'add_policies.dart';
import 'crop_list_page.dart';
import 'cropinfo.dart';
import 'home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'phone',
      routes: {
        'phone': (context) => MyPhone(),
        'otp': (context) => MyOtp(),
        'home' : (context) =>MyHome(),
        'scheme_add' : (context) => AddPostScreen(),
        'crop_info_add' : (context) => CropInfoForm(),
        'loan_info_add' : (context) => AddLoanScreen(),
        'market_place_add' : (context) => AddMarketScreen(),
        'crop_list': (context)=> CropInfoDisplay(),
      },
    );
  }
}
