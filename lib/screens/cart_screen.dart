import 'package:flutter/material.dart';
import 'package:lojavirtual/models/cart_model.dart';
import 'package:lojavirtual/models/user_model.dart';
import 'package:lojavirtual/screens/login_screen.dart';
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
            alignment: Alignment.center,
            child: ScopedModelDescendant<CartModel>(
                builder: ((context, child, model) {
              int p = model.products.length;
              return Text(
                '${p ?? 0} ${p == 1 ? "ITEM" : "ITENS"}',
                style: const TextStyle(fontSize: 17.0),
              );
            })),
          ),
        ],
      ),
      body: ScopedModelDescendant<CartModel>(
        builder: (context, child, model) {
          if (model.isLoading && UserModel.of(context).isLoggedIn()) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (!UserModel.of(context).isLoggedIn()) {
            return Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.stretch, // Preencer todo espaço possível
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.remove_shopping_cart,
                    size: 80.0,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Faça o login para adicionar produtos!',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: (() {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => LoginScreen())));
                    }),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    child: const Text(
                      'Entrar',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          } else if (model.products == null || model.products.length == 0) {
            return const Center(
              child: Text(
                'Nenhum produto no carrinho!',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
