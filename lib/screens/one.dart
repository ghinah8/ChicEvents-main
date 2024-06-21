// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:chic_events/const.dart';
import 'package:flutter/material.dart';

class one extends StatefulWidget {
  static String id = 'one';
  const one({super.key});

  @override
  State<one> createState() => _oneState();
}

class _oneState extends State<one> {
  List<ven> listVendors = [
    ven(
        image: 'assets/images/photo_2024-06-09_23-24-08 (2).jpg',
        text: 'Bridal wear',
        title: 'Bridal Lehengas,Gowns'),
    ven(
        image: 'assets/images/photo_2024-06-09_23-24-11 (2).jpg',
        text: 'Groom Wear',
        title: 'shervani,wedding suits'),
    ven(
        image: 'assets/images/photography-camera-learning-feature.jpg',
        text: 'Photographers',
        title: 'Video,Photographer'),
    ven(
        image: 'assets/images/photo_2024-06-09_23-24-11.jpg',
        text: 'Decoration',
        title: 'Decoration of event'),
    ven(
        image: 'assets/images/photo_2024-06-09_23-24-11 (3).jpg',
        text: 'Food',
        title: 'invitation card'),
    ven(
        image: 'assets/images/photo_2024-06-09_23-39-27.jpg',
        text: 'Venue',
        title: 'Farmhose ,lawn,banquets hall'),
    ven(
        image: 'assets/images/images.jpg',
        text: 'Catering',
        title: 'Catering service,cake'),
    ven(
        image: 'assets/images/beach-wedding-destinations.jpg',
        text: 'Makup artist',
        title: 'Bridal makup,family makup'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: color4,
        title: Text(
          'Vendors',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView.builder(
            itemCount: listVendors.length,
            itemBuilder: (context, index) => Vendors(
                imagenum: listVendors[index].image,
                text: listVendors[index].text,
                title: listVendors[index].title)),
      ),
    );
  }
}

Widget Vendors({
  required String imagenum,
  required String text,
  required String title,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: const Offset(0, 3),
            blurRadius: 3,
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
              image: DecorationImage(
                image: AssetImage(imagenum),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Text(
                  title,
                  style: const TextStyle(color: Colors.grey, fontSize: 16),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}

class ven {
  String image;
  String text;
  String title;

  ven({required this.image, required this.text, required this.title});
}
