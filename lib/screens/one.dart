// ignore_for_file: camel_case_types

import 'package:chic_events/const.dart';
import 'package:chic_events/screens/venue.dart';
import 'package:flutter/material.dart';

class one extends StatefulWidget {
  const one({super.key});
  static String id = 'one';
  @override
  State<one> createState() => _oneState();
}

class _oneState extends State<one> {
  List<Ven> listVendors = [
    Ven(
        image: 'photographer.jpeg',
        text: 'Photographers',
        title: 'Video,Photographer',
        listElement: [
          ElementVen(
              imageE: 'photographer.jpeg',
              textE: 'Hi ',
              price: '12123',
              size: '200',
              rate: '4',
              location: 'london',
              about:
                  'Im learning Flutter (and coding in general) and I cant seem to find the issue with my latest project. When I run in simulator the slider forms just fine, click the thumb and the label shows, but the thumb won'),
          ElementVen(
              imageE: 'photographer.jpeg',
              textE: 'Bye',
              price: '12123',
              size: '343',
              rate: '5',
              location: 'london',
              about:
                  'Im learning Flutter (and coding in general) and I cant seem to find the issue with my latest project. When I run in simulator the slider forms just fine, click the thumb and the label shows, but the thumb won'),
          ElementVen(
              imageE: 'photographer.jpeg',
              textE: 'Non',
              price: '12123',
              size: '500',
              rate: '3',
              location: 'london',
              about:
                  'Im learning Flutter (and coding in general) and I cant seem to find the issue with my latest project. When I run in simulator the slider forms just fine, click the thumb and the label shows, but the thumb won'),
          ElementVen(
              imageE: 'photographer.jpeg',
              textE: 'John',
              price: '1232443',
              size: '4232',
              rate: '2.5',
              location: 'london',
              about:
                  'Im learning Flutter (and coding in general) and I cant seem to find the issue with my latest project. When I run in simulator the slider forms just fine, click the thumb and the label shows, but the thumb won'),
        ]),
    Ven(
        image: '55.jpg',
        text: 'Invitation',
        title: 'invitation card',
        listElement: [
          ElementVen(
              imageE: '55.jpg',
              textE: 'Hi ',
              price: '12123',
              size: '200',
              rate: '4',
              location: 'london',
              about:
                  'Im learning Flutter (and coding in general) and I cant seem to find the issue with my latest project. When I run in simulator the slider forms just fine, click the thumb and the label shows, but the thumb won'),
          ElementVen(
              imageE: '55.jpg',
              textE: 'Bye',
              price: '12123',
              size: '343',
              rate: '5',
              location: 'london',
              about:
                  'Im learning Flutter (and coding in general) and I cant seem to find the issue with my latest project. When I run in simulator the slider forms just fine, click the thumb and the label shows, but the thumb won'),
          ElementVen(
              imageE: '55.jpg',
              textE: 'Non',
              price: '12123',
              size: '500',
              rate: '3',
              location: 'london',
              about:
                  'Im learning Flutter (and coding in general) and I cant seem to find the issue with my latest project. When I run in simulator the slider forms just fine, click the thumb and the label shows, but the thumb won'),
          ElementVen(
              imageE: '55.jpg',
              textE: 'John',
              price: '1232443',
              size: '4232',
              rate: '2.5',
              location: 'london',
              about:
                  'Im learning Flutter (and coding in general) and I cant seem to find the issue with my latest project. When I run in simulator the slider forms just fine, click the thumb and the label shows, but the thumb won'),
        ]),
    Ven(
        image: 'decor4.jpeg',
        text: 'Halls',
        title: 'Farmhose ,lawn,banquets hall',
        listElement: [
          ElementVen(
              imageE: 'decor4.jpeg',
              textE: 'Hi ',
              price: '12123',
              size: '200',
              rate: '4',
              location: 'london',
              about:
                  'Im learning Flutter (and coding in general) and I cant seem to find the issue with my latest project. When I run in simulator the slider forms just fine, click the thumb and the label shows, but the thumb won'),
          ElementVen(
              imageE: '55.jpg',
              textE: 'Bye',
              price: '12123',
              size: '343',
              rate: '5',
              location: 'london',
              about:
                  'Im learning Flutter (and coding in general) and I cant seem to find the issue with my latest project. When I run in simulator the slider forms just fine, click the thumb and the label shows, but the thumb won'),
          ElementVen(
              imageE: '55.jpg',
              textE: 'Non',
              price: '12123',
              size: '500',
              rate: '3',
              location: 'london',
              about:
                  'Im learning Flutter (and coding in general) and I cant seem to find the issue with my latest project. When I run in simulator the slider forms just fine, click the thumb and the label shows, but the thumb won'),
          ElementVen(
              imageE: 'decor4.jpeg',
              textE: 'John',
              price: '1232443',
              size: '4232',
              rate: '2.5',
              location: 'london',
              about:
                  'Im learning Flutter (and coding in general) and I cant seem to find the issue with my latest project. When I run in simulator the slider forms just fine, click the thumb and the label shows, but the thumb won'),
        ]),
    Ven(
        image: '77.jpg',
        text: 'Catering',
        title: 'Catering service,cake',
        listElement: [
          ElementVen(
              imageE: 'swets.jpg',
              textE: 'Hi ',
              price: '12123',
              size: '200',
              rate: '4',
              location: 'london',
              about:
                  'Im learning Flutter (and coding in general) and I cant seem to find the issue with my latest project. When I run in simulator the slider forms just fine, click the thumb and the label shows, but the thumb won'),
          ElementVen(
              imageE: 'swets.jpg',
              textE: 'Bye',
              price: '12123',
              size: '343',
              rate: '5',
              location: 'london',
              about:
                  'Im learning Flutter (and coding in general) and I cant seem to find the issue with my latest project. When I run in simulator the slider forms just fine, click the thumb and the label shows, but the thumb won'),
          ElementVen(
              imageE: 'food.jpeg',
              textE: 'Non',
              price: '12123',
              size: '500',
              rate: '3',
              location: 'london',
              about:
                  'Im learning Flutter (and coding in general) and I cant seem to find the issue with my latest project. When I run in simulator the slider forms just fine, click the thumb and the label shows, but the thumb won'),
          ElementVen(
              imageE: 'food.jpeg',
              textE: 'John',
              price: '1232443',
              size: '4232',
              rate: '2.5',
              location: 'london',
              about:
                  'Im learning Flutter (and coding in general) and I cant seem to find the issue with my latest project. When I run in simulator the slider forms just fine, click the thumb and the label shows, but the thumb won'),
        ]),
    Ven(
        image: 'decor.jpeg',
        text: 'Decoration',
        title: 'decoration of hall',
        listElement: [
          ElementVen(
              imageE: 'decor.jpeg',
              textE: 'Hi ',
              price: '12123',
              size: '200',
              rate: '4',
              location: 'london',
              about:
                  'Im learning Flutter (and coding in general) and I cant seem to find the issue with my latest project. When I run in simulator the slider forms just fine, click the thumb and the label shows, but the thumb won'),
          ElementVen(
              imageE: '55.jpg',
              textE: 'Bye',
              price: '12123',
              size: '343',
              rate: '5',
              location: 'london',
              about:
                  'Im learning Flutter (and coding in general) and I cant seem to find the issue with my latest project. When I run in simulator the slider forms just fine, click the thumb and the label shows, but the thumb won'),
          ElementVen(
              imageE: 'decor4.jpeg',
              textE: 'Non',
              price: '12123',
              size: '500',
              rate: '3',
              location: 'london',
              about:
                  'Im learning Flutter (and coding in general) and I cant seem to find the issue with my latest project. When I run in simulator the slider forms just fine, click the thumb and the label shows, but the thumb won'),
          ElementVen(
              imageE: 'decor4.jpeg',
              textE: 'John',
              price: '1232443',
              size: '4232',
              rate: '2.5',
              location: 'london',
              about:
                  'Im learning Flutter (and coding in general) and I cant seem to find the issue with my latest project. When I run in simulator the slider forms just fine, click the thumb and the label shows, but the thumb won'),
        ]),
    Ven(
        image: 'download.jpeg',
        text: 'Music',
        title: 'singors,DJ',
        listElement: [
          ElementVen(
              imageE: 'download.jpeg',
              textE: 'Hi ',
              price: '12123',
              size: '200',
              rate: '4',
              location: 'london',
              about:
                  'Im learning Flutter (and coding in general) and I cant seem to find the issue with my latest project. When I run in simulator the slider forms just fine, click the thumb and the label shows, but the thumb won'),
          ElementVen(
              imageE: 'download.jpeg',
              textE: 'Bye',
              price: '12123',
              size: '343',
              rate: '5',
              location: 'london',
              about:
                  'Im learning Flutter (and coding in general) and I cant seem to find the issue with my latest project. When I run in simulator the slider forms just fine, click the thumb and the label shows, but the thumb won'),
          ElementVen(
              imageE: 'download.jpeg',
              textE: 'Non',
              price: '12123',
              size: '500',
              rate: '3',
              location: 'london',
              about:
                  'Im learning Flutter (and coding in general) and I cant seem to find the issue with my latest project. When I run in simulator the slider forms just fine, click the thumb and the label shows, but the thumb won'),
          ElementVen(
              imageE: '44.jpg',
              textE: 'John',
              price: '1232443',
              size: '4232',
              rate: '2.5',
              location: 'london',
              about:
                  'Im learning Flutter (and coding in general) and I cant seem to find the issue with my latest project. When I run in simulator the slider forms just fine, click the thumb and the label shows, but the thumb won'),
        ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: color4,
        title: const Text(
          'Vendors',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView.builder(
            itemCount: listVendors.length,
            itemBuilder: (context, index) => Vendors(
                  ven: listVendors[index],
                )),
      ),
    );
  }
}

class Vendors extends StatelessWidget {
  final Ven ven;

  const Vendors({super.key, required this.ven});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return Venue(
                venE: ven,
              );
            },
          ));
        },
        child: Container(
          width: double.infinity,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.8),
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
                    image: AssetImage('assets/images/${ven.image}'),
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
                      ven.text,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    Text(
                      ven.title,
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Ven {
  final String image;
  final String text;
  final String title;
  final List<ElementVen> listElement;

  Ven(
      {required this.image,
      required this.text,
      required this.title,
      required this.listElement});
}

class ElementVen {
  final String imageE;
  final String textE;
  final String price;
  final String size;
  final String rate;
  final String location;
  final String about;

  ElementVen({
    required this.imageE,
    required this.textE,
    required this.price,
    required this.size,
    required this.rate,
    required this.location,
    required this.about,
  });
}
