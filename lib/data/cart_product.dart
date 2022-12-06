import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lojavirtual/data/product_data.dart';

class CartProduct {
  String? cid;
  String? category;
  String? pid;
  int? quantity;
  String? size;

  ProductData? productData;

  CartProduct();

  // Recebe todos os produtos do carrinho e transforma em um CartProduct
  CartProduct.fromDocument(DocumentSnapshot document) {
    cid = document.id;
    category = document['category'];
    pid = document['pid'];
    quantity = document['quantity'];
    size = document['size'];
  }

  // Transformando em mapa para adc ao db
  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'pid': pid,
      'quantity': quantity,
      'size': size,
      // 'product': productData
      //     ?.toResumeMap(), // para mostrar apenas alguns dados do produto
    };
  }
}
