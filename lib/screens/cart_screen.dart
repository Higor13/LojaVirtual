import 'package:flutter/material.dart';
import 'package:lojavirtual/models/cart_model.dart';
import 'package:scoped_model/scoped_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Carrinho'),
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 8.0),
            child: ScopedModelDescendant<CartModel>(
                builder: ((context, child, model) {
              int p = model.products.length;
              return Text('${p ?? 0} ${p == 1 ? "ITEM" : "ITENS"}');
            })),
          ),
        ],
      ),
      body: Container(),
    );
  }
}
