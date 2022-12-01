import 'package:flutter/material.dart';

class DrawerTiles extends StatelessWidget {
  final IconData icon;
  final String text;
  final PageController pageController;
  final int page;

  DrawerTiles(this.icon, this.text, this.pageController, this.page);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop(); // Closes the drawer
          pageController.jumpToPage(page);
        },
        child: Container(
          height: 60.0,
          child: Row(
            children: [
              Icon(
                icon,
                size: 32.0,
                color: Colors.black,
              ),
              SizedBox(
                width: 32.0,
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    ); //Merial to visual effect
  }
}
