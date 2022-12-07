import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lojavirtual/models/cart_model.dart';

class DiscountCard extends StatelessWidget {
  const DiscountCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      // ExpansionTile add arrow down icon to expand the card
      child: ExpansionTile(
        title: Text(
          'Cupom de Desconto',
          textAlign: TextAlign.start,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.grey[700],
          ),
        ),
        leading: const Icon(Icons.card_giftcard),
        trailing: const Icon(Icons.add),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Digite seu cupom de desconto',
              ),
              initialValue: CartModel.of(context).couponCode ?? '',
              onFieldSubmitted: (text) {
                FirebaseFirestore.instance
                    .collection('coupons')
                    .doc(text)
                    .get()
                    .then((docSnap) {
                  if (docSnap.exists) {
                    CartModel.of(context).setCoupon(text, docSnap['percent']);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content:
                          Text('Desconto de ${docSnap["percent"]} % aplicado!'),
                      backgroundColor: Theme.of(context).primaryColor,
                      duration: const Duration(seconds: 3),
                    ));
                  } else {
                    CartModel.of(context).setCoupon(null, 0);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Cupom inválido!'),
                      backgroundColor: Colors.redAccent,
                      duration: Duration(seconds: 3),
                    ));
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
