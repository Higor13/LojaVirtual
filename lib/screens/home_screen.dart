import 'package:flutter/material.dart';
import 'package:lojavirtual/tabs/home_tab.dart';

class HomeScreen extends StatelessWidget {
  // const HomeScreen({super.key});

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        HomeTab(),
      ],
    );
  }
}
