import 'package:flutter/material.dart';
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
                       }
                       ),
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
              onTap: (){},
              ), 
          ],
        ),
      ),
    );
  }
}