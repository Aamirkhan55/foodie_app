import 'package:flutter/material.dart';
import 'package:foodie_app/screen/main/nav/home/home_category/food/food_screen.dart';
import 'package:foodie_app/screen/main/nav/home/home_category/grocery/grocery_fruit_screen.dart';
import 'package:foodie_app/theme/theme_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            _homeCategoryItemWidget(
              context, 
            title: 'Grocery And Fruit', 
            description: 'Order Fresh Food For Today', 
            image: "assets/home_image_1.png",
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const GroceryFruitScreen();
              }));
            },
            ),
            const SizedBox(height: 10),
            _homeCategoryItemWidget(
            context, 
            title: "Food", 
            description: "Big Boy Burger With Spacial Kabab And Jalapino", 
            image: "assets/home_image_2.png",
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
               return const  FoodMainScreen();
            })),
            )
          ],
        ),
      ),
    );
  }

 Widget _homeCategoryItemWidget(BuildContext context,
      {required String? title,
      required String? description,
      required String? image,
      VoidCallback? onTap,
      }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 0.20,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              blurRadius: 5.5,
              spreadRadius: 1.5,
              offset: const Offset(0, 1),
              color: Colors.grey[350]!,
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      title!,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      description!,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[700]!,
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset(image!),
            ],
          ),
        ),
      ),
    );
  }
}
