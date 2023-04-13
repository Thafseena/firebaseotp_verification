import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseotp_verification/home.dart';
import 'package:firebaseotp_verification/otp.dart';
import 'package:firebaseotp_verification/phone.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'phone',
    routes: {
      'phone':(context) => MyPhone(),
      'otp':(context) => MyOtp(),
      'home':(context) => MyHome()
    },
  ));
}

