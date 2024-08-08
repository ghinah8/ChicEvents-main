// ignore_for_file: override_on_non_overriding_member, must_be_immutable, sort_child_properties_last, camel_case_types, prefer_const_constructors_in_immutables

import 'package:chic_events/const.dart';
import 'package:chic_events/core/firestore/firestore_database.dart';
import 'package:chic_events/core/helper/toaster.dart';
import 'package:chic_events/core/widgets/button.dart';
import 'package:chic_events/core/widgets/textfield.dart';
import 'package:chic_events/screens/auth/signin_page.dart';
import 'package:chic_events/screens/home/presentation/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Myprofile extends StatefulWidget {
  const Myprofile({super.key});
  static String id = 'myprofile';
  @override
  State<Myprofile> createState() => _MyprofileState();
}

class _MyprofileState extends State<Myprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color4,
        title: const Text('Profile'),
      ),
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                height: 580,
                width: 380,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3))
                ], borderRadius: BorderRadius.circular(10)),
                child: Container(
                  height: 580,
                  width: 370,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 140, left: 20, right: 10),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Row(
                            children: [
                              const Icon(Icons.person),
                              const SizedBox(
                                width: 20,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      EditProfile.id1,
                                    );
                                  },
                                  child: const Text(
                                    'Edit Profile',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )),
                              const SizedBox(
                                width: 170,
                              ),
                              const Icon(FontAwesomeIcons.angleRight)
                            ],
                          ),
                        ),
                        const Divider(
                          color: Color.fromARGB(255, 202, 202, 202),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(FontAwesomeIcons.creditCard),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          MYOrders.id2,
                                        );
                                      },
                                      child: const Text(
                                        'My Orders',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      )),
                                ],
                              ),
                              const Icon(FontAwesomeIcons.angleRight)
                            ],
                          ),
                        ),
                        const Divider(
                          color: Color.fromARGB(255, 202, 202, 202),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            children: [
                              const Icon(FontAwesomeIcons.teamspeak),
                              const SizedBox(
                                width: 20,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      support.id3,
                                    );
                                  },
                                  child: const Text(
                                    'Support',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )),
                              const SizedBox(
                                width: 196,
                              ),
                              const Icon(FontAwesomeIcons.angleRight)
                            ],
                          ),
                        ),
                        const Divider(
                          color: Color.fromARGB(255, 202, 202, 202),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            children: [
                              const Icon(
                                  FontAwesomeIcons.arrowRightFromBracket),
                              const SizedBox(
                                width: 20,
                              ),
                              GestureDetector(
                                  onTap: () async {
                                    await FirebaseAuth.instance.signOut();
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                const signinpag()),
                                        (route) => false);
                                  },
                                  child: const Text(
                                    'Log Out',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )),
                              const SizedBox(
                                width: 198,
                              ),
                              const Icon(FontAwesomeIcons.angleRight)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: FutureBuilder(
                future: FirestoreDatabase().getProfile(),
                builder: (context, s) {
                  if (s.connectionState == ConnectionState.active) {
                    return const Center();
                  } else if (s.hasData) {
                    return s.data!.fold((l) {
                      return MainErrorWidget(onPressed: () {
                        setState(() {});
                      });
                    }, (r) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/profile-circle-icon-2048x2048-cqe5466q.png'),
                              maxRadius: 65,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              r!['userName'].toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Text(
                            r['email'] ?? '',
                            style: const TextStyle(fontSize: 18, color: color3),
                          )
                        ],
                      );
                    });
                  } else
                    return const Center();
                }),
          ),
        ],
      ),
    );
  }
}

class EditProfile extends StatelessWidget {
  EditProfile({super.key});
  String name = '';
  String phone = '';
  String email = '';
  static String id1 = 'editprofile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ListView(children: [
          Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const CircleAvatar(
                backgroundImage: AssetImage(
                    'assets/images/profile-circle-icon-2048x2048-cqe5466q.png'),
                maxRadius: 65,
              ),
              const SizedBox(
                height: 40,
              ),
              const Align(
                child: Text(
                  'User name',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                alignment: Alignment.centerLeft,
              ),
              const SizedBox(
                height: 5,
              ),
              TextFieldForm(
                lab: '',
              ),
              const SizedBox(
                height: 30,
              ),
              const Align(
                child: Text(
                  'Phone Number',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                alignment: Alignment.centerLeft,
              ),
              const SizedBox(
                height: 5,
              ),
              TextFieldForm(
                lab: '',
              ),
              const SizedBox(
                height: 30,
              ),
              const Align(
                child: Text(
                  'Email address',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                alignment: Alignment.centerLeft,
              ),
              const SizedBox(
                height: 5,
              ),
              TextFieldForm(
                lab: '',
              ),
              const SizedBox(
                height: 30,
              ),
              ButtonOne(name: 'Save')
            ],
          ),
        ]),
      ),
    );
  }
}

class support extends StatelessWidget {
  support({super.key});

  static String id3 = 'support';
  String name = '';
  String email = '';
  String message = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Column(
          children: [
            const SizedBox(
              height: 250,
              width: 300,
              child: Image(
                  image: AssetImage(
                'assets/images/servicihho-post-venta.png',
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Write us',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Let\'s us know your requirement ',
                      style: TextStyle(color: color3),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Name',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldForm(
                    lab: '',
                    hint: 'Enter your name',
                    onchange: (s) {
                      name = s;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Email Address',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldForm(
                    lab: '',
                    onchange: (s) {
                      email = s;
                    },
                    hint: 'Enter your Email',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Message',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldForm(
                    lab: '',
                    onchange: (s) {
                      message = s;
                    },
                    hint: 'Write message here',
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ButtonOne(
                    name: 'Send',
                    ontap: () async {
                      Toaster.showLoading();
                      final result = await FirestoreDatabase()
                          .sendFeedBack(name, email, message);
                      result.fold((l) {
                        Toaster.showToast(l);
                      }, (r) {
                        Navigator.pop(context);
                      });
                      Toaster.showToast('We Appreciate You For Your Feedback');
                      Toaster.closeLoading();
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}

class MYOrders extends StatefulWidget {
  MYOrders({super.key});
  static String id2 = 'payment';

  @override
  State<MYOrders> createState() => _MYOrdersState();
}

class _MYOrdersState extends State<MYOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Payment Selection'),
        ),
        body: FutureBuilder(
            future: FirestoreDatabase().getOrders(),
            builder: (context, s) {
              if (!s.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return s.data!.fold((l) {
                  Toaster.showToast(l);
                  return Center(
                    child: MainErrorWidget(onPressed: () {
                      setState(() {});
                    }),
                  );
                }, (r) {
                  return ListView.builder(
                      itemCount: r.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ExpansionTile(
                            collapsedBackgroundColor: r[index].status == 1
                                ? null
                                : r[index].status == 2
                                    ? Colors.greenAccent
                                    : Colors.redAccent,
                            title: Text(
                              '${r[index].total}   Num Of Products ${r[index].products?.length} ',
                            ),
                            children: [
                              const Text('Products'),
                              Wrap(
                                children: r[index].products!.map((e) {
                                  return Card(
                                    child: Text(e.name!),
                                  );
                                }).toList(),
                              ),
                              const Text('Date'),
                              Text(r[index].date.toDate().toString())
                            ],
                          ),
                        );
                      });
                });
              }
            }));
  }
}
