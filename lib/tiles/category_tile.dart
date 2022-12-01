import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  // const CategoryTile({super.key});

  final DocumentSnapshot snapshot;

  CategoryTile(this.snapshot); //  To receive category's tile

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // Left icon
      leading: CircleAvatar(
        radius: 20.0,
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(snapshot['icon']),
      ),
      title: Text(snapshot['title']),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () {}, // End arrow
    );
  }
}
