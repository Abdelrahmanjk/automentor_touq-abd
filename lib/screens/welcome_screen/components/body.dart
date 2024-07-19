import 'package:auto_mentorx/screens/sign_in/sign_in_screen.dart';
import 'package:auto_mentorx/screens/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:auto_mentorx/components/default_button.dart';
import 'package:auto_mentorx/screens/home/home_screen.dart';
import 'package:auto_mentorx/size_config.dart';

import '../../../components/coustom_bottom_nav_bar.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe87121),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight * 0.09),
            Text(
              "Let\'s Get Started",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(30),
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
              child: Container(
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Image.asset(
                  "assets/images/AutoMentorX-logo.png",
                  height: SizeConfig.screenHeight * 0.35,
                ),
              ),
            ),
            //SizedBox(height: SizeConfig.screenHeight * 0.08),
            Container(
              child: Image.asset(
                'assets/images/clouds.png',
              ),
            ),
            Stack(
              children: [
                Container(
                    color: Colors.white,
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHeight * 0.24),
                Positioned(
                  left: 80,
                  top: 10,
                  child: SizedBox(
                    width: SizeConfig.screenWidth * 0.6,
                    child: DefaultButton(
                      text: "Sign Up",
                      press: () {
                        Navigator.pushNamed(context, SignUpScreen.routeName);
                      },
                    ),
                  ),
                ),
                Positioned(
                  left: 80,
                  top: 85,
                  child: SizedBox(
                    width: SizeConfig.screenWidth * 0.6,
                    child: DefaultButton(
                      text: "Sign In",
                      press: () {
                        Navigator.pushNamed(context, SignInScreen.routeName);
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 160,
                  left: 125,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, CustomBottomNavBar.routName,
                          arguments: {'type': 'guest'});
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'CONTINUE AS A ',
                        style: TextStyle(color: Colors.grey[400]),
                        children: const [
                          TextSpan(
                              text: 'GUEST',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Color(0xffe87121),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
