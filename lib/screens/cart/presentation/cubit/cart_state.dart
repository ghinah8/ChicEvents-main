part of 'cart_cubit.dart';

class CartState {
  final List<PackageModel> products;
  const CartState({
    this.products = const [],
  });

  CartState copyWith({
    List<PackageModel>? products,
  }) {
    return CartState(
      products: products ?? this.products,
    );
  }
}
