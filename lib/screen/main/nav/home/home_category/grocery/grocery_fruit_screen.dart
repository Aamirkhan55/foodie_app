import 'package:flutter/material.dart';
import 'package:foodie_app/data/food_data.dart';
import 'package:foodie_app/screen/main/nav/home/home_category/grocery/food_details.dart';
import 'package:foodie_app/screen/search/search_screen.dart';
import 'package:foodie_app/theme/theme_style.dart';
import 'package:foodie_app/widgets/search_widget.dart';

class GroceryFruitScreen extends StatefulWidget {
  const GroceryFruitScreen({super.key});

  @override
  State<GroceryFruitScreen> createState() => _GroceryFruitScreenState();
}

class _GroceryFruitScreenState extends State<GroceryFruitScreen> {

  int _currentSelectedCategory = 0;

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
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: SearchWidget(onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchScreen()));
                  }),
                ),
                const SizedBox(width: 10),
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: primaryColorED6E1B,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                      child: Icon(
                    Icons.settings_voice,
                    color: whiteColor,
                  )),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              'Categories',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _singleCategoryItemWidget(
                  title: 'Fruits',
                  color: _currentSelectedCategory == 0
                      ? primaryColorED6E1B
                      : Colors.grey[400],
                  onTap: () {
                    setState(() {
                      _currentSelectedCategory = 0;
                    });
                  },
                ),
                _singleCategoryItemWidget(
                  title: 'Vegetables',
                  color: _currentSelectedCategory == 1
                      ? primaryColorED6E1B
                      : Colors.grey[400],
                  onTap: () {
                    setState(() {
                      _currentSelectedCategory = 1;
                    });
                  },
                ),
                _singleCategoryItemWidget(
                  title: 'Kitchen',
                  color: _currentSelectedCategory == 2
                      ? primaryColorED6E1B
                      : Colors.grey[400],
                  onTap: () {
                    setState(() {
                      _currentSelectedCategory = 2;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            _switchCategoryOnSelectedIndex(_currentSelectedCategory)
          ],
        ),
      ),
    );
  }

  Widget _singleCategoryItemWidget(
      {VoidCallback? onTap, Color? color, String? title}) {
    return Expanded(
        child: GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        width: 110,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            title!,
            style: const TextStyle(
              color: whiteColor,
            ),
          ),
        ),
      ),
    ));
  }

  _switchCategoryOnSelectedIndex(int index) {
    switch (index) {
      case 0:
        {
          return _buildFruitGridView();
        }
      case 1:
        {
          return _buildVegetableGridView();
        }
      case 2:
        {
          return _buildKitchenGridView();
        }
    }
  }

  _buildFruitGridView() {
    return Expanded(
        child: GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 0.8),
      children: FRUIT_CATEGORY_LIST.map((fruit) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FoodDetailsScreen(data: fruit)));
          },
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/${fruit['image']}",
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 20,
                      right: 20,
                      child: Container(
                        width: 40,
                        height: 20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: redColor),
                        child: Center(
                          child: Text(
                            "${fruit['price']}",
                            style: const TextStyle(color: whiteColor),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Text("${fruit['title']}")
            ],
          ),
        );
      }).toList(),
    ));
  }

  _buildVegetableGridView() {
   return Expanded(
        child: GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 0.8),
      children: VEGETABLES_CATEGORY_LIST.map((vegetable) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FoodDetailsScreen(data: vegetable)));
          },
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/${vegetable['image']}",
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 20,
                      right: 20,
                      child: Container(
                        width: 40,
                        height: 20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: redColor),
                        child: Center(
                          child: Text(
                            "${vegetable['price']}",
                            style: const TextStyle(color: whiteColor),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Text("${vegetable['title']}")
            ],
          ),
        );
      }).toList(),
    ));
  }

  _buildKitchenGridView() {
    return Expanded(
        child: GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 0.8),
      children: KITCHEN_CATEGORY_LIST.map((kitchen) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FoodDetailsScreen(data: kitchen)));
          },
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/${kitchen['image']}",
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 20,
                      right: 20,
                      child: Container(
                        width: 40,
                        height: 20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: redColor),
                        child: Center(
                          child: Text(
                            "${kitchen['price']}",
                            style: const TextStyle(color: whiteColor),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Text("${kitchen['title']}")
            ],
          ),
        );
      }).toList(),
    ));
  }
}
