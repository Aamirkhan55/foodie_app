import 'package:flutter/material.dart';
import 'package:foodie_app/theme/theme_style.dart';

class GroceryFruitScreen extends StatefulWidget {
  const GroceryFruitScreen({super.key});

  @override
  State<GroceryFruitScreen> createState() => _GroceryFruitScreenState();
}

class _GroceryFruitScreenState extends State<GroceryFruitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}