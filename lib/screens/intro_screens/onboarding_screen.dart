// import 'package:auto_mentorx/Screens/Home_Screen/home_page.dart';
// import 'package:auto_mentorx/Screens/intro_screens/intro_page_1.dart';
// import 'package:auto_mentorx/Screens/intro_screens/intro_page_2.dart';
// import 'package:auto_mentorx/Screens/intro_screens/intro_page_3.dart';
// import 'package:auto_mentorx/Screens/Welcome%20Screen/welcome_page.dart';
// import '../../size_config.dart';
// import 'package:flutter/material.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class OnBoardingScreen extends StatefulWidget {
//   const OnBoardingScreen({super.key});

//   @override
//   State<OnBoardingScreen> createState() => _OnBoardingScreenState();
// }

// class _OnBoardingScreenState extends State<OnBoardingScreen> {
//   //controller to keep track of wich page we're in
//   PageController _controller = PageController();
//   //keep track of if we are on the last page or not
//   bool onLastPage = false;
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init;
//     return Scaffold(
//       body: Stack(
//         children: [
//           PageView(
//             controller: _controller,
//             onPageChanged: (index) {
//               setState(() {
//                 onLastPage = (index == 2);
//               });
//             },
//             children: [
//               IntroPage1(),
//               IntroPage2(),
//               IntroPage3(),
//             ],
//           ),
//           // dot indicators
//           Container(
//             alignment: Alignment(0, 0.90),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 //skip
//                 GestureDetector(
//                     onTap: () {
//                       _controller.jumpToPage(2);
//                     },
//                     child: Text(
//                       'Skip',
//                       style: TextStyle(
//                           color: Colors.grey[400],
//                           decoration: TextDecoration.underline),
//                     )),

//                 //dot indicator
//                 SmoothPageIndicator(
//                     effect: ExpandingDotsEffect(
//                         dotColor: Color(0xFFf3f3f3),
//                         activeDotColor: Color(0xFFE87121),
//                         dotHeight: 15,
//                         dotWidth: 15),
//                     controller: _controller,
//                     count: 3),

//                 //next or done
//                 onLastPage
//                     ? GestureDetector(
//                         onTap: () {
//                           Navigator.push(context,
//                               MaterialPageRoute(builder: (context) {
//                             return WelcomePage();
//                           }));
//                         },
//                         child: Text(
//                           'Done',
//                           style: TextStyle(fontFamily: 'Poppins'),
//                         ))
//                     : GestureDetector(
//                         onTap: () {
//                           _controller.nextPage(
//                               duration: Duration(milliseconds: 200),
//                               curve: Curves.easeIn);
//                         },
//                         child: Text(
//                           'Next',
//                           style: TextStyle(fontFamily: 'Poppins'),
//                         )),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
