import 'package:auto_mentorx/manual_details/detail_manual_screen.dart';
import 'package:auto_mentorx/screens/about_us/about_us_screen.dart';
import 'package:auto_mentorx/screens/categories_pages/parts.dart';
import 'package:auto_mentorx/screens/edit_profile/edit_profile.dart';
import 'package:auto_mentorx/screens/favourite_screen/fav_items.dart';
import 'package:auto_mentorx/screens/home/components/notification.dart';
import 'package:auto_mentorx/screens/news/news_page.dart';
import 'package:auto_mentorx/screens/welcome_screen/welcome_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:auto_mentorx/screens/cart/cart_screen.dart';
import 'package:auto_mentorx/screens/categories_pages/bikes_page.dart';
import 'package:auto_mentorx/screens/categories_pages/cars_page.dart';
import 'package:auto_mentorx/screens/categories_pages/classic_page.dart';
import 'package:auto_mentorx/screens/complete_profile/complete_profile_screen.dart';
import 'package:auto_mentorx/screens/details/details_screen.dart';
import 'package:auto_mentorx/screens/forgot_password/forgot_password_screen.dart';
import 'package:auto_mentorx/screens/home/home_screen.dart';
import 'package:auto_mentorx/screens/otp/otp_screen.dart';
import 'package:auto_mentorx/screens/profile/profile_screen.dart';
import 'package:auto_mentorx/screens/sign_in/sign_in_screen.dart';
import 'package:auto_mentorx/screens/splash/splash_screen.dart';

import 'components/coustom_bottom_nav_bar.dart';
import 'screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  BikesPage.routeName: (context) => BikesPage(),
  CarsPage.routeName: (context) => const CarsPage(),
  ClassicCarsPage.routeName: (context) => ClassicCarsPage(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => const CartScreen(),
   PartsPage.routeName:(context) => PartsPage(),
  NewsScreen.routeName:(context) => NewsScreen(),
  DetailScreen.routeName:(context) => DetailScreen(),
  ClassicCarsPage.routeName:(context) => ClassicCarsPage(),
  FavItems.routeName:(context)=>FavItems(),
  CustomBottomNavBar.routName:(context) => CustomBottomNavBar(),
  EditProfile.routeName:(context) => EditProfile(),
  AboutUs.routeName:(context) => AboutUs()
  // NotificationScreen.routeName:(context) => NotificationScreen()
};
