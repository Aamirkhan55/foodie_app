import 'package:flutter/material.dart';
import 'package:foodie_app/onBoarding/onBoarding_entity.dart';
import 'package:foodie_app/screen/main/main_screen.dart';
import 'package:foodie_app/theme/theme_style.dart';
import 'package:foodie_app/widgets/button_container_widgets.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<OnBoardingEntity> onBoardingData = OnBoardingEntity.onBoardingData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          itemCount: onBoardingData.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 80),
              child: Column(
                children: [
                  Image.asset("assets/word_app_logo.png"),
                  const SizedBox(height: 130),
                  Image.asset("assets/${onBoardingData[index].image}"),
                  const SizedBox(height: 40),
                  Text(
                    "${onBoardingData[index].title}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "${onBoardingData[index].description}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: index == 0 ? primaryColorED6E1B : Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: index == 1 ? primaryColorED6E1B : Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: index == 2 ? primaryColorED6E1B : Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  index == 2
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: ButtonContainerWidget (
                            title : 'Get Started',
                            hasIcon : true,
                            icon :Icons.arrow_forward_ios,
                            onTap : () => Navigator.pushAndRemoveUntil(
                              context, MaterialPageRoute(
                                builder: (contex) => const MainScreen() ), 
                                (route) => false)

                          ) 
                          )
                      : Container(),
                ],
              ),
            );
          }),
    );
  }
}
