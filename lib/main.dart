// ignore_for_file: use_super_parameters

import 'package:chic_events/firebase_options.dart';
import 'package:chic_events/screens/home.dart';
import 'package:chic_events/screens/navbar.dart';

import 'package:chic_events/screens/one.dart';
import 'package:chic_events/screens/profile.dart';
import 'package:chic_events/screens/signin_page.dart';
import 'package:chic_events/screens/signup_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Checevents());
}

class GetStart1 extends StatelessWidget {
  const GetStart1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff4b173d),
    );
  }
}

class Checevents extends StatelessWidget {
  const Checevents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        signinpag.id: (context) => signinpag(),
        signupag.id: (context) => signupag(),
        Myprofile.id: (context) => const Myprofile(),
        EditProfile.id1: (context) => const EditProfile(),
        support.id3: (context) => const support(),
        Payment.id2: (context) => Payment(),
        HomePage.id: (context) => HomePage(),
        one.id: (context) => const one(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: 'signinpag',
      home: navbar(),
    );
  }
}
