import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

mixin HandlingError {
  Future<Either<String, T>> handleError<T>(
      {required Future<Right<String, T>> Function() tryCall}) async {
    try {
      return await tryCall.call();
    } on FirebaseException catch (e) {
      log(e.message ?? '');
      return Left(e.message ?? '');
    } catch (e) {
      log(e.toString());
      return Left(e.toString());
    }
  }
}