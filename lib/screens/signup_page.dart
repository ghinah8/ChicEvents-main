import 'package:chic_events/main.dart';
import 'package:chic_events/widgets/button.dart';
import 'package:chic_events/widgets/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:chic_events/helper/showsnackbar.dart';

import 'package:chic_events/screens/signin_page.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class signupag extends StatefulWidget {
  signupag({Key? key}) : super(key: key);
  static String id = 'signupag';

  @override
  State<signupag> createState() => _signupagState();
}

class _signupagState extends State<signupag> {
  String? email;

  String? password;

  bool isloading = false;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: formkey,
          child: ListView(children: [
            const SizedBox(
              height: 100,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Chic Events',
                  style: TextStyle(
                      fontSize: 32,
                      fontFamily: 'pacifico',
                      color: Color(0xff4b173d)),
                ),
                const SizedBox(
                  height: 40,
                ),
                //i cann but a row widget
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Sign UP',
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
                    lab: 'Email',
                    hint: 'youremail@gmail.com',
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
                              await sginupuser();
                              Navigator.pushNamed(
                                  context, MyBottomNavigationBar.id,
                                  arguments: email);
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                showsnackbar(context, 'weak password');
                              } else if (e.code == 'email-already-in-use') {
                                showsnackbar(context, 'email already exsist');
                              }
                            } catch (e) {
                              showsnackbar(context, 'there was an erorr');
                            }
                            isloading = false;
                            setState(() {});
                          }
                        },
                        name: 'Sgin Up'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account:',
                      style: TextStyle(color: Color(0xff4b173d)),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          signinpag.id,
                        );
                      },
                      child: const Text(' Sign in',
                          style: TextStyle(
                            color: Color(0xff4b173d),
                          )),
                    )
                  ],
                ),
                Image.asset(
                  'assets/images/pngimg.com - party_PNG45.png',
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  Future<void> sginupuser() async {
    // ignore: unused_local_variable
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
