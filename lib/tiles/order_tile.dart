import 'package:flutter/material.dart';

class OrderTile extends StatelessWidget {
  final String orderId;
  const OrderTile(this.orderId, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(orderId),
    );
  }
}
