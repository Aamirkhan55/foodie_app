import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie_app/auth/sign_up.dart';
import 'package:foodie_app/screen/premium/premium_screen.dart';
import 'package:foodie_app/theme/theme_style.dart';
import 'package:foodie_app/widgets/button_container_widgets.dart';
import 'package:foodie_app/widgets/form_container_widget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _rememberMeCheckValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 100),
            const Text(
              'Sign In',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const FormContainerWidget(hintText: 'Email or Username'),
            const SizedBox(height: 20),
            const FormContainerWidget(hintText: 'Password'),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                        value: _rememberMeCheckValue,
                        onChanged: (value) {
                          setState(() {
                            _rememberMeCheckValue = value!;
                          });
                        }),
                    const Text(
                      'Remember me',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                const Text(
                  'Forgot Password',
                  style: TextStyle(
                    fontSize: 14,
                    color: primaryColorED6E1B,
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            ButtonContainerWidget(
              title: 'Sign In',
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PremiumScreen()),
                    (route) => false);
              },
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                    child: Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.black,
                )),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text('or'),
                ),
                Expanded(
                    child: Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.black,
                )),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _signInOption(
                  icon: FontAwesomeIcons.google,
                  color: redColor,
                ),
                const SizedBox(width: 10),
                _signInOption(
                  icon: FontAwesomeIcons.facebook,
                  color: Colors.blue.shade600,
                ),
                const SizedBox(width: 10),
                _signInOption(
                  icon: FontAwesomeIcons.linkedin,
                  color: Colors.blue.shade300,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account ?",
                  style: TextStyle(fontSize: 15),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpPage()),
                        (route) => false);
                  },
                  child: const Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 15,
                      color: primaryColorED6E1B,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  _signInOption({required IconData icon, required Color color}) {
    Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      child: Center(
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
