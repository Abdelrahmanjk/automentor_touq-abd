import 'package:auto_mentorx/components/default_button.dart';
import 'package:auto_mentorx/screens/cars_details/audi_car_page/audi_cars.dart';
import 'package:auto_mentorx/size_config.dart';
import 'package:flutter/material.dart';

import '../../models/Cart.dart';
import '../../models/Product.dart';
import '../../screens/cart/cart_screen.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Map bmwdata =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    return Scaffold(
        backgroundColor: const Color(0xFFF5F6F9),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  bmwdata['path'],
                  width: 240,
                  height: 240,
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: getProportionateScreenWidth(20)),
              padding: EdgeInsets.only(top: getProportionateScreenWidth(20)),
              width: double.infinity,
              height: getProportionateScreenHeight(480),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        bmwdata['text'],
                        style:
                            const TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: const Text(
                              'What\s Covered ?',
                              style: TextStyle(
                                  color: Color(0xffc94335),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        bmwdata['description'],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      DefaultButton(
                        text: 'Add To Cart',
                        press: () {},
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
