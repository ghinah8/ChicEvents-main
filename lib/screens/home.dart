// ignore_for_file: camel_case_types, must_be_immutable, library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:chic_events/const.dart';
import 'package:chic_events/screens/one.dart';
import 'package:chic_events/widgets/button.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static String id = 'homepage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: double.infinity,
      child: Column(
        children: [
          Image.asset('assets/images/134_floral copy.jpg'),
          Expanded(
            child: SizedBox(
              height: double.infinity,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Categories',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          width: 400,
                          height: 160,
                          child: Row(children: [
                            Expanded(
                              child: SizedBox(
                                width: 200,
                                child: ListView(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    help(
                                        image:
                                            'assets/images/Beach_Wedding-min.png',
                                        title: 'Decoration'),
                                    const SizedBox(
                                      width: 25,
                                    ),
                                    help(
                                        image:
                                            'assets/images/photo_2024-06-09_23-24-08 (2).jpg',
                                        title: 'Catering'),
                                    const SizedBox(
                                      width: 25,
                                    ),
                                    help(
                                        image:
                                            'assets/images/photography-camera-learning-feature.jpg',
                                        title: 'Photography'),
                                    const SizedBox(
                                      width: 25,
                                    ),
                                    help(
                                        image:
                                            'assets/images/photo_2024-06-09_23-24-11 (3).jpg',
                                        title: 'food'),
                                    const SizedBox(
                                      width: 25,
                                    ),
                                    help(
                                        image:
                                            'assets/images/photo_2024-06-09_23-39-27.jpg',
                                        title: 'venue'),
                                    const SizedBox(
                                      width: 25,
                                    ),
                                    help(
                                        image:
                                            'assets/images/beach-wedding-destinations.jpg',
                                        title: 'makeup artist')
                                  ],
                                ),
                              ),
                            ),
                          ]),
                        ),
                        const Text(
                          'Wedding pakeage',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          width: 450,
                          height: 200,
                          child: Row(children: [
                            Expanded(
                              child: SizedBox(
                                width: 200,
                                child: ListView(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    package(
                                        name: 'Sunset View Wedding',
                                        guest: '25 guest',
                                        photo:
                                            'assets/images/Beach_Wedding-min.png',
                                        price: '56'),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    package(
                                        name: 'Della Resorts',
                                        guest: '45 guest',
                                        photo:
                                            'assets/images/Beach_Wedding-min.png',
                                        price: '56'),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    package(
                                        name: 'The Leela Coa',
                                        guest: '45 guest',
                                        photo:
                                            'assets/images/Beach_Wedding-min.png',
                                        price: '56')
                                  ],
                                ),
                              ),
                            ),
                          ]),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Famous Wedding Venue',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          width: 450,
                          height: 200,
                          child: Row(children: [
                            Expanded(
                              child: SizedBox(
                                width: 200,
                                child: ListView(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    package(
                                        name: 'Gallery Metro',
                                        guest: '',
                                        photo:
                                            'assets/images/Beach_Wedding-min.png',
                                        price: '56'),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    package(
                                        name: 'Sunset View Wedding',
                                        guest: '',
                                        photo:
                                            'assets/images/Beach_Wedding-min.png',
                                        price: '56'),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    package(
                                        name: 'Serenity Crove',
                                        guest: '',
                                        photo:
                                            'assets/images/Beach_Wedding-min.png',
                                        price: '56')
                                  ],
                                ),
                              ),
                            ),
                          ]),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Trending decore',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          width: 450,
                          height: 200,
                          child: Row(children: [
                            Expanded(
                              child: SizedBox(
                                width: 200,
                                child: ListView(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    package(
                                        name: 'Rain Forest Resort',
                                        guest: '30 guest',
                                        photo:
                                            'assets/images/Beach_Wedding-min.png',
                                        price: '56'),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    package(
                                        name: 'Royal Oak',
                                        guest: '40 guest',
                                        photo:
                                            'assets/images/Beach_Wedding-min.png',
                                        price: '56'),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    package(
                                        name: 'Heaven on Earth',
                                        guest: '25 guest',
                                        photo:
                                            'assets/images/Beach_Wedding-min.png',
                                        price: '56')
                                  ],
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          button(
            name: 'Create Event',
            ontap: () {
              Navigator.pushNamed(context, one.id);
            },
          )
        ],
      ),
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
          maxRadius: 45,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title!,
          style: const TextStyle(fontSize: 14),
        )
      ],
    );
  }
}

class package extends StatelessWidget {
  package(
      {required this.name,
      @required this.guest,
      required this.photo,
      required this.price});
  String? name;
  String? guest;
  String? price;
  String? photo;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 9,
                offset: const Offset(0, 3))
          ]),
      height: 200,
      width: 180,
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            photo!,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(name!),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              guest!,
              style: const TextStyle(color: color4, fontSize: 14),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              ' \$ $price onwards',
              style: const TextStyle(
                color: color2,
              ),
            ),
          )
        ],
      ),
    );
  }
}
