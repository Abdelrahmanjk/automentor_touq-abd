import 'package:auto_mentorx/size_config.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/Cart.dart';

class CartCard extends StatefulWidget {
  const CartCard({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  int counter=0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(widget.cart.product.images[0]),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: getProportionateScreenWidth(225),
              child: Text(
                widget.cart.product.title,
                style: const TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 2,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: getProportionateScreenWidth(225),
              child: Row(
                children: [
                  Text.rich(
                    TextSpan(
                      text: "\$${widget.cart.product.price}",
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, color: kPrimaryColor),
                      children: [
                        TextSpan(
                            text: " x${widget.cart.numOfItem}",
                            style: Theme.of(context).textTheme.bodyLarge),
                      ],
                    ),
                  ),
                  Spacer(),
                  // InkWell(
                  //     onTap: (){
                  //       if(counter>0)counter--;
                  //       else demoCarts.remove(widget.cart.product);
                  //       setState(() {
                  //
                  //       });
                  //     },
                  //     child: Text('-',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold))),
                  // SizedBox(width: getProportionateScreenWidth(10),),
                  // Text(counter.toString(),style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
                  // SizedBox(width: getProportionateScreenWidth(10),),
                  // InkWell(
                  //     onTap: (){
                  //       counter++;
                  //       setState(() {
                  //
                  //       });
                  //     },
                  //     child: Text('+',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
