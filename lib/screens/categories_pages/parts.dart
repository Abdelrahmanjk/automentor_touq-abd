import 'package:flutter/material.dart';

import '../../components/product_card.dart';
import '../../models/Product.dart';
import '../../size_config.dart';

class PartsPage extends StatelessWidget {
  static String routeName = "/Parts";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parts Accessories'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Set the number of columns you want
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 40.0,
            mainAxisExtent: 250
          ),
          itemCount: demoProducts.length,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: ProductCard(
                product: demoProducts[index],
                favourite: index,
              ),
            );
          },
        ),
      ),
    );
  }
}
