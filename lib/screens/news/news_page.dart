
import 'package:flutter/material.dart';
import '../../components/coustom_bottom_nav_bar.dart';
import '../../enums.dart';
import 'components/body.dart';


class NewsScreen extends StatelessWidget {
  static String routeName = "/news";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NewsBody(),

    );
  }
}
