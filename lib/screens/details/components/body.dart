import 'package:auto_mentorx/models/Cart.dart';
import 'package:auto_mentorx/screens/cart/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:auto_mentorx/components/default_button.dart';
import 'package:auto_mentorx/models/Product.dart';
import 'package:auto_mentorx/size_config.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatefulWidget {
  final Product product;
  const Body({Key? key, required this.product}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImages(product: widget.product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProductDescription(
                  product: widget.product,
                  pressOnSeeMore: () {},
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: SizeConfig.screenWidth * 0.15,
                      right: SizeConfig.screenWidth * 0.15,
                      bottom: getProportionateScreenWidth(110),
                      top: getProportionateScreenWidth(60),
                    ),
                    child: DefaultButton(
                      text: "Add To Cart",
                      press: () {
                        demoCarts.add(Cart(product: widget.product, numOfItem: 1));
                        Navigator.pushNamed(context, CartScreen.routeName);
                        setState(() {

                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
