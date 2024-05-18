import 'package:chic_events/helper/showsnackbar.dart';
import 'package:chic_events/main.dart';
import 'package:chic_events/widgets/button.dart';
import 'package:chic_events/widgets/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:chic_events/screens/signup_page.dart';

class signinpag extends StatefulWidget {
  signinpag({Key? key}) : super(key: key);
  static String id = 'signinpage';

  @override
  State<signinpag> createState() => _signinpagState();
}

class _signinpagState extends State<signinpag> {
  GlobalKey<FormState> formkey = GlobalKey();
  String? email;
  String? password;
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: formkey,
          child: ListView(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),

                const Text(
                  'Chic Events',
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'pacifico',
                    color: Color(0xff4b173d),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                //i cann but a row widget instead of align
                const Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 24,
                        color: Color(0xff4b173d),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: textfield(
                    onchange: (data) {
                      email = data;
                    },
                    hint: 'EnteryourEmail@gmail.com',
                    lab: 'Email',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: textfield(
                      onchange: (data) {
                        password = data;
                      },
                      hint: '********',
                      lab: 'Password',
                      obscuretext: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70),
                    child: button(
                        ontap: () async {
                          if (formkey.currentState!.validate()) {
                            isloading = true;
                            setState(() {});
                            try {
                              await signinuser();
                              Navigator.pushNamed(
                                  context, MyBottomNavigationBar.id,
                                  arguments: email);
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'user-not-found') {
                                showsnackbar(
                                    context, 'No user found for that email.');
                              } else if (e.code == 'wrong-password') {
                                showsnackbar(context,
                                    'Wrong password provided for that user.');
                              } else if (e.code ==
                                  'INVALID_LOGIN_CREDENTIALS') {
                                showsnackbar(context,
                                    'check your email and write it correctly');
                              }
                            } catch (e) {
                              showsnackbar(context, 'there was an error');
                            }
                            isloading = false;
                            setState(() {});
                          }
                        },
                        name: 'Sign In'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'don\'t have an account?',
                      style: TextStyle(
                        color: Color(0xff4b173d),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, signupag.id);
                      },
                      child: const Text(' Sing up',
                          style: TextStyle(
                            color: Color(0xff4b173d),
                          )),
                    )
                  ],
                ),
                SizedBox(
                  height: 130,
                ),
                Image.asset(
                  'assets/images/pngimg.com - party_PNbG45.png',
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  Future<void> signinuser() async {
    // ignore: unused_local_variable
    UserCredential usre = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
