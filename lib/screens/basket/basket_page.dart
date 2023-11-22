import 'package:flutter/material.dart';
import 'package:onlineshop/core/widgets/text_widget.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.pinkAccent,

        title: TextForAppBar(title: "Basket", fs: 28.0),
      ),
    );
  }
}