import 'package:chic_events/core/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  final Timestamp date;
  final List<PackageModel>? products;
  final int total;
  final DocumentReference? user;
  final int status;

  OrderModel({
    required this.date,
    required this.products,
    required this.total,
    required this.user,
    required this.status,
  });

  // Factory method to create an Order instance from a Firestore document
  factory OrderModel.fromFirestore(
      DocumentSnapshot doc, List<PackageModel> products) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return OrderModel(
      date: data['date'],
      products: products,
      total: data['total'],
      user: data['user'],
      status: data['status'],
    );
  }

  // Method to convert an Order instance to a Firestore document
  Map<String, dynamic> toFirestore() {
    return {
      'date': date,
      'products': products,
      'total': total,
      'user': user,
      'status': status,
    };
  }
}
