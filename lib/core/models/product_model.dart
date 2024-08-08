import 'package:chic_events/core/models/category_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PackageModel {
  final String? id;
  final String? image;
  final num? price;
  final num? rate;
  final num? capacity;
  final String? name;
  final CategoryModel? category;
  PackageModel({
    this.id,
    this.image,
    this.price,
    this.rate,
    this.capacity,
    this.name,
    this.category,
  });

  factory PackageModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc,
      DocumentSnapshot<Map<String, dynamic>>? category) {
    Map<String, dynamic> data = doc.data()!;
    return PackageModel(
        id: doc.id,
        name: data['name'],
        image: data['image'],
        capacity: data['capacity'],
        category:
            category != null ? CategoryModel.fromFirestore(category) : null,
        rate: data['rate'],
        price: data['price']);
  }
}
