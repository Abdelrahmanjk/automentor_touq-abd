import 'package:flutter/material.dart';
import 'package:auto_mentorx/constants.dart';
import 'package:auto_mentorx/size_config.dart';
import '../../welcome_screen/welcome_screen.dart';
import '../components/splash_content.dart';
import '../../../components/default_button.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "title": "Discover",
      "text": "Your portal to premium car parts\n And navigate your driving experience \nwith quality, uncovering perfect solution \nfor every journey.",
      "image": "assets/images/car_intro_1.png"
    },
    {
      "title": "Perfection",
      "text": "Crafted with precision, embraced with\n passion where automotive perfection\n meets every detail.",
      "image": "assets/images/into_pic_2.png"
    },
    {
      "title": "Make it Last",
      "text": "Extend the journey. Make it last. Elevate\n your ride with enduring solutions for\n a lasting automotive experience.",
      "image": "assets/images/Starman-bro.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  title: splashData[index]['title'],
                  text: splashData[index]['text'],
                  image: splashData[index]["image"],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  //padding for the button
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children:[
                    const Spacer(),
                    //indicator
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          margin: const EdgeInsets.only(right: 5),
                          height: 8,
                          width: currentPage == index ? 30 : 6,
                          decoration: BoxDecoration(
                            color: currentPage == index
                                ? kPrimaryColor
                                : const Color(0xFFD8D8D8),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(flex: 2),
                    DefaultButton(
                      text: "Continue",
                      press: () {
                        Navigator.pushNamed(context, WelcomeScreen.routeName);
                      },
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
