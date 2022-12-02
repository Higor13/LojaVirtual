import 'package:flutter/material.dart';
import 'package:lojavirtual/data/product_data.dart';

class ProductScreen extends StatefulWidget {
  // const ProductScreen({ super.key });

  final ProductData product;

  ProductScreen(this.product);

  @override
  State<ProductScreen> createState() => _ProductScreenState(product);
}

class _ProductScreenState extends State<ProductScreen> {
  final ProductData product;

  _ProductScreenState(this.product);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
