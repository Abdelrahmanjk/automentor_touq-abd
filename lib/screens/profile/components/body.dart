import 'package:auto_mentorx/screens/about_us/about_us_screen.dart';
import 'package:auto_mentorx/screens/edit_profile/edit_profile.dart';
import 'package:auto_mentorx/screens/sign_in/components/sign_form.dart';
import 'package:auto_mentorx/screens/sign_in/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  final ProfileDetailsModel profileDetailsModel;

  Body({
    super.key,
    required this.profileDetailsModel,
  });

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(profileDetailsModel: profileDetailsModel,),
          SizedBox(height: 20),
          ProfileMenu(
            text: "Edit Profile",
            icon: "assets/icons/User Icon.svg",
            press: () => {
              Navigator.pushNamed(context, EditProfile.routeName,
                  arguments: {'profileDetailsModel': profileDetailsModel})
            },
          ),
          ProfileMenu(
            text: "My Orders",
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),

          ProfileMenu(
            text: "About Us",
            icon: "assets/icons/Question mark.svg",
            press: () {
              Navigator.pushNamed(context, AboutUs.routeName);
            },
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () async {
              await _auth.signOut();
              Navigator.pushNamed(context, SignInScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
