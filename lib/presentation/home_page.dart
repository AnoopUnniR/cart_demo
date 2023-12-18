import 'package:cart_demo/application/bloc/cart_data_bloc.dart';
import 'package:cart_demo/core/example_data.dart';
import 'package:cart_demo/presentation/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CartPage()));
          },
          icon: const Icon(Icons.add_shopping_cart),
        )
      ]),
      body: SafeArea(
        child: GridView.builder(
          itemCount: itemsData.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            ExampleData item = itemsData[index];
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: const BoxDecoration(color: Colors.yellow),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(item.name),
                    ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<CartDataBloc>(context).add(
                            CartDataEvent.added(data: item),
                          );
                        },
                        child: const Text("Add"))
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
