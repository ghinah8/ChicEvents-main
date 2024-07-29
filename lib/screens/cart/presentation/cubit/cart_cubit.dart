import 'package:bloc/bloc.dart';

import '../../../../core/models/product_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState());
  addToCart(PackageModel package) {
    emit(state.copyWith(products: List.of(state.products)..add(package)));
  }

  removeFromCart(PackageModel package) {
    emit(state.copyWith(products: List.of(state.products)..remove(package)));
  }
}
