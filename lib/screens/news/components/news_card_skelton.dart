import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsCardSkelton extends StatelessWidget {
  const NewsCardSkelton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: EdgeInsets.only(left: 10),

        child: Column(
          children:
          List.generate(5,
                (index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Skelton(
                    width: 150,
                    height: 110,
                  ),
                  SizedBox(width: 10,),
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Skelton(
                        width: 240,
                      ),
                      SizedBox(height: 5,),
                      Skelton(
                        width: 200,
                      ),
                      SizedBox(height: 15,),
                      Skelton(
                        width: 210,
                      ),
                      SizedBox(height: 5,),
                      Skelton(
                        width: 200,
                      ),
                    ],
                  ),

                  ),
                ],
              ),
            ),)
          ,
        )
    );
  }
}

class Skelton extends StatelessWidget {
  const Skelton({
    super.key, this.height, this.width,
  });
  final double? height, width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.04),
          borderRadius: BorderRadius.circular(20)
      ),
    );
  }
}