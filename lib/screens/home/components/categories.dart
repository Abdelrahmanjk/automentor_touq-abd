import 'package:auto_mentorx/screens/categories_pages/parts.dart';
import 'package:flutter/material.dart';
import 'package:auto_mentorx/screens/categories_pages/bikes_page.dart';
import 'package:auto_mentorx/screens/categories_pages/cars_page.dart';
import 'package:auto_mentorx/screens/categories_pages/classic_page.dart';


import '../../../size_config.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/images/Car_.png", "text": "Cars"},
      {"icon": "assets/images/bike.png", "text": "Bikes"},
      {"icon": "assets/images/classiccar.png", "text": "Classic\nCars"},
      {"icon": "assets/images/spare-parts.png", "text": "Parts"},
    ];
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
            icon: categories[index]["icon"],
            text: categories[index]["text"],
            press: () {
              if (categories[index]["text"] == 'Cars') {
                Navigator.pushNamed(context, CarsPage.routeName);
              } else if (categories[index]["text"] == 'Bikes') {
                Navigator.pushNamed(context, BikesPage.routeName);
              } else if (categories[index]["text"] == 'Classic\nCars') {
                Navigator.pushNamed(context, ClassicCarsPage.routeName);
              } else if (categories[index]["text"] == 'Parts') {
                Navigator.pushNamed(context, PartsPage.routeName);
              }
            },
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.icon,
    required this.text,
    required this.press,
  });

  final String? icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              height: getProportionateScreenWidth(55),
              width: getProportionateScreenWidth(55),
              decoration: BoxDecoration(
                color: const Color(0xFFe87121),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(icon!,fit: BoxFit.contain,),
            ),
            const SizedBox(height: 5),
            Text(text!, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
