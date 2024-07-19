import 'package:flutter/material.dart';
import 'package:auto_mentorx/screens/cart/cart_screen.dart';

import '../../../size_config.dart';
import '../../home/components/icon_btn_with_counter.dart';
import 'news_search_field.dart';


class NewsHeader extends StatelessWidget {
  const NewsHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NewsSearchField(),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Bell.svg",
            numOfitem: 3,
            press: () {},
          ),
        ],
      ),
    );
  }
}
