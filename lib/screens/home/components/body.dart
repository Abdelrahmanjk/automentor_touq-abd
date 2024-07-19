import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../size_config.dart';


class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: getProportionateScreenHeight(40),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            spreadRadius: 0.5,
            blurRadius: 30,
            offset: const Offset(0, 5),
          ),
        ]),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          selectedItemColor: Colors.blue,
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/Shop Icon.svg",
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/icons/Heart Icon.svg"),
                label: ''),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/icons/Chat bubble Icon.svg"),
                label: ''),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/icons/User Icon.svg"),
                label: ''),
          ],
          currentIndex: currentPageIndex,
          onTap: (value) {
            setState(() {
              currentPageIndex = value;
            });
          },
        ),
      ),
      body: Container(width: 20,height: 20,color: Colors.red,),
    );
  }
}
