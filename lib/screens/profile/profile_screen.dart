import 'package:auto_mentorx/screens/sign_in/components/sign_form.dart';
import 'package:flutter/material.dart';
import 'package:auto_mentorx/size_config.dart';

import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required this.profileDetailsModel});

  final ProfileDetailsModel profileDetailsModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Profile",
          style: TextStyle(
              fontSize: getProportionateScreenWidth(25),
              fontWeight: FontWeight.bold,
            fontFamily: 'Poppins'
          ),
        ),
      ),
      body: Body(profileDetailsModel: profileDetailsModel,
      ),
    );
  }
}
