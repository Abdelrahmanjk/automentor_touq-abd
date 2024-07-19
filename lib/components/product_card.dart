import 'package:flutter/material.dart';
import 'package:auto_mentorx/models/Product.dart';
import 'package:auto_mentorx/screens/details/details_screen.dart';

import '../constants.dart';
import '../size_config.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.product, required this.favourite,
  });

  final double width, aspectRetio;
  final Product product;
  final int favourite ;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(widget.width),
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(
            context,
            DetailsScreen.routeName,
            arguments: ProductDetailsArguments(product: widget.product),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Hero(
                    tag: widget.product.id.toString(),
                    child: Image.asset(widget.product.images[0]),
                  ),
                ),
              ),
              const SizedBox(height:10,),
              Text(
                widget.product.title,
                style: TextStyle(color: Colors.black),
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${widget.product.price}",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        isFav[widget.favourite] =!isFav[widget.favourite];
                      });

                    },
                    child: Container(
                      width: getProportionateScreenWidth(30),
                      height: getProportionateScreenHeight(30),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isFav[widget.favourite]?
                            Color(0xFFFFE6E6):
                            Colors.grey.shade300
                      ),
                      child: isFav[widget.favourite]?
                      const Icon(Icons.favorite,color: Colors.red,):

                       Icon(Icons.favorite,color: Colors.grey.shade100,),
                    ),
                  )

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
List<bool> isFav=[];