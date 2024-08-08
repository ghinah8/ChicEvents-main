import 'package:bloc/bloc.dart';
import 'package:chic_events/core/firestore/firestore_database.dart';
import 'package:chic_events/core/helper/toaster.dart';

import '../../../../core/models/product_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState());
  addToCart(PackageModel package) {
    emit(state.copyWith(products: List.of(state.products)..add(package)));
  }

  sendEvent(DateTime date) async {
    Toaster.showLoading();
    final result = await FirestoreDatabase().sendEvent(state.products, date);
    result.fold((l) {
      Toaster.showToast(l);
    }, (r) {
      Toaster.showToast('Sent Succesfully');
      emit(const CartState());
    });
    Toaster.closeLoading();
  }

  removeFromCart(PackageModel package) {
    emit(state.copyWith(products: List.of(state.products)..remove(package)));
  }
}
