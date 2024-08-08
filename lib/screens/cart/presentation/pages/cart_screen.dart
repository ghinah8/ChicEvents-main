import 'package:chic_events/screens/cart/presentation/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: state.products.isNotEmpty
              ? FloatingActionButton(
                  onPressed: () async {
                    showDatePicker(
                            context: context,
                            firstDate: DateTime.now(),
                            lastDate: DateTime.utc(2025))
                        .then((e) {
                      if (e != null) {
                        showTimePicker(
                                context: context, initialTime: TimeOfDay.now())
                            .then((r) {
                          if (r != null) {
                            context.read<CartCubit>().sendEvent(DateTime(
                                e.year, e.month, e.day, r.hour, r.minute));
                          }
                        });
                      }
                    });
                  },
                  child: const Icon(Icons.send),
                )
              : null,
          body: Container(
            child: state.products.isEmpty
                ? const Center(
                    child: Text(
                        'There IS Nothing In Your Cart Please Add Some Products'),
                  )
                : Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ListView.builder(
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                leading: Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle),
                                  child: FadeInImage.assetNetwork(
                                    image: state.products[index].image ?? '',
                                    placeholder: 'assets/images/11.jpg',
                                    imageErrorBuilder:
                                        (context, error, stackTrace) =>
                                            Image.asset(
                                      'assets/images/11.jpg',
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.fill,
                                    ),
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                title: Text(state.products[index].name ?? ''),
                                subtitle: Text(
                                    state.products[index].price.toString()),
                                trailing: OutlinedButton(
                                    onPressed: () {
                                      context.read<CartCubit>().removeFromCart(
                                          state.products[index]);
                                    },
                                    style: OutlinedButton.styleFrom(
                                        shape: const CircleBorder()),
                                    child: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    )),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ),
        );
      },
    );
  }
}
