import 'package:auto_mentorx/manual_details/components/body.dart';
import 'package:auto_mentorx/manual_details/components/custom_app_bar.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  static String routeName = "/cardetails";

  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomAppBar(),
      body: Body(),
    );
  }
}
