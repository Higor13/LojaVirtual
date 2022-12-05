import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';

class ProductData {
  late String category;
  late String id;
  late String title;
  late String description;
  late double price;
  late List images;
  late List size;

  ProductData.fromDocument(DocumentSnapshot snapshot) {
    id = snapshot.id;
    title = snapshot['title'];
    description = snapshot['description'];
    price = snapshot['price'];
    images = snapshot['images'];
    size = snapshot['size'];
  }

  Map<String, dynamic> toResumeMap() {
    return {
      'title': title,
      'description': description,
      'price': price,
    };
  }
}
