import 'package:cart_demo/application/bloc/cart_data_bloc.dart';
import 'package:cart_demo/core/example_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<CartDataBloc, CartDataState>(
        builder: (context, state) {
          if (state.data.isEmpty) {
            return const Center(
              child: Text("No data in cart"),
            );
          }
          return SafeArea(
              child: GridView.builder(
            itemCount: state.data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              ExampleData item = state.data[index];
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.yellow),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(item.name),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.add_circle_outline),
                            onPressed: () {
                              BlocProvider.of<CartDataBloc>(context)
                                  .add(CartDataEvent.increment(data: item));
                            },
                          ),
                          Text(item.count.toString()),
                          IconButton(
                            icon: const Icon(Icons.remove_circle_outline),
                            onPressed: () {
                              BlocProvider.of<CartDataBloc>(context).add(
                                CartDataEvent.decrement(data: item),
                              );
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ));
        },
      ),
    );
  }
}
