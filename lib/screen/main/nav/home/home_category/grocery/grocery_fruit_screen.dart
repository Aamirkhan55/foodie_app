import 'package:flutter/material.dart';
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
                      _currentSelectedCategory == 0;
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
                      _currentSelectedCategory == 1;
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
                      _currentSelectedCategory == 2;
                    });
                  },    
                ), 
              ],
            )
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
}
