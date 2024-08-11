import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  final String? id;
  final String? image;
  final String? name;
  final String? description;
  CategoryModel({
    this.id,
    this.image,
    this.name,
    this.description,
  });
  factory CategoryModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    Map<String, dynamic> data = doc.data()!;
    return CategoryModel(
      id: doc.id,
      name: data['name'],
      image: data['image'],
      description: data['description'],
    );
  }
}
