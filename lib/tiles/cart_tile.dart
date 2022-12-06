import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lojavirtual/data/cart_product.dart';
import 'package:lojavirtual/data/product_data.dart';

class CartTile extends StatelessWidget {
  // const CartTile({ super.key });

  final CartProduct cartProduct;
  CartTile(this.cartProduct);

  @override
  Widget build(BuildContext context) {
    Widget _buildContent() {
      return Container();
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: cartProduct.productData == null
          ? // Se não tivermos os dados do produto
          FutureBuilder<DocumentSnapshot>(
              // Obter os dados
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  cartProduct.productData = ProductData.fromDocument(
                      snapshot.data!); // Salvas os dados para usar depois
                  return _buildContent(); //  Mostrar o conteúdo do produto
                } else {
                  return Container(
                    height: 70.0,
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(),
                  );
                }
              }),
              future: FirebaseFirestore.instance
                  .collection('products')
                  .doc(cartProduct.category)
                  .collection('items')
                  .doc(cartProduct.pid)
                  .get(),
            )
          : _buildContent(),
    );
  }
}
