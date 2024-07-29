import 'package:chic_events/core/models/category_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PackageModel {
  final dynamic id;
  final dynamic image;
  final dynamic price;
  final dynamic rate;
  final dynamic capacity;
  final dynamic name;
  final CategoryModel? category;
  PackageModel({
    required this.id,
    required this.image,
    required this.price,
    required this.rate,
    required this.capacity,
    required this.name,
    this.category,
  });

  factory PackageModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc,
      DocumentSnapshot<Map<String, dynamic>> category) {
    Map<String, dynamic> data = doc.data()!;
    return PackageModel(
        id: doc.id,
        name: data['name'],
        image: data['image'],
        capacity: data['capacity'],
        category: CategoryModel.fromFirestore(category),
        rate: data['rate'],
        price: data['price']);
  }
}
