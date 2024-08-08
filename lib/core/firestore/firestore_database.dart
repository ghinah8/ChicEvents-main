import 'package:chic_events/core/firestore/handling_error.dart';
import 'package:chic_events/core/helper/toaster.dart';
import 'package:chic_events/core/models/category_model.dart';
import 'package:chic_events/core/models/order_model.dart';
import 'package:chic_events/core/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreDatabase with HandlingError {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<Either<String, List<CategoryModel>>> getCategories() async {
    return handleError(tryCall: () async {
      final result = await db.collection('categories').get();
      final List<CategoryModel> list =
          List<CategoryModel>.generate(result.docs.length, (index) {
        return CategoryModel.fromFirestore(result.docs[index]);
      });
      return Right(list);
    });
  }

  Future<Either<String, void>> sendFeedBack(
      String name, String email, String message) async {
    return handleError(tryCall: () async {
      await db
          .collection('feedback')
          .add({'name': name, 'email': email, 'message': message});
      return Right(Future.value());
    });
  }

  Future<List<PackageModel>> fetchPackages(
      List<DocumentReference<Map<String, dynamic>>> packageRefs) async {
    List<PackageModel> packages = [];

    for (DocumentReference<Map<String, dynamic>> ref in packageRefs) {
      DocumentSnapshot<Map<String, dynamic>> doc = await ref.get();
      // Fetch the category document

      packages.add(PackageModel.fromFirestore(doc, null));
    }

    return packages;
  }

  Future<Either<String, List<OrderModel>>> getOrders() async {
    return handleError(tryCall: () async {
      print(FirebaseAuth.instance.currentUser?.uid);

      final result = await db
          .collection('orders')
          .where('user',
              isEqualTo: db
                  .collection('users')
                  .doc(FirebaseAuth.instance.currentUser?.uid))
          .get();
      List<OrderModel> orders = [];
      List<PackageModel> products = [];
      for (var s in result.docs) {
        for (var element in s.data()['products']) {
          products.add(PackageModel.fromFirestore(await element.get(), null));
        }

        orders.add(OrderModel.fromFirestore(s, products));
        products = [];
      }

      return Right(orders);
    });
  }

  Future<Either<String, Map<String, dynamic>?>> getProfile() async {
    return handleError(tryCall: () async {
      final result = await db
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      return Right(result.data());
    });
  }

  Future<Either<String, void>> sendEvent(
      List<PackageModel> products, DateTime date) async {
    return handleError(tryCall: () async {
      print(FirebaseAuth.instance.currentUser!.uid);
      final result = await db.collection('orders').add({
        'products': products.map((e) {
          print(e.id);
          return db.collection('packages').doc(e.id);
        }).toList(),
        'user':
            db.collection('users').doc(FirebaseAuth.instance.currentUser!.uid),
        'status': 1,
        'date': Timestamp.fromDate(date),
        'total': products.fold<num>(
            0, (total, element) => total + (element.price ?? 0)),
      });
      Toaster.showToast('Created Succesfful');
      return Right(Future.value());
    });
  }

  Future<Either<String, void>> setProfile(
      String email, String userName, String phone) async {
    return handleError(tryCall: () async {
      db
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({'email': email, 'userName': userName, 'phone': phone});
      return Right(Future.value());
    });
  }

  Future<Either<String, dynamic>> getMyOrders() async {
    return handleError(tryCall: () async {
      return Right(await FirebaseAuth.instance.currentUser!.getIdToken());
    });
  }

  Future<Either<String, List<PackageModel>>> getProducts() async {
    return handleError(tryCall: () async {
      final result = await db.collection('packages').get();
      final DocumentReference<Map<String, dynamic>> categoryS =
          result.docs.first.data()['category'];
      final DocumentSnapshot<Map<String, dynamic>> category =
          await categoryS.get();
      final List<PackageModel> list =
          List<PackageModel>.generate(result.docs.length, (index) {
        return PackageModel.fromFirestore(result.docs[index], category);
      });
      return Right(list);
    });
  }

  Future<Either<String, List<PackageModel>>> getProductsByCategory(
      String categoryId) async {
    return handleError(tryCall: () async {
      print(categoryId);
      final result = await db
          .collection('packages')
          .where('category',
              isEqualTo:
                  (await db.collection('categories').doc(categoryId).get())
                      .reference)
          .get();
      if (result.docs.isNotEmpty) {
        final DocumentReference<Map<String, dynamic>> categoryS =
            result.docs.first.data()['category'];

        final DocumentSnapshot<Map<String, dynamic>> category =
            await categoryS.get();
        final List<PackageModel> list =
            List<PackageModel>.generate(result.docs.length, (index) {
          return PackageModel.fromFirestore(result.docs[index], category);
        });
        return Right(list);
      } else {
        return const Right([]);
      }
    });
  }
}
