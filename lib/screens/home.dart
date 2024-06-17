// ignore_for_file: camel_case_types, must_be_immutable

import 'package:chic_events/const.dart';
import 'package:chic_events/main.dart';
import 'package:chic_events/screens/one.dart';
import 'package:chic_events/screens/profile.dart';
import 'package:chic_events/screens/signin_page.dart';
import 'package:chic_events/widgets/button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  static String id = 'homepage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.alwaysShow;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset('assets/images/134_floral copy.jpg'),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 249),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Categories',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(children: [
                help(
                    image: 'assets/images/Beach_Wedding-min.png',
                    title: 'Decoration'),
                const SizedBox(
                  width: 20,
                ),
                help(
                    image: 'assets/images/photo_2024-06-09_23-24-08 (2).jpg',
                    title: 'Catering'),
                const SizedBox(
                  width: 20,
                ),
                help(
                    image:
                        'assets/images/photography-camera-learning-feature.jpg',
                    title: 'Photography')
              ]),
              const SizedBox(
                height: 310,
              ),
              button(
                name: 'Create Event',
                ontap: () {
                  Navigator.pushNamed(context, one.id);
                },
              )
            ],
          ),
        ),
      ],
    ));
  }
}

class help extends StatelessWidget {
  help({required this.image, required this.title});
  String? image;
  String? title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(image!),
          maxRadius: 40,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          title!,
          style: TextStyle(fontSize: 14),
        )
      ],
    );
  }
}
